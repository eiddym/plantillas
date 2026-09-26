(function() {
  'use strict';

  angular
    .module('app')
    .factory('DashboardService', DashboardService);

  /** @ngInject */
  function DashboardService($http, restUrl) {
    var service = {
      getResumen: getResumen
    };

    return service;

    function getResumen() {
      return $http.get(restUrl + 'dashboard/resumen')
        .then(function(res) {
          if (res.data && res.data.datos && res.data.datos.contadores) {
            return res.data.datos.contadores;
          }
          return {};
        })
        .catch(function(err) {
          console.warn('[DashboardService] Error al cargar resumen', err);
          return {};
        });
    }
  }

})();
