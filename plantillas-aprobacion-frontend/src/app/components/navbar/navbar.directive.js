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
            controller: ['ExpirationTime', '$location', 'Storage', 'SideNavFactory', 'Util', 'DataService', '$window', 'restUrl', '$rootScope', NavbarController],
            controllerAs: 'vm',
            bindToController: true
        }

        return directive

        function NavbarController(ExpirationTime, $location, Storage, SideNavFactory, Util, DataService, $window, restUrl, $rootScope) {
            vm.isHomeState = function() {
                var path = ($location.path() || '').trim();
                var stateName = ($rootScope.$state && $rootScope.$state.current) ? $rootScope.$state.current.name : '';
                return !path || path === '/' || path === '/inicio' || path === '' || path === '/home' || stateName === 'home' || stateName === 'inicio';
            };

            vm.goHome = function() {
                $location.path('/');
            };

            vm.getModuleTitle = function() {
                var path = $location.path().replace('/', '');
                var titles = {
                    'documentos': 'Documentos',
                    'aprobacion': 'Documentos Pendientes',
                    'firmar': 'Pendientes de Firma',
                    'archivo': 'Archivo General',
                    'catalogos': 'Catálogos Generales',
                    'usuario': 'Gestión de Usuarios',
                    'unidad': 'Unidades Organizacionales',
                    'monitoreo': 'Monitoreo de Flujos',
                };
                if (!path || path === 'inicio' || path === 'home') return '';
                return titles[path] || (path ? path.charAt(0).toUpperCase() + path.slice(1) : '');
            };

            vm.toggle = function () {
                angular.element('#sidenav-main').toggleClass('collapsed');
            }

            vm.openMenu = function ($mdOpenMenu, ev) {
                $mdOpenMenu(ev);
            }

            vm.profile = function () {
                $location.path("profile");
            }

            vm.settings = function () {
                $location.path("configuracion");
            }

            vm.getUser = function() {
                if (Storage.existUser()) return Storage.getUser() || {};
                try {
                    return SideNavFactory.getUser() || {};
                } catch(e) {
                    return {};
                }
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
                return user.first_name || user.username || user.usuario || 'Usuario';
            };

            vm.getUserCargo = function() {
                var user = vm.getUser();
                if (user.cargo && user.cargo.trim()) return user.cargo;
                if (user.persona && user.persona.cargo) return user.persona.cargo;
                return 'Sin cargo';
            };

            vm.getUserPhoto = function() {
                var user = vm.getUser();
                return user.foto_url || user.foto || (user.persona && user.persona.foto) || '';
            };

            vm.getUserInitial = function() {
                var name = vm.getUserFullName();
                return name && name.length ? name[0].toUpperCase() : 'U';
            };

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
