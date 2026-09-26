(function() {
  'use strict';

  angular
    .module('app')
    .controller('MainController', MainController);

  /** @ngInject */
  function MainController(DashboardService, Storage, Documento, $state) {
    var vm = this;

    vm.cargando = true;
    vm.usuario = Storage.getUser() || {};
    vm.saludo = obtenerSaludo();

    vm.secciones = [];
    vm.vistaPrevia = vistaPrevia;
    vm.verProgreso = verProgreso;
    vm.irARuta = irARuta;

    var PARENT_COLOR_MAP = {
      'DOCUMENTOS': { color: 'blue', icon: 'folder' },
      'CATALOGOS': { color: 'teal', icon: 'folder' },
      'ADMINISTRACIÓN': { color: 'green', icon: 'settings' },
      'CONFIGURACIÓN': { color: 'slate', icon: 'build' }
    };

    var ICON_COLOR_MAP = {
      'documentos': { icon: 'description', color: 'blue', countKey: 'documentos', desc: 'Mis documentos redactados' },
      'aprobacion': { icon: 'schedule', color: 'amber', countKey: 'pendientes', desc: 'Trámites en bandeja de derivación' },
      'firmar': { icon: 'edit_note', color: 'violet', countKey: 'firmas', desc: 'Pendientes de firma digital' },
      'aprobar_documento': { icon: 'fingerprint', color: 'indigo', countKey: 'firmas', desc: 'Aprobación con Ciudadanía' },
      'impresion': { icon: 'print', color: 'slate', countKey: 'documentos', desc: 'Impresión oficial de documentos' },
      'archivo': { icon: 'inventory_2', color: 'slate', countKey: 'documentos', desc: 'Archivo digital emitido' },
      'catalogos': { icon: 'folder', color: 'teal', countKey: 'catalogos', desc: 'Tablas de datos y catálogos' },
      'compartidos': { icon: 'share', color: 'teal', countKey: 'compartidos', desc: 'Catálogos compartidos' },
      'usuario': { icon: 'people', color: 'green', countKey: 'usuarios', desc: 'Gestión de usuarios' },
      'rol': { icon: 'security', color: 'violet', countKey: 'roles', desc: 'Perfiles de permisos y roles' },
      'menu': { icon: 'list_alt', color: 'amber', countKey: 'menus', desc: 'Administración de menús' },
      'unidad': { icon: 'business', color: 'blue', countKey: 'unidades', desc: 'Estructura organizacional' },
      'plantillas': { icon: 'view_quilt', color: 'teal', countKey: 'plantillas', desc: 'Formularios y plantillas' },
      'contactos': { icon: 'contacts', color: 'indigo', countKey: 'contactos', desc: 'Directorio de personal' }
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
