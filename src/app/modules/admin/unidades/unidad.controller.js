(function() {
    'use strict';

    angular
        .module('app')
        .controller('UnidadController', UnidadController);

    /** @ngInject */
    function UnidadController(restUrl, Storage) {
        var vm = this;

        vm.title = 'Unidades';
        vm.url = restUrl + 'seguridad/unidad';
        vm.fields = ['id_unidad', 'nombre', 'abreviacion', 'estado', '_fecha_creacion', '_fecha_modificacion'];
        vm.template = 'app/modules/admin/unidades/dialog.unidad.html';
        
        var cuenta = Storage.getUser();
        vm.usuario = cuenta.id;

        vm.permission = {
            create: true,
            update: true,
            delete: true
        };
    }
})();
