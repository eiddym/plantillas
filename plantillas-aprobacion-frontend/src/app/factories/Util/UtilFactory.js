(function() {
    'use strict'

    angular
    .module('app')
    .factory('Util', ['$window', '$injector', UtilFactory]);

    /** @ngInject */
    function UtilFactory($window, $injector) {

        var $document = $window.document;

        var tmpl_print ='<!DOCTYPE html>' +
                        '<html lang="en">' +
                        '<head>' +
                            '<meta charset="UTF-8"/>' +
                            '<title>Document</title>' +
                            '<style>{css}</style>' +
                        '</head>' +
                        '<body>{body}' +
                        '</body>' +
                        '</html>';

        var factory = {
            toType: toType,
            isJson: isJson,
            getParams: getParams,
            print: print,
            fullscreen: fullscreen,
            nano: nano,
            popup: popup,
            filterFields: filterFields,
            addPropertiesFormly: addPropertiesFormly,
            size: size,
            getFkData: getFkData,
            serialize: serialize,
            serializeToJson: serializeToJson,
            getMenuOption: getMenuOption,
            searchField: searchField,
            lengthOptions: lengthOptions,
            formatDate: formatDate,
            filterItem: filterItem,
            getKeys: getKeys,
            getId: getId,
            parseSave: parseSave,
            truncate: truncate,
            loadCanvas: loadCanvas,
            stripHTML: stripHTML
        };

        return factory;

        function nano (template, data) {
            return template.replace(/\{([\w\.]*)\}/g, function (str, key) {
                var keys = key.split("."), v = data[keys.shift()];
                for (var i = 0, l = keys.length;i < l;i++)
                    v = v[keys[i]];
                return (typeof v !== "undefined" && v !== null) ? v : "";
            });
        }

        function toType (obj) {
            return ({}).toString.call(obj).match(/\s([a-zA-Z]+)/)[1].toLowerCase();
        }

        function isJson (text) {
            return /^[\],:{}\s]*$/.test(text.replace(/\\["\\\/bfnrtu]/g, '@').
                replace(/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g, ']').
                replace(/(?:^|:|,)(?:\s*\[)+/g, ''));
        }

        function truncate (text, length) {
            return text.length > length ? (text.substring(0, Math.min(length, text.length)) + '...') : text;
        }

        function stripHTML(texto) {
            return texto.replace(/(<([^>]+)>)/ig,"");
        }

        function getParams (p, args) {
            var first = p.first.defaultValue,
            second = p.second.defaultValue;

            p.first.position = p.first.position || 0;
            p.second.position = p.second.position || 1;

            var type = toType(args[p.first.position]);
            if (type != 'undefined') {
                if (type == p.first.type) {
                    first = args[p.first.position];
                    second = toType(args[p.second.position]) == p.second.type ? args[p.second.position] : p.second.defaultValue;
                } else {
                    if (type == p.second.type) {
                        first = toType(args[p.second.position]) == p.first.type ? args[p.second.position] : p.first.defaultValue;
                        second = args[p.first.position];
                    }
                }
            }
            return {
                first : first,
                second : second
            };
        }

        function print (html, css) {
            if (typeof css == 'string') {
                angular.element.get(css, function (response) {
                    var popup = $window.open('', 'print');
                    popup.document.write(nano(tmpl_print, {body : html, css : response}));
                    popup.document.close();
                    popup.focus();
                    popup.print();
                    popup.close();
                });
            } else {
                var popup = $window.open('', 'print');
                popup.document.write(nano(tmpl_print, {body : html, css : css}));
                popup.document.close();
                popup.focus();
                popup.print();
                popup.close();
            }

            return true;
        }

        function popup(url) {
            $window.open(url, 'print');
        }

        function fullscreen () {
            if (!$document.fullscreenElement &&    // alternative standard method
                !$document.mozFullScreenElement && !$document.webkitFullscreenElement && !$document.msFullscreenElement ) {  // current working methods
                if ($document.documentElement.requestFullscreen) {
                    $document.documentElement.requestFullscreen();
                } else if ($document.documentElement.msRequestFullscreen) {
                    $document.documentElement.msRequestFullscreen();
                } else if ($document.documentElement.mozRequestFullScreen) {
                    $document.documentElement.mozRequestFullScreen();
                } else if ($document.documentElement.webkitRequestFullscreen) {
                    $document.documentElement.webkitRequestFullscreen(Element.ALLOW_KEYBOARD_INPUT);
                }
            } else {
                if ($document.exitFullscreen) {
                    $document.exitFullscreen();
                } else if ($document.msExitFullscreen) {
                    $document.msExitFullscreen();
                } else if ($document.mozCancelFullScreen) {
                    $document.mozCancelFullScreen();
                } else if ($document.webkitExitFullscreen) {
                    $document.webkitExitFullscreen();
                }
            }
        }

        function filterFields(data, fields) {
            if (typeof fields == 'undefined' || fields.length == 0) {
                return data;
            }
            var filter = [];
            for (var i in fields) {
                var field = searchField(data, fields[i]);
                if (field) {
                    filter.push(field);
                }
            }
            return filter;
        }

        function searchField(fields, field) {
            for (var i in fields) {
                if (fields[i].key == field) {
                    return fields[i];
                }
            }
            return null;
        }

        function addPropertiesFormly(data, formly) {
            if (typeof formly == 'undefined' || formly.length == 0) {
                return data;
            }
            for (var i in data) {
                var field = searchField(formly, data[i].key);
                if (field) {
                    //data[i] = angular.element.extend(true, data[i], field);
                    data[i] = angular.element.extend(true, {}, data[i], field);
                }
            }
            return data;
        }

        function size(obj) {
            return Object.keys(obj).length;
        }

        function parseSave(data, formly) {
            var Datetime = $injector.get('Datetime');
            var item = {};
            for (var i in data) {
                if (toType(data[i]) == 'date') {
                    item[i] = Datetime.format(data[i], 'YYYY-MM-dd');
                } else {
                    if (typeof data[i] == 'string' && (data[i] == 'true' || data[i] == 'false')) {
                        item[i] = item[i] == 'true';
                    } else {
                        item[i] = data[i];
                    }
                }
            }
            item.id = getId(item, formly);
            return item;
        }

        function getId(item, formly, key) {            
            if (item) {
                for (var i in formly) {
                    if (formly[i].templateOptions.label && formly[i].templateOptions.label == 'ID') {
                        if (key) {
                            return formly[i].key;
                        } else {
                            return item[formly[i].key];
                        }
                    }
                }
            }
            return null;
        }

        function getFkData(fieldsData, key, value) {
            fieldsData.filter(function (e) {
                if (e.key == key && e.templateOptions.options) {
                    e.templateOptions.options.filter(function(elem) {
                        if (elem.value == value) {
                            value = elem.name;
                        }
                    })
                }
            });
            return value;
        }

        function serialize(json) {
            var string = [];
            for (var i in json) {
                string.push(i + '=' + json[i]);
            }
            return string.join('&');
        }

        function serializeToJson(json, limpiar) {
            var string = [];
            for (var i in json) {
                if(limpiar){
                    for (var j in json[i]) {
                        if ( json[i][j]==null || json[i][j]==undefined || json[i][j]=='' ) {
                            delete json[i][j];
                        }
                    }
                }
                if(Object.keys(json[i]).length > 0)
                    string.push(i + '=' + angular.toJson(json[i]));
            }
            return string.join('&');
        }

        function getMenuOption(menu, url) {
            for (var i in menu) {
                if (typeof menu[i].submenu != 'undefined') {
                    var pages = menu[i].submenu;
                    for (var j in pages) {
                        if (pages[j].url == url) {
                            return [menu[i].label, pages[j].label];
                        }
                    }
                }
            }
            for (var k in menu) {
                if (menu[k].url == url) {
                    return [menu[k].label, false];
                }
            }
            return [false,false];
        }

        function lengthOptions(data, key) {
            for (var i in data) {
                if (data[i].key == key && data[i].templateOptions && data[i].templateOptions.options) {
                    return data[i].templateOptions.options.length;
                }
            }
            return 0;
        }

        function formatDate(date) {
            date = date.split('-')
            return [date[2], date[1], date[0]].join('/');
        }

        function filterItem(data) {
            var Datetime = $injector.get('Datetime');            
            for (var i in data) {
                if (typeof data[i] == 'string') {
                    if (Datetime.isDate(data[i])) {
                      if (!(/^[0-9]\s*$/).test(data[i]))
                        data[i] = new Date();
                    } else if (!/[a-zA-Z]+/g.test(data[i]) && /^(?:(?:([01]?\d|2[0-3]):)?([0-5]?\d):)?([0-5]?\d)$/g.test(data[i]) && data[i].length == 8) {                        
                        data[i] = formatTime(data[i]);
                    }
                }
            }
            return data;
        }

        function formatTime(time) {
            time = time.split(':')
            return [time[0], time[1]].join(':')
        }

        function getKeys(data) {
            var types = {};

            data.map(function(el) {
                types[el.key] = el;
            });

            return types;
        }

    function loadCanvas(url, idCanvasContainer) {
    console.log("===> EJECUTANDO VISOR VERSION FINAL 2026 <====");
    console.log("PDF MOBILE DEBUG", {
        selector: idCanvasContainer,
        hasBuffer: !!url,
        bufferType: Object.prototype.toString.call(url),
        bufferBytes: url && (url.byteLength || url.length || 0),
        pdfjsLoaded: !!(window.pdfjsLib || window.PDFJS),
        worker: window.pdfjsLib && window.pdfjsLib.GlobalWorkerOptions
            ? window.pdfjsLib.GlobalWorkerOptions.workerSrc
            : null
    });

    var container = document.querySelector(idCanvasContainer);
    if (!container) {
        console.warn("loadCanvas: contenedor no encontrado:", idCanvasContainer);
        console.warn("  Esperando a que el contenedor se inserte en el DOM...");
        return;
    }
    
    // Limpiar contenedor y mostrar estado de carga
    container.innerHTML = '';
    var loaderDiv = document.createElement('div');
    loaderDiv.style.cssText = 'padding:16px;text-align:center;color:#999;font-size:14px';
    loaderDiv.textContent = 'Cargando PDF…';
    container.appendChild(loaderDiv);

    // ── NO tocar workerSrc ni disableWorker ──────────────────────────
    // El workerSrc ya está configurado en index.html apuntando al CDN.
    // Sobreescribirlo aquí es la causa del error WorkerMessageHandler.
    // ─────────────────────────────────────────────────────────────────

    // Convertir base64 a Uint8Array
    var pdfData;
    if (typeof url === 'string') {
        var base64String = url.indexOf('base64,') !== -1
            ? url.split('base64,')[1]
            : url;
        try {
            var binaryString = window.atob(base64String);
            var bytes = new Uint8Array(binaryString.length);
            for (var i = 0; i < binaryString.length; i++) {
                bytes[i] = binaryString.charCodeAt(i);
            }
            pdfData = { data: bytes };
        } catch (e) {
            console.error("Error decodificando base64:", e);
            return;
        }
    } else {
        pdfData = url; // ya es Uint8Array o ArrayBuffer
    }

function renderPage(page) {
    var containerWidth = container.offsetWidth
                      || container.parentElement && container.parentElement.offsetWidth
                      || container.closest('md-card-content') && container.closest('md-card-content').offsetWidth
                      || 600;

    var unscaledViewport = page.getViewport(1);
    var scale            = (containerWidth * 0.95) / unscaledViewport.width;
    var viewport         = page.getViewport(scale);

    var outputScale = window.devicePixelRatio || 1;

    var canvas = document.createElement('canvas');
    var ctx    = canvas.getContext('2d');

    canvas.width        = Math.floor(viewport.width  * outputScale);
    canvas.height       = Math.floor(viewport.height * outputScale);
    canvas.style.width  = '100%';
    canvas.style.height = 'auto';
    canvas.style.display = 'block';
    canvas.style.marginBottom = '8px';

    container.appendChild(canvas);

    page.render({
        canvasContext: ctx,
        transform: outputScale !== 1
            ? [outputScale, 0, 0, outputScale, 0, 0]
            : null,
        viewport: viewport
    });
}

    var pdfLib = window.pdfjsLib || window.PDFJS;

    if (pdfLib) {
        pdfLib.disableWorker = true;
    }
    if (!pdfLib || !pdfLib.getDocument) {
        console.error("loadCanvas: pdfjsLib no disponible");
        return;
    }

    pdfLib.getDocument(pdfData).promise.then(function(pdfDoc) {
        console.log("PDF leído con éxito. Páginas:", pdfDoc.numPages);
        for (var num = 1; num <= pdfDoc.numPages; num++) {
            pdfDoc.getPage(num).then(renderPage);
        }
    }).catch(function(err) {
        console.error("Error al leer PDF:", err);

        if (container) {
            var mensaje = err && err.message
                ? err.message
                : String(err);

            container.innerHTML =
                '<div class="pdf-mobile-error">' +
                'Error al visualizar el PDF:<br>' +
                '<small>' +
                mensaje.replace(/</g, '&lt;').replace(/>/g, '&gt;') +
                '</small>' +
                '</div>';
        }
    });
}

        return factory;
    }
})();
