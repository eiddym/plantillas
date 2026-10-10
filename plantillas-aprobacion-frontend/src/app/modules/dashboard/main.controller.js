(function() {
  'use strict';

  angular
    .module('app')
    .controller('MainController', MainController);

  /** @ngInject */
  function MainController(DashboardService, Storage, Documento, $state, $rootScope) {
    var vm = this;

    vm.cargando = true;
    vm.usuario = Storage.getUser() || {};
    vm.saludo = obtenerSaludo();

    $rootScope.$on('user:updated', function() {
      vm.usuario = Storage.getUser() || {};
    });

    vm.secciones = [];
    vm.vistaPrevia = vistaPrevia;
    vm.verProgreso = verProgreso;
    vm.irARuta = irARuta;

    var PARENT_COLOR_MAP = {
      'DOCUMENTOS': { color: 'blue', icon: 'description' },
      'CATALOGOS': { color: 'teal', icon: 'folder' },
      'ADMINISTRACIÓN': { color: 'green', icon: 'settings' },
      'CONFIGURACIÓN': { color: 'purple', icon: 'build' },
      'ARCHIVO': { color: 'slate', icon: 'archive' }
    };

    var ICON_COLOR_MAP = {
      'documentos': { icon: 'description', color: 'blue', countKey: 'documentos', desc: 'Mis documentos redactados' },
      'aprobacion': { icon: 'access_time', color: 'orange', countKey: 'pendientes', desc: 'Trámites en bandeja de derivación' },
      'firmar': { icon: 'edit', color: 'purple', countKey: 'firmas', desc: 'Pendientes de firma digital' },
      'aprobar_documento': { icon: 'fingerprint', color: 'indigo', countKey: 'firmas', desc: 'Aprobación con Ciudadanía' },
      'impresion': { icon: 'print', color: 'blue', countKey: 'documentos', desc: 'Impresión oficial de documentos' },
      'archivo': { icon: 'archive', color: 'slate', countKey: 'archivos', desc: 'Archivo digital emitido' },
      'catalogos': { icon: 'folder', color: 'teal', countKey: 'catalogos', desc: 'Tablas de datos y catálogos' },
      'compartidos': { icon: 'share', color: 'teal', countKey: 'compartidos', desc: 'Catálogos compartidos' },
      'usuario': { icon: 'group', color: 'green', countKey: 'usuarios', desc: 'Gestión de usuarios' },
      'rol': { icon: 'security', color: 'purple', countKey: 'roles', desc: 'Perfiles de permisos y roles' },
      'menu': { icon: 'menu', color: 'orange', countKey: 'menus', desc: 'Administración de menús' },
      'unidad': { icon: 'business', color: 'blue', countKey: 'unidades', desc: 'Estructura organizacional' },
      'plantillas': { icon: 'layers', color: 'teal', countKey: 'plantillas', desc: 'Formularios y plantillas' },
      'contactos': { icon: 'person', color: 'indigo', countKey: 'contactos', desc: 'Directorio de personal' }
    };

    // Cargar menú y resumen dinámico desde BD
    cargarDashboard();

    function cargarDashboard() {
      vm.cargando = true;
      var menuTree = Storage.getSession('menu') || [];

      DashboardService.getResumen()
        .then(function(contadores) {
          vm.cargando = false;
          vm.secciones = construirSecciones(menuTree, contadores || {});
        })
        .catch(function() {
          vm.cargando = false;
          vm.secciones = construirSecciones(menuTree, {});
        });
    }

    function construirSecciones(menuTree, contadores) {
      var secciones = [];
      if (!menuTree || !menuTree.length) return secciones;

      angular.forEach(menuTree, function(padre) {
        if (padre.submenu && padre.submenu.length) {
          var secItems = [];
          angular.forEach(padre.submenu, function(sub) {
            var meta = ICON_COLOR_MAP[sub.url] || { 
              icon: sub.icono || 'extension', 
              color: 'blue', 
              countKey: null, 
              desc: sub.label 
            };
            var val = (meta.countKey && contadores[meta.countKey] !== undefined) ? contadores[meta.countKey] : 0;

            secItems.push({
              label: sub.label,
              url: sub.url,
              icon: meta.icon,
              color: meta.color,
              valor: val,
              desc: meta.desc
            });
          });

          if (secItems.length > 0) {
            var parentMeta = PARENT_COLOR_MAP[padre.label] || { color: 'blue', icon: padre.icon || 'folder' };
            secciones.push({
              label: padre.label,
              icon: parentMeta.icon,
              color: parentMeta.color,
              items: secItems
            });
          }
        } else {
          // El menú es padre directo y aún no tiene submenús (ej. ARCHIVO)
          var metaPadre = ICON_COLOR_MAP[padre.url] || {
            icon: padre.icon || 'archive',
            color: 'slate',
            countKey: 'archivos',
            desc: 'Archivo digital emitido'
          };
          var parentMeta = PARENT_COLOR_MAP[padre.label] || {
            color: metaPadre.color || 'slate',
            icon: padre.icon || metaPadre.icon || 'archive'
          };
          var valPadre = (metaPadre.countKey && contadores[metaPadre.countKey] !== undefined) ? 
            contadores[metaPadre.countKey] : 
            (contadores['documentos'] || 0);

          secciones.push({
            label: padre.label,
            icon: parentMeta.icon,
            color: parentMeta.color,
            items: [{
              label: padre.label,
              url: padre.url || 'archivo',
              icon: metaPadre.icon,
              color: metaPadre.color,
              valor: valPadre,
              desc: metaPadre.desc || ('Módulo ' + padre.label)
            }]
          });
        }
      });

      return secciones;
    }

    function obtenerSaludo() {
      var hora = new Date().getHours();
      if (hora < 12) return 'Buenos días';
      if (hora < 19) return 'Buenas tardes';
      return 'Buenas noches';
    }

    function vistaPrevia(ev, idDocumento) {
      if (ev && ev.stopPropagation) ev.stopPropagation();
      Documento.showPdfId(idDocumento);
    }

    function verProgreso(ev, idDocumento) {
      if (ev && ev.stopPropagation) ev.stopPropagation();
      Documento.showProgressAll(ev, idDocumento);
    }

    function irARuta(ruta, params) {
      if (ruta) {
        $state.go(ruta, params || {});
      }
    }
  }

})();
