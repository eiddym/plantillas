(function() {
  'use strict';

  angular
    .module('app', [
      'ngSanitize',
      'ui.router',
      'ngMaterial',
      'md.data.table',
      'formlyMaterial',
      'satellizer',
      'dndLists',
      'angularFileUpload',
      'leaflet-directive',
      'rzModule',
      'angular-timeline',
      'naif.base64',
      'angular-bind-html-compile',
      'ngCsv'
    ])
    .run(function($rootScope, $location, $state) {
      function checkIsHome() {
        var path = ($location.path() || '').trim();
        var stateName = ($state && $state.current) ? $state.current.name : '';
        return !path || path === '/' || path === '/inicio' || path === '' || path === '/home' || stateName === 'home' || stateName === 'inicio' || ($state && $state.includes && ($state.includes('home') || $state.includes('inicio')));
      }

      $rootScope.isHomeState = checkIsHome;
      $rootScope.isHome = checkIsHome;

      $rootScope.$on('$stateChangeSuccess', function(event, toState) {
        var isHome = checkIsHome();
        $rootScope.currentStateName = toState ? toState.name : '';

        if (isHome) {
          angular.element('body').addClass('state-home');
        } else {
          angular.element('body').removeClass('state-home');
        }
      });
    });

})();
