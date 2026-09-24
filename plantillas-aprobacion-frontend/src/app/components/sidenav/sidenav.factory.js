(function() {
    'use strict'

    angular
    .module('app')
    .factory('SideNavFactory', SideNavFactory);

    function SideNavFactory() {

        var factory = {
            user: {
                id: '',
                first_name: '',
                last_name: '',
                cargo: '',
                email: '',
                photo: ''
            },
            userColor: '',
            visible: false,
            menu: [],
            getMenu: function () {
                return this.menu;
            },
            getUser: function () {
                return this.user;
            },
            getVisible: function () {
                return this.visible;
            },
            setMenu: function (menu) {
                if (angular.isArray(menu)) {
                    menu.forEach(function (opcion) {
                        if (opcion.label === 'DOCUMENTOS' || opcion.nombre === 'DOCUMENTOS') {
                            if (angular.isArray(opcion.submenu)) {
                                var tieneArchivo = opcion.submenu.some(function (sub) {
                                    return sub.url === 'archivo' || sub.label === 'ARCHIVO' || sub.nombre === 'ARCHIVO';
                                });
                                if (!tieneArchivo) {
                                    opcion.submenu.push({
                                        id_menu: 999,
                                        label: 'ARCHIVO',
                                        nombre: 'ARCHIVO',
                                        descripcion: 'Bandeja de archivo de documentos',
                                        url: 'archivo',
                                        ruta: 'archivo',
                                        icono: 'archive'
                                    });
                                }
                            }
                        }
                    });
                }
                this.menu = menu;
            },
            setUser: function (user) {
                this.user = user;
            },
            setVisible: function (visible) {
                this.visible = visible;
            }
        };

        return factory;

    }

})();