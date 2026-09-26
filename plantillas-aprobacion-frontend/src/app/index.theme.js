(function() {
  'use strict';

  angular
    .module('app')
    .config(ThemeConfig);

    /** @ngInject */
    function ThemeConfig($mdThemingProvider) {
        $mdThemingProvider.theme('default')
                .primaryPalette('blue-grey', {
                  'default': '900',
                  'hue-1': '800',
                  'hue-2': '700',
                  'hue-3': '600'
                })
                .accentPalette('cyan', {
                  'default': 'A400',
                  'hue-1': 'A200',
                  'hue-2': 'A700'
                })
                .warnPalette('red');
    }

})();

