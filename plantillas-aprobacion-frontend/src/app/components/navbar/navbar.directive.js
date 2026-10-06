(function() {
    'use strict'

    angular
    .module('app')
    .directive('acmeNavbar', acmeNavbar);

    /** @ngInject */
    function acmeNavbar() {
        var directive = {
            restrict: 'E',
            templateUrl: 'app/components/navbar/navbar.html',
            scope: {},
            controller: ['ExpirationTime', '$location', 'Storage', 'SideNavFactory', 'Util', 'DataService', '$window', 'restUrl', '$rootScope', 'BreadcrumbFactory', NavbarController],
            controllerAs: 'vm',
            bindToController: true
        }

        return directive

        /** @ngInject */
        function NavbarController(ExpirationTime, $location, Storage, SideNavFactory, Util, DataService, $window, restUrl, $rootScope, BreadcrumbFactory) {
            var vm = this;

            vm.isHomeState = function() {
                try {
                    if ($rootScope && angular.isFunction($rootScope.isHomeState)) {
                        return $rootScope.isHomeState();
                    }
                    var path = ($location.path() || '').trim();
                    var stateName = ($rootScope && $rootScope.$state && $rootScope.$state.current) ? $rootScope.$state.current.name : '';
                    return !path || path === '/' || path === '/inicio' || path === '' || path === '/home' || stateName === 'home' || stateName === 'inicio';
                } catch(e) {
                    return true;
                }
            };

            vm.goHome = function() {
                $location.path('/');
            };

            vm.getModuleTitle = function() {
                try {
                    var current = (BreadcrumbFactory && BreadcrumbFactory.getCurrent) ? BreadcrumbFactory.getCurrent() : '';
                    if (current && typeof current === 'string' && current.trim()) return current;

                    var path = ($location.path() || '').replace('/', '').trim().toLowerCase();
                    var titles = {
                        'documentos': 'Documentos',
                        'aprobacion': 'Documentos Pendientes',
                        'firmar': 'Pendientes de Firma',
                        'archivo': 'Archivo General',
                        'catalogos': 'Catálogos Generales',
                        'usuario': 'Gestión de Usuarios',
                        'usuarios': 'Gestión de Usuarios',
                        'unidad': 'Unidades Organizacionales',
                        'unidades': 'Unidades Organizacionales',
                        'monitoreo': 'Monitoreo de Flujos',
                        'profile': 'Perfil de Usuario',
                        'configuracion': 'Configuración'
                    };
                    if (!path || path === 'inicio' || path === 'home') return '';
                    return titles[path] || (path ? path.charAt(0).toUpperCase() + path.slice(1) : '');
                } catch(e) {
                    return '';
                }
            };

            vm.toggle = function () {
                angular.element('#sidenav-main').toggleClass('collapsed');
            }

            vm.openMenu = function ($mdOpenMenu, ev) {
                if (angular.isFunction($mdOpenMenu)) {
                    $mdOpenMenu(ev);
                }
            }

            vm.profile = function () {
                $location.path("profile");
            }

            vm.settings = function () {
                $location.path("configuracion");
            }

            vm.getUser = function() {
                try {
                    if (Storage && Storage.existUser()) {
                        var u = Storage.getUser();
                        if (u) return u;
                    }
                    if (SideNavFactory && SideNavFactory.getUser) {
                        var su = SideNavFactory.getUser();
                        if (su) return su;
                    }
                } catch(e) {}
                return {};
            };

            vm.getGreeting = function() {
                var hour = new Date().getHours();
                if (hour >= 6 && hour < 12) return 'Buenos días';
                if (hour >= 12 && hour < 19) return 'Buenas tardes';
                return 'Buenas noches';
            };

            vm.getUserFullName = function() {
                var user = vm.getUser();
                if (user.nombres) {
                    return (user.nombres + ' ' + (user.apellidos || '')).trim();
                }
                if (user.persona && user.persona.nombres) {
                    return (user.persona.nombres + ' ' + (user.persona.apellidos || '')).trim();
                }
                return user.first_name || user.username || user.usuario || 'system';
            };

            vm.getUserCargo = function() {
                var user = vm.getUser();
                if (user.cargo && typeof user.cargo === 'string' && user.cargo.trim()) return user.cargo;
                if (user.persona && user.persona.cargo) return user.persona.cargo;
                return 'Default system user';
            };

            vm.getUserPhoto = function() {
                var user = vm.getUser();
                return user.foto_url || user.foto || (user.persona && user.persona.foto) || '';
            };

            vm.getUserInitial = function() {
                var name = vm.getUserFullName();
                return (name && name.length) ? name[0].toUpperCase() : 'S';
            };

            vm.getFirstName = function () {
                var user = vm.getUser();
                return user.first_name || user.nombres || user.usuario || 'system';
            }

            vm.getColor = function () {
                return (SideNavFactory && SideNavFactory.userColor) ? SideNavFactory.userColor : 'primary';
            }

            vm.getInitial = function () {
                return vm.getUserInitial();
            }

            vm.logout = function () {
              var codigo = $window.localStorage.getItem('oauth2_state');
              if (codigo) {
                  // this.$log.log('------------------------------codigo', codigo);
                  DataService.get(restUrl + 'salir?codigo=' + codigo)
                  .then(function (response) {
                      $window.location.href = response.datos;
                  });
              } else {
                  ExpirationTime.logout();
              }
            }

            vm.fullscreen = function () {
                angular.element('body').toggleClass('fullscreen');
                Util.fullscreen();
            }

            vm.cambiarUsuario = function () {
                $location.path("elegir");
            }
        }
    }

})();



