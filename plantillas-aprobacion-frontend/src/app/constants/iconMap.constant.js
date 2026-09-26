(function() {
  'use strict';

  angular
    .module('app')
    .constant('ICON_MAP', {
      documentos:     { icon: 'description',          color: 'blue' },
      pendientes:     { icon: 'schedule',             color: 'amber' },
      firmas:         { icon: 'edit_note',            color: 'violet' },
      catalogos:      { icon: 'folder',               color: 'teal' },
      expedientes:    { icon: 'folder_special',       color: 'indigo' },
      usuarios:       { icon: 'people',               color: 'green' },
      administracion: { icon: 'settings',             color: 'slate' },
      configuracion:  { icon: 'tune',                 color: 'teal-dark' },
      busqueda:       { icon: 'search',               color: 'blue' },
      notificaciones: { icon: 'notifications',          color: 'amber' },
      archivo:        { icon: 'archive',              color: 'indigo' },
      contactos:      { icon: 'contacts',             color: 'green' },
      plantillas:     { icon: 'dashboard_customize', color: 'violet' }
    });

})();
