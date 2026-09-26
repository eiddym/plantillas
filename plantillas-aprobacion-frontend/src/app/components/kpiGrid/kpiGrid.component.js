(function() {
  'use strict';

  angular
    .module('app')
    .component('kpiGrid', {
      templateUrl: 'app/components/kpiGrid/kpiGrid.html',
      bindings: {
        kpis: '<'
      },
      controller: ['$state', KpiGridController]
    });

  /** @ngInject */
  function KpiGridController($state) {
    var $ctrl = this;

    $ctrl.ir = function(kpi) {
      if (kpi && kpi.ruta) {
        $state.go(kpi.ruta, kpi.params || {});
      }
    };
  }

})();
