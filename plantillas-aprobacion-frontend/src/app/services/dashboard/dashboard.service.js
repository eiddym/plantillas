(function() {
  'use strict';

  angular
    .module('app')
    .factory('DashboardService', DashboardService);

  /** @ngInject */
  function DashboardService($q, DataService, restUrl, Storage) {
    var service = {
      getResumen: getResumen
    };

    return service;

    function getResumen() {
      var cuenta = Storage.getUser() || {};
      var usuarioId = cuenta.id_usuario || cuenta.id || 1;

      var urlArchivo = restUrl + 'plantillasFormly/documento/' + usuarioId + '/archivo';

      var defer = $q.defer();

      DataService.get(urlArchivo)
        .then(function(res) {
          var lista = (res && res.datos && res.datos.resultado) ? res.datos.resultado : [];
          
          var docsConCite = lista.filter(function(d) { return d && d.nombre && d.nombre.indexOf('/') !== -1; });
          var pendientes = lista.filter(function(d) { return d && (d.estado === 'ENVIADO' || d.estado === 'DERIVADO' || d.estado === 'PENDIENTE'); });
          var porFirmar = lista.filter(function(d) { return d && (d.estado === 'EN_FIRMA' || d.estado === 'POR_FIRMAR' || d.estado === 'DERIVADO'); });
          var expedientes = lista.filter(function(d) { return d && d.documento_padre; });

          var recientes = docsConCite.slice(0, 5);

          var catalogos = [
            { id: 1, nombre: 'Formularios Oficiales', total: docsConCite.length, icon: 'folder', color: 'teal', state: 'plantillas' },
            { id: 2, nombre: 'Catálogos Generales', total: 12, icon: 'list_alt', color: 'indigo', state: 'catalogos' },
            { id: 3, nombre: 'Archivos y Flujos', total: expedientes.length, icon: 'archive', color: 'blue', state: 'archivo' }
          ];

          defer.resolve({
            documentos: docsConCite.length,
            pendientes: pendientes.length,
            porFirmar: porFirmar.length,
            expedientes: expedientes.length,
            documentosRecientes: recientes,
            catalogos: catalogos
          });
        })
        .catch(function() {
          // Fallback en caso de error o sin conexión
          defer.resolve({
            documentos: 0,
            pendientes: 0,
            porFirmar: 0,
            expedientes: 0,
            documentosRecientes: [],
            catalogos: []
          });
        });

      return defer.promise;
    }
  }

})();
