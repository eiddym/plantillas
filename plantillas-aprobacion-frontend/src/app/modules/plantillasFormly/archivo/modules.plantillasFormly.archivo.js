(function () {
  'use strict';

  angular
    .module('app')
    .controller('ArchivoController', ArchivoController);

  /** @ngInject */
  function ArchivoController(DataService, restUrl, Storage, $location, Documento) {
    var vm = this;
    var cuenta = Storage.getUser();
    vm.usuario = cuenta.id;
    
    var esAdminOMae = cuenta.username === 'admin' || cuenta.es_mae === true || (cuenta.roles && cuenta.roles.some(function(r) { return r.rol && r.rol.nombre === 'SUPERADMIN'; }));
    vm.esAdminOMae = esAdminOMae;

    vm.titulo = esAdminOMae ? "Archivo General de Documentos (MAE / Admin)" : "Archivo de Documentos de la Unidad";
    vm.url = restUrl + 'plantillasFormly/documento/' + cuenta.id + '/archivo';

    vm.permission = {
      create: false,
      update: false,
      delete: false
    };

    vm.fields = [
      "id_documento",
      "nombre",
      "nombre_plantilla",
      "fecha",
      "estado",
      "_fecha_creacion"
    ];

    vm.buttons = [
      {
        tooltip: 'Ver Documento',
        icon: 'remove_red_eye',
        onclick: vistaPrevia
      },
      {
        tooltip: 'Ver Historial',
        icon: 'timeline',
        onclick: verProgreso
      }
    ];

    function vistaPrevia(pEvento, pIdentificador) {
      Documento.showPdfId(pIdentificador);
    }

    function verProgreso(pEvento, pIdentificador) {
      Documento.showProgressAll(pEvento, pIdentificador);
    }
  }
})();
