(function() {
    'use strict'

    angular
    .module('app')
    .directive('acmeSidenav', SidenavDirective);

    /** @ngInject */
    function SidenavDirective() {
        var directive = {
            restrict: 'E',
            templateUrl: 'app/components/sidenav/sidenav.html',
            scope: {},
            controller: ['$timeout', '$mdSidenav', 'SideNavFactory', '$location', 'Storage', 'Util', 'BreadcrumbFactory', '$log', '$window', '$http', 'restUrl', '$rootScope', SidenavController],
            controllerAs: 'vm',
            bindToController: true,
            link: function(scope, elem) {
                var $sidenav = elem

                $sidenav.on('click', '.md-button-href', function () {
                    $sidenav.find('.md-button-href').removeClass('active');
                    angular.element(this).addClass('active');
                })

                $sidenav.on('click', '.md-button-toggle', function () {
                    if ($sidenav.hasClass('collapsed')) {
                        return false;
                    }
                    $sidenav.find('.sidenav-sublist').slideUp(300);
                    $sidenav.find('.sidenav-list > li').removeClass('active');

                    var $this = angular.element(this);
                    $this.addClass('active');
                    if(!$this.next().is(":visible")) {
                        $this.next().slideToggle(300);
                        $this.closest('li').addClass('active');
                    }
                })
            }
        }

        return directive

        /** @ngInject */
        function SidenavController($timeout, $mdSidenav, SideNavFactory, $location, Storage, Util, BreadcrumbFactory, $log, $window, $http, restUrl, $rootScope) {
            var vm = this;
            var color = ['info', 'success', 'danger', 'warning', 'primary'];

            vm.user = Storage.existUser() ? Storage.getUser() : {};
            vm.menu = [];

            vm.abrirSelectorFoto = function() {
                angular.element('#sidenav-photo-input').click();
            };

            vm.subirFotoArchivo = function(files) {
                if (!files || !files.length) return;
                var file = files[0];
                var formData = new FormData();
                formData.append('foto', file);

                var userId = vm.user.id || vm.user.id_usuario || 1;
                $http.post(restUrl + 'usuarios/' + userId + '/foto', formData, {
                    transformRequest: angular.identity,
                    headers: { 'Content-Type': undefined }
                }).then(function(res) {
                    if (res.data && res.data.datos && res.data.datos.foto) {
                        var fotoUrl = res.data.datos.foto;
                        vm.user.foto = fotoUrl;
                        vm.user.foto_url = fotoUrl;
                        
                        var storedUser = Storage.getUser() || {};
                        storedUser.foto = fotoUrl;
                        storedUser.foto_url = fotoUrl;
                        Storage.setUser(storedUser);
                        if ($rootScope.currentUser) {
                            $rootScope.currentUser.foto = fotoUrl;
                        }
                        if (Util && Util.mensajeExito) {
                            Util.mensajeExito('Foto de perfil actualizada correctamente');
                        }
                    }
                }).catch(function(err) {
                    if (Util && Util.mensajeError) {
                        Util.mensajeError('Error al subir la foto de perfil');
                    }
                });
            };

            vm.getMenuIconColor = function(label, url) {
                var key = (label || '').toUpperCase();
                var u = (url || '').toLowerCase();
                if (u === 'documentos') return '#2563eb';
                if (u === 'aprobacion') return '#f59e0b';
                if (u === 'firmar') return '#8b5cf6';
                if (u === 'archivo') return '#64748b';
                if (u === 'catalogos') return '#0d9488';
                if (u === 'compartidos') return '#0d9488';
                if (u === 'usuario') return '#10b981';
                if (u === 'rol') return '#8b5cf6';
                if (u === 'menu') return '#f59e0b';
                if (u === 'unidad') return '#2563eb';
                if (key.indexOf('DOC') !== -1) return '#2563eb';
                if (key.indexOf('CAT') !== -1) return '#0d9488';
                if (key.indexOf('ADM') !== -1) return '#10b981';
                if (key.indexOf('CONF') !== -1) return '#64748b';
                return '#00e5ff';
            };

            vm.getMenuIcon = function(opcion) {
                var url = (opcion.url || '').toLowerCase();
                var label = (opcion.label || '').toUpperCase();
                var icons = {
                    'documentos': 'description',
                    'aprobacion': 'schedule',
                    'firmar': 'edit_note',
                    'aprobar_documento': 'fingerprint',
                    'archivo': 'inventory_2',
                    'catalogos': 'folder',
                    'compartidos': 'share',
                    'usuario': 'people',
                    'rol': 'security',
                    'menu': 'list_alt',
                    'unidad': 'business',
                    'plantillas': 'view_quilt',
                    'contactos': 'contacts'
                };
                if (icons[url]) return icons[url];
                if (label.indexOf('DOC') !== -1) return 'folder';
                if (label.indexOf('CAT') !== -1) return 'folder_special';
                if (label.indexOf('ADM') !== -1) return 'settings';
                if (label.indexOf('CONF') !== -1) return 'build';
                return opcion.icon || 'folder';
            };

            vm.toggleLeft = buildDelayedToggler('left');

            vm.send = function (url, submenu) {
                if (typeof submenu == 'undefined') {
                    if (Storage.exist('menu')) {
                        var page = Util.getMenuOption(Storage.getSession('menu'), url);
                        BreadcrumbFactory.setParent(page[0]);
                        BreadcrumbFactory.setCurrent(page[1]);
                    }
                    Storage.setSession('last_route', url);
                    
                    if ($window.innerWidth <= 768) {
                        $mdSidenav('left').close();
                    }
                    $location.path(url);
                }
                vm.reset();
            }

            vm.reset = function () {
                angular.element('#toast-container-main').find('md-toast').fadeOut();
            }

            activate();

            function activate() {
                if(Storage.existUser()) {
                    SideNavFactory.setUser(Storage.getUser());
                    SideNavFactory.setMenu(Storage.getSession('menu'));
                }
                vm.menu = SideNavFactory.getMenu();
                Storage.setSession('menu', vm.menu);

                vm.active = $location.path().replace('/', '');
                SideNavFactory.userColor = color[parseInt(Math.random()*color.length)];

                $timeout(function () {
                    angular.element('#sidenav').find('.md-button-href.active').parent().parent().prev().click();
                }, 1000);
            }

            vm.getColor = function () {
                return SideNavFactory.userColor;
            }

            vm.getName = function () {
                var user = SideNavFactory.getUser();
                if (!user) return '';
                var firstName = (user.first_name || '').trim();
                var lastName = (user.last_name || '').trim();
                var username = (user.username || '').trim();

                if (firstName && firstName.toLowerCase() === username.toLowerCase()) {
                    return lastName || firstName;
                }
                if (firstName && lastName && lastName.toLowerCase().indexOf(firstName.toLowerCase()) !== -1) {
                    return lastName;
                }
                return (firstName + (lastName ? ' ' + lastName : '')).trim() || username;
            }

            vm.getEmail = function () {
                return SideNavFactory.getUser().email;
            }

            vm.getInitial = function () {
                var name = vm.getName();
                return name && name.length ? name[0].toUpperCase() : '?';
            }

            vm.getMenu = function () {
                return SideNavFactory.getMenu();
            }

            /**
            * Supplies a function that will continue to operate until the
            * time is up.
            */
            function debounce(func, wait) {
                var timer
                return function debounced() {
                    var context = vm,
                    args = Array.prototype.slice.call(arguments);
                    $timeout.cancel(timer);
                    timer = $timeout(function() {
                        timer = undefined;
                        func.apply(context, args);
                    }, wait || 10);
                }
            }
            /**
            * Build handler to open/close a SideNav when animation finishes
            * report completion in console
            */
            function buildDelayedToggler(navID) {
                return debounce(function() {
                    $mdSidenav(navID)
                    .toggle()
                    .then(function () {
                        $log.debug("toggle " + navID + " is done");
                    })
                }, 200);
            }
        }
    }
})();
