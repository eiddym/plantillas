(function () {
    'use strict';

    angular
        .module('app')
        .constant('charColors', {
            bo: {
                rojo: '#ef4444',
                azul: '#0284c7',
                amarillo: '#f59e0b',
                celeste: '#06b6d4',
                lila: '#8b5cf6',
                naranja: '#f97316',
                verde: '#10b981'
            },
            bg: {
                rojo: 'rgba(239, 68, 68, 0.15)',
                azul: 'rgba(2, 132, 199, 0.15)',
                amarillo: 'rgba(245, 158, 11, 0.15)',
                celeste: 'rgba(6, 182, 212, 0.15)',
                lila: 'rgba(139, 92, 246, 0.15)',
                naranja: 'rgba(249, 115, 22, 0.15)',
                verde: 'rgba(16, 185, 129, 0.15)'
            }
        })
        .directive('chartGraph', ['$timeout', '$window', function ($timeout, $window) {
            var options_default = {
                line: {
                    scales: {
                        yAxes: [{
                            ticks: {
                                beginAtZero:true
                            }
                        }],
                        xAxes: [{
                            ticks: {
                                autoSkip: false
                            }
                        }]
                    },
                    legend: {
                        labels: {
                            boxWidth: 15
                        }
                    },
                    tooltips: {
                        mode: 'x-axis'
                    }
                },
                bar: {
                    legend: {
                        labels: {
                            boxWidth: 15
                        }
                    },
                    scales: {
                        yAxes: [{
                            ticks: {
                                beginAtZero:true
                            }
                        }],
                        xAxes: [{
                            ticks: {
                                autoSkip: false
                            }
                        }]
                    }

                }
            };
            // Runs during compile
            return {
                scope: {
                    ancho: '=',
                    alto: '=',
                    tipo: '=',
                    datos: '=',
                    actualizar: '=', // flag disparador del watch actualizar
                    reiniciar: '=', // flag disparador del watch reiniciar
                    opciones: '='
                },
                restrict: 'E', // E = Element, A = Attribute, C = Class, M = Comment
                link: function (sc, elm, attrs, controller) { // eslint-disable-line no-unused-vars
                    $timeout(function () {
                        var canvas, xchart;
                        elm.wrap('<div></div>');
                        elm.parent().css('overflow','auto');
                        // elm.parent().css('border','1px solid #c3c3c3');
                        // elm.parent().css('box-shadow','3px 3px 3px 0 solid #e3e3e3');

                        iniciar();
                        /**
                          Funcion que inicia o reinicia el componente chart
                        */
                        function isMobile() { return angular.isDefined($window.orientation); }

                        function iniciar() {
                            if(isMobile()){
                                if(sc.ancho>750) sc.ancho=750;
                                if(sc.alto>320) sc.alto=320;
                            }
                            elm.parent().css('width',((sc.ancho)||400));
                            elm.parent().css('height',((sc.alto)||250));
                            elm.html('<div class="chart-graph" style="width:'+(sc.ancho-25 || 400)+'px;height:'+(sc.alto-25||250)+'px;"><canvas></canvas></div>');
                            canvas = elm.children('div').children('canvas');
                            canvas.attr('width',(sc.ancho-20||400));
                            canvas.attr('height',(sc.alto-20||250));
                            xchart = new Chart(canvas, { // eslint-disable-line no-undef
                                type: sc.tipo || 'line',
                                data: sc.datos,
                                options: sc.opciones || options_default[sc.tipo || 'line']
                            });
                        }
                        /**
                          Funcion que se debe activar cambiando solo datos o labels del objeto sc.datos
                          vm.ch.datos.labels.shift();
                          vm.ch.datos.labels.push(newRandom()+'-02-2017');
                          vm.ch.datos.datasets[0].data.shift();
                          vm.ch.datos.datasets[0].data.push(newRandom());
                          o bien actuializar los arrays completos
                          vm.chart.datos.labels = createLabels(anio,mes);
                          vm.chart.datos.datasets[0].data = getDataRandom(vm.chart.datos.labels.length);
                        */
                        sc.$watch('actualizar', function () { if(angular.isDefined(sc.actualizar)) xchart.update(); })
                        /**
                          Funcion que reinicia el objeto xchart con los parametros ocnfigurados (mas que todo cuando se quiere cambiar de tipo)
                        */
                        sc.$watch('reiniciar', function () { if(angular.isDefined(sc.reiniciar)) iniciar(); });

                    })
                }
            };
        }]);

})();
