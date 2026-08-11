(function() {
    'use strict';

    angular
    .module('app')
    .factory('ExpirationTime', [
        'Storage',
        'Message',
        '$interval',
        '$auth',
        '$location',
        '$mdDialog',
        'DataService',
        'restUrl',
        '$document',
        '$q',
        ExpirationTimeFactory
    ]);

    /** @ngInject */
    function ExpirationTimeFactory(
        Storage,
        Message,
        $interval,
        $auth,
        $location,
        $mdDialog,
        DataService,
        restUrl,
        $document,
        $q
    ) {
        var IDLE_MINUTES = 15;
        var WARNING_SECONDS = 120;
        var AUTO_SAVE_MINUTES = 10;
        var ACTIVITY_THROTTLE_MS = 10000;
        var TOKEN_REFRESH_MS = 5 * 60 * 1000;

        var factory = {
            interval: undefined,
            time: null,
            init: init,
            stopInterval: stopInterval,
            refreshToken: refreshToken,
            guardar: undefined,
            autoSaveInterval: undefined,
            initAutoSave: initAutoSave,
            stopAutoSave: stopAutoSave,
            getExpirationTime: getExpirationTime,
            logout: logout
        };

        var fac = factory;
        var lastActivity = null;
        var lastActivityEvent = 0;
        var lastTokenRefresh = 0;
        var warningShown = false;
        var logoutInProgress = false;
        var pendingSave = null;
        var activityEvents = 'click keydown touchstart scroll mousemove';

        return factory;

        function init() {
            if (angular.isDefined(fac.interval)) {
                return;
            }

            lastActivity = Date.now();
            lastActivityEvent = 0;
            lastTokenRefresh = 0;
            warningShown = false;
            logoutInProgress = false;
            pendingSave = null;

            $document.on(activityEvents, activityHandler);

            fac.time = IDLE_MINUTES * 60;

            fac.interval = $interval(function() {
                checkInactivity();
            }, 1000);
        }

        function checkInactivity() {
            if (!lastActivity) {
                lastActivity = Date.now();
            }

            var elapsed = Math.floor((Date.now() - lastActivity) / 1000);
            fac.time = (IDLE_MINUTES * 60) - elapsed;

            if (fac.time <= WARNING_SECONDS && !warningShown) {
                warningShown = true;

                Message.warning(
                    'Su sesión finalizará en aproximadamente 2 minutos por inactividad. Se guardará el documento antes de cerrar la sesión.',
                    null,
                    0
                );

                pendingSave = saveBeforeLogout();
            }

            if (fac.time <= 0) {
                logout(true);
            }
        }

        function activityHandler(event) {
            if (!angular.isDefined(fac.interval) || logoutInProgress) {
                return;
            }

            var now = Date.now();

            if (
                event &&
                event.type === 'mousemove' &&
                now - lastActivityEvent < ACTIVITY_THROTTLE_MS
            ) {
                return;
            }

            lastActivityEvent = now;
            lastActivity = now;
            fac.time = IDLE_MINUTES * 60;
            warningShown = false;

            if (now - lastTokenRefresh >= TOKEN_REFRESH_MS) {
                lastTokenRefresh = now;
                refreshToken();
            }
        }

        function getExpirationTime() {
            var payload = $auth.getPayload();

            if (payload && angular.isNumber(payload.tiempo)) {
                return payload.tiempo;
            }

            return IDLE_MINUTES;
        }

        function stopInterval() {
            if (angular.isDefined(fac.interval)) {
                $interval.cancel(fac.interval);
                fac.interval = undefined;
            }

            $document.off(activityEvents, activityHandler);
        }

        function stopAutoSave() {
            if (angular.isDefined(fac.autoSaveInterval)) {
                $interval.cancel(fac.autoSaveInterval);
                fac.autoSaveInterval = undefined;
            }
        }

        function initAutoSave(funcionGuardar, enviado) {
            fac.guardar = angular.isFunction(funcionGuardar)
                ? funcionGuardar
                : function() {
                    return $q.when();
                };

            if (enviado) {
                stopAutoSave();
                return;
            }

            if (angular.isUndefined(fac.autoSaveInterval)) {
                fac.autoSaveInterval = $interval(function() {
                    if (fac.time > WARNING_SECONDS && !logoutInProgress) {
                        saveDocument(false);
                    }
                }, AUTO_SAVE_MINUTES * 60 * 1000);
            }

            refreshToken();
        }

        function saveDocument(swLocation) {
            if (!angular.isFunction(fac.guardar)) {
                return $q.when();
            }

            try {
                var result = fac.guardar(false, swLocation);

                if (result && angular.isFunction(result.then)) {
                    return result;
                }

                return $q.when(result);
            } catch (error) {
                Message.error('No se pudo autoguardar el documento.');
                return $q.reject(error);
            }
        }

        function saveBeforeLogout() {
            if (pendingSave) {
                return pendingSave;
            }

            pendingSave = saveDocument(true).catch(function(error) {
                Message.error(
                    'No se pudo guardar automáticamente el documento antes de cerrar la sesión.'
                );

                return $q.reject(error);
            });

            return pendingSave;
        }

        function logout(swInactive) {
            if (logoutInProgress) {
                return;
            }

            logoutInProgress = true;
            fac.logoutInProgress = true;

            stopInterval();
            stopAutoSave();

            Storage.setSession('path', $location.path());

            var savePromise = pendingSave || $q.when();

            if (swInactive && !pendingSave) {
                savePromise = saveBeforeLogout();
            }

            savePromise
                .catch(function() {
                    // La sesión debe cerrarse aunque falle el autoguardado.
                    return null;
                })
                .then(function() {
                    if (swInactive) {
                        Message.warning(
                            'Su sesión ha sido cerrada automáticamente después de ' +
                            IDLE_MINUTES +
                            ' minutos de inactividad.',
                            null,
                            0
                        );
                    }

                    return $auth.logout();
                })
                .then(function() {
                    $location.path('login');
                    $mdDialog.hide();
                })
                .catch(function() {
                    $location.path('login');
                });
        }

        function refreshToken() {
            if (!angular.isDefined(fac.interval) || logoutInProgress) {
                return;
            }

            DataService.get(restUrl + 'refrescar')
                .then(function(respuesta) {
                    if (angular.isDefined(respuesta) && respuesta.token) {
                        $auth.setToken(respuesta.token);
                    }
                });
        }
    }
})();
