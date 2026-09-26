
(function() {
  'use strict';

  angular
    .module('app')
    .run(runBlock);

  /** @ngInject */
    function runBlock(Storage, $location, $log, PageNoLogin, $window, Datetime, $mdDialog, RouteValidator, formlyConfig, MyFormlyConfig, ExpirationTime, $rootScope) {
        RouteValidator.init();
        MyFormlyConfig.init(formlyConfig);

        $rootScope.isHomeState = function() {
            var path = ($location.path() || '').trim();
            var stateName = ($rootScope.$state && $rootScope.$state.current) ? $rootScope.$state.current.name : '';
            return !path || path === '/' || path === '/inicio' || path === '' || path === '/home' || stateName === 'home' || stateName === 'inicio';
        };

        function updateBodyState() {
            var isHome = $rootScope.isHomeState();
            if (isHome) {
                angular.element('body').addClass('is-home-state').removeClass('is-module-state');
            } else {
                angular.element('body').removeClass('is-home-state').addClass('is-module-state');
            }
        }

        $rootScope.$on('$locationChangeSuccess', updateBodyState);
        $rootScope.$on('$stateChangeSuccess', function(ev, toState) {
            if (toState && toState.name) {
                var isHome = toState.name === 'home' || toState.name === 'inicio' || toState.url === '/' || toState.url === '/inicio';
                if (isHome) {
                    angular.element('body').addClass('is-home-state').removeClass('is-module-state');
                } else {
                    angular.element('body').removeClass('is-home-state').addClass('is-module-state');
                }
            } else {
                updateBodyState();
            }
        });
        updateBodyState();

        var $container = angular.element('#container-main');
        var $document = $window.document;

        // Collapsed Panel
        $container.on('click', '.btn-collapsed', function () {
            var $el = angular.element(this)
            $el.parent().parent().next().slideToggle()
            $el.toggleClass('rotate')
        })

        var $toasts = angular.element('#toast-container-main')
        $toasts.on('click', '.md-toast-close', function () {
            angular.element(this).parent().parent().parent().fadeOut()
        });

        // Redirect
        if (!Storage.existUser()) {
            var path = $location.path();
            // $log.log('Revisando el path', path);
            if (!exist(path)) {
                if (path.length) Storage.setSession('path', path.replace('/', ''));                
                if (Storage.getSession('path') !== 'verificar') $location.path('login');
            }
        } else {
            ExpirationTime.init();
        }

        function exist(path) {
            var paths = PageNoLogin;
            for (var i in paths) {
                if (path.indexOf('/' + paths[i]) == 0 || path.indexOf('/' + paths[i] + '/') == 0) {
                    return true;
                }
            }
            return false;
        }

        //Fullscreen
        function exitFullScreen () {
            angular.element('body').removeClass('fullscreen');
        }

        angular.element($window.document).on('keyup', function(e) {
            if (e.keyCode == 27) {
                exitFullScreen();
            }
        });

        $document.addEventListener("mozfullscreenchange", function () {
            if (!$document.mozFullScreen) {
                exitFullScreen();
            }
        }, false);

    }

})();
