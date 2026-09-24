(function() {
  'use strict';

  angular
    .module('app')
    .config(ThemeConfig);

    /** @ngInject */
    function ThemeConfig($mdThemingProvider) {
        
        $mdThemingProvider.theme('default')
                .primaryPalette('light-blue')
                .accentPalette('cyan');
               
    }

})();
