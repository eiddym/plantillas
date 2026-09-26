(function() {
  'use strict';

  angular
    .module('app', [
      'ngSanitize',
      'ui.router',
      'ngMaterial',
      'md.data.table',
      'formlyMaterial',
      'satellizer',
      'dndLists',
      'angularFileUpload',
      'leaflet-directive',
      'rzModule',
      'angular-timeline',
      'naif.base64',
      'angular-bind-html-compile',
      'ngCsv'
    ])
    .run(function($rootScope) {
      $rootScope.$on('$stateChangeSuccess', function(event, toState) {
        var isHome = !toState || toState.name === 'home' || toState.name === 'inicio' || toState.url === '/' || toState.url === '/inicio';
        $rootScope.isHomeState = isHome;
        $rootScope.currentStateName = toState ? toState.name : '';

        if (isHome) {
          angular.element('body').addClass('state-home');
        } else {
          angular.element('body').removeClass('state-home');
        }
      });
    });

})();
