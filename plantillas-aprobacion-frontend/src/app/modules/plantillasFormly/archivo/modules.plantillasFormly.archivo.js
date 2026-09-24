(function () {
  'use strict';

  angular
    .module('app')
    .controller('ArchivoController', ArchivoController);

  /** @ngInject */
  function ArchivoController(DataService, restUrl, Storage, Documento, Message, $mdDialog) {
    var vm = this;
    var cuenta = Storage.getUser() || {};
    var usuarioId = cuenta.id_usuario || cuenta.id || 1;
    vm.usuarioId = usuarioId;

    var esAdminOMae = cuenta.username === 'admin' || cuenta.usuario === 'admin' || cuenta.es_mae === true || 
                     (cuenta.roles && cuenta.roles.some(function(r) { return r.rol && (r.rol.nombre === 'SUPERADMIN' || r.rol.nombre === 'ADMIN'); }));
    vm.esAdminOMae = esAdminOMae;

    vm.titulo = esAdminOMae ? "Archivo General de Documentos (MAE / Admin)" : "Archivo de Documentos de la Unidad";
    vm.cargando = true;
    vm.busqueda = '';
    vm.modoVista = 'jerarquica'; // 'jerarquica' o 'lista'

    vm.documentos = [];
    vm.unidadesAgrupadas = [];
    vm.stats = {
      totalArchivos: 0,
      totalUnidades: 0,
      totalExpedientes: 0
    };

    vm.cargarArchivo = cargarArchivo;
    vm.vistaPrevia = vistaPrevia;
    vm.verProgreso = verProgreso;
    vm.toggleExpandirUnidad = toggleExpandirUnidad;
    vm.toggleExpandirTipo = toggleExpandirTipo;
    vm.toggleExpandirExpediente = toggleExpandirExpediente;

    // Inicializar
    cargarArchivo();

    function cargarArchivo() {
      vm.cargando = true;
      var url = restUrl + 'plantillasFormly/documento/' + usuarioId + '/archivo';

      DataService.get(url)
        .then(function (res) {
          vm.cargando = false;
          var lista = (res && res.datos && res.datos.resultado) ? res.datos.resultado : [];
          
          // FILTRAR ESTRICTAMENTE SOLO DOCUMENTOS CON CITE
          vm.documentos = lista.filter(function (doc) {
            return doc && doc.nombre && doc.nombre.indexOf('/') !== -1;
          });

          procesarAgrupacion();
        })
        .catch(function (err) {
          vm.cargando = false;
          Message.error("Error al cargar los documentos de archivo: " + (err.data ? err.data.mensaje : err.message));
        });
    }

    function extraerteSiglaUnidad(doc) {
      if (doc.usuario_creacion && doc.usuario_creacion.unidad && doc.usuario_creacion.unidad.nombre) {
        return doc.usuario_creacion.unidad.sigla || doc.usuario_creacion.unidad.nombre;
      }
      if (doc.nombre && doc.nombre.indexOf('/') !== -1) {
        var partes = doc.nombre.split('/');
        if (partes.length > 0 && partes[0]) {
          var subPartes = partes[0].split('-');
          return subPartes.length > 1 ? subPartes[1] : subPartes[0];
        }
      }
      return 'GENERAL / OTRAS UNIDADES';
    }

    function procesarAgrupacion() {
      var mapaUnidades = {};
      var countExpedientes = 0;

      // 1. Identificar padres e hijos para agrupar expedientes
      var docsPorId = {};
      vm.documentos.forEach(function (d) {
        docsPorId[d.id_documento] = d;
        d._hijos = d._hijos || [];
      });

      var raizDocs = [];
      vm.documentos.forEach(function (d) {
        if (d.documento_padre && docsPorId[d.documento_padre]) {
          docsPorId[d.documento_padre]._hijos.push(d);
        } else {
          raizDocs.push(d);
        }
      });

      // 2. Agrupar por Unidad -> Tipo -> Expedientes
      raizDocs.forEach(function (doc) {
        var unidadKey = extraerteSiglaUnidad(doc);
        var tipoKey = doc.nombre_plantilla || doc.abreviacion || 'DOCUMENTOS DIVERSOS';

        if (!mapaUnidades[unidadKey]) {
          mapaUnidades[unidadKey] = {
            nombre: unidadKey,
            expandido: true,
            tiposMap: {},
            totalDocs: 0
          };
        }

        var unidadObj = mapaUnidades[unidadKey];

        if (!unidadObj.tiposMap[tipoKey]) {
          unidadObj.tiposMap[tipoKey] = {
            nombre: tipoKey,
            expandido: true,
            expedientes: []
          };
        }

        var tieneHijos = doc._hijos && doc._hijos.length > 0;
        if (tieneHijos) countExpedientes++;

        unidadObj.tiposMap[tipoKey].expedientes.push({
          padre: doc,
          hijos: doc._hijos,
          esExpediente: tieneHijos,
          expandido: false
        });

        unidadObj.totalDocs += (1 + doc._hijos.length);
      });

      // Transformar mapa en array ordenado
      var resultadoUnidades = [];
      Object.keys(mapaUnidades).sort().forEach(function (uKey) {
        var uObj = mapaUnidades[uKey];
        var tiposArr = [];
        Object.keys(uObj.tiposMap).sort().forEach(function (tKey) {
          tiposArr.push(uObj.tiposMap[tKey]);
        });
        uObj.tipos = tiposArr;
        delete uObj.tiposMap;
        resultadoUnidades.push(uObj);
      });

      vm.unidadesAgrupadas = resultadoUnidades;
      vm.stats.totalArchivos = vm.documentos.length;
      vm.stats.totalUnidades = resultadoUnidades.length;
      vm.stats.totalExpedientes = countExpedientes;
    }

    function vistaPrevia(pEvento, pIdentificador) {
      if (pEvento && pEvento.stopPropagation) pEvento.stopPropagation();
      Documento.showPdfId(pIdentificador);
    }

    function verProgreso(pEvento, pIdentificador) {
      if (pEvento && pEvento.stopPropagation) pEvento.stopPropagation();
      Documento.showProgressAll(pEvento, pIdentificador);
    }

    function toggleExpandirUnidad(unidad) {
      unidad.expandido = !unidad.expandido;
    }

    function toggleExpandirTipo(tipo) {
      tipo.expandido = !tipo.expandido;
    }

    function toggleExpandirExpediente(expediente) {
      expediente.expandido = !expediente.expandido;
    }
  }
})();
