/* global moment:false */
(function() {
  'use strict';

  angular
    .module('app')
    .constant('moment', moment)
    .constant('appName', 'app')
    .constant('PageNoLogin', ['login'])
    .constant('authUrl', '/ws/autenticar') // Auth
    .constant('restUrl', '/ws/api/v1/' ) // Rest Api Backend
    .constant('backUrl', '/ws/') // Backend
    .constant('reCaptchaSiteKey','6LevVJ0sAAAAAOigFDYLj4qNvSUFkpm0NuaJ4Sfs')
    .constant('maxPdfSizeAprobacion', 20971520) // Tamaño máximo del pdf para aprobaciones con ciudadania digital [bytes] 20971520 bytes=20MB
    .constant('maxSumPdfsSizeAprobacion', 31457280) // Tamaño máximo del total de archivos pdf para aprobaciones con ciudadania digital por documento [bytes] 31457280 = 30MB
})();
