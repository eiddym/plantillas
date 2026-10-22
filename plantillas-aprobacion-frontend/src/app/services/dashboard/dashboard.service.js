(function() {
  'use strict';

  angular
    .module('app')
    .factory('DashboardService', DashboardService);

  /** @ngInject */
  function DashboardService($http, restUrl, Storage) {
    var service = {
      getResumen: getResumen
    };

    return service;

    function getResumen() {
      var user = Storage.getUser() || {};
      var idUsuario = user.id || user.id_usuario || '';
      var url = restUrl + 'dashboard/resumen' + (idUsuario ? '?id_usuario=' + idUsuario : '');
      return $http.get(url)
        .then(function(res) {
          if (res.data && res.data.datos && res.data.datos.contadores) {
            return res.data.datos.contadores;
          }
          return {};
        })
        .catch(function() {
          return {};
        });
    }
  }

})();
