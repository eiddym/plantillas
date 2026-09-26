(function() {
  'use strict';

  angular
    .module('app')
    .controller('MainController', MainController);

  /** @ngInject */
  function MainController(DashboardService, Storage, Documento, $state) {
    var vm = this;

    vm.cargando = true;
    vm.usuario = Storage.getUser() || {};
    vm.saludo = obtenerSaludo();

    vm.kpis = [];
    vm.documentosRecientes = [];
    vm.catalogos = [];

    vm.vistaPrevia = vistaPrevia;
    vm.verProgreso = verProgreso;
    vm.irARuta = irARuta;

    // Cargar datos del dashboard
    cargarResumen();

    function cargarResumen() {
      vm.cargando = true;

      DashboardService.getResumen()
        .then(function(resumen) {
          vm.cargando = false;

          vm.kpis = [
            { icon: 'description',      color: 'blue',   valor: resumen.documentos,  label: 'Documentos Oficiales', ruta: 'archivo' },
            { icon: 'schedule',         color: 'amber',  valor: resumen.pendientes,  label: 'Trámites Pendientes',  ruta: 'aprobacion' },
            { icon: 'edit_note',        color: 'violet', valor: resumen.porFirmar,   label: 'Pendientes de Firma',  ruta: 'firmar' },
            { icon: 'folder_special',   color: 'indigo', valor: resumen.expedientes, label: 'Expedientes Vinculados', ruta: 'archivo' }
          ];

          vm.documentosRecientes = resumen.documentosRecientes || [];
          vm.catalogos = resumen.catalogos || [];
        })
        .catch(function() {
          vm.cargando = false;
        });
    }

    function obtenerSaludo() {
      var hora = new Date().getHours();
      if (hora < 12) return 'Buenos días';
      if (hora < 19) return 'Buenas tardes';
      return 'Buenas noches';
    }

    function vistaPrevia(ev, idDocumento) {
      if (ev && ev.stopPropagation) ev.stopPropagation();
      Documento.showPdfId(idDocumento);
    }

    function verProgreso(ev, idDocumento) {
      if (ev && ev.stopPropagation) ev.stopPropagation();
      Documento.showProgressAll(ev, idDocumento);
    }

    function irARuta(ruta, params) {
      if (ruta) {
        $state.go(ruta, params || {});
      }
    }
  }

})();
