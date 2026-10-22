const path = require('path');
const fs = require('fs');
const util = require('../lib/util');

module.exports = app => {
  const Usuario = app.src.db.models.usuario;
  const Documento = app.src.db.models.documento;
  const Catalogo = app.src.db.models.catalogo;
  const Unidad = app.src.db.models.unidad;
  const Rol = app.src.db.models.rol;
  const PlantillaFormly = app.src.db.models.plantilla_formly;
  const Menu = app.src.db.models.menu;
  const CatalogoUsuario = app.src.db.models.catalogo_usuario;
  const Contacto = app.src.db.models.contacto;
  const Sequelize = app.src.db.Sequelize;
  const Op = Sequelize.Op;

  /**
   * GET /api/v1/dashboard/resumen
   * Retorna contadores agregados dinámicos según el usuario en sesión
   */
  app.get('/api/v1/dashboard/resumen', async (req, res) => {
    try {
      const auditUser = (req.body && req.body.audit_usuario) ? req.body.audit_usuario : (req.audit_usuario || null);
      const idUsuario = (req.query && req.query.id_usuario)
        || (auditUser ? auditUser.id_usuario : (req.user ? req.user.id_usuario : null));

      let totalDocs = 0;
      let totalPendientes = 0;
      let totalFirmas = 0;
      let totalImpresion = 0;
      let totalArchivo = 0;
      let totalEnCurso = 0;
      let totalMonitoreo = 0;
      let totalDerivados = 0;
      let totalCatalogos = 0;
      let totalCompartidos = 0;
      let totalUsuarios = 0;
      let totalRoles = 0;
      let totalUnidades = 0;
      let totalMenus = 0;
      let totalPlantillas = 0;
      let totalContactos = 0;

      // 1. Conteo de Documentos y Archivo
      let totalArchivos = 0;
      if (Documento) {
        if (idUsuario) {
          totalDocs = await Documento.count({ where: { _usuario_creacion: idUsuario, estado: { [Op.ne]: 'ELIMINADO' } } }).catch(() => 0);
          totalPendientes = await Documento.count({ where: { via_actual: idUsuario, estado: { [Op.in]: ['ENVIADO', 'DERIVADO', 'RECHAZADO', 'PENDIENTE'] } } }).catch(() => 0);
          totalFirmas = await Documento.count({ where: { estado: 'FIRMAR' } }).catch(() => 0);
          totalImpresion = await Documento.count({ where: { _usuario_creacion: idUsuario, estado: { [Op.in]: ['APROBADO', 'CERRADO'] } } }).catch(() => 0);
          totalArchivo = await Documento.count({ where: { _usuario_creacion: idUsuario, estado: 'CERRADO' } }).catch(() => 0);
          totalArchivos = totalArchivo;
          totalEnCurso = await Documento.count({ where: { _usuario_creacion: idUsuario, estado: { [Op.in]: ['ENVIADO', 'DERIVADO'] } } }).catch(() => 0);
          totalDerivados = await Documento.count({ where: { via_actual: idUsuario, estado: 'DERIVADO' } }).catch(() => 0);
        } else {
          totalDocs = await Documento.count({ where: { estado: { [Op.ne]: 'ELIMINADO' } } }).catch(() => 0);
          totalPendientes = await Documento.count({ where: { estado: { [Op.in]: ['ENVIADO', 'DERIVADO', 'RECHAZADO', 'PENDIENTE'] } } }).catch(() => 0);
          totalFirmas = await Documento.count({ where: { estado: 'FIRMAR' } }).catch(() => 0);
          totalArchivos = await Documento.count({ where: { nombre: { [Op.like]: '%/%' } } }).catch(() => 0);
          totalArchivo = totalArchivos;
        }
        totalMonitoreo = await Documento.count({ where: { estado: { [Op.ne]: 'ELIMINADO' } } }).catch(() => 0);
      }

      // 2. Conteo de Catálogos
      if (Catalogo) {
        totalCatalogos = await Catalogo.count({ where: { estado: 'ACTIVO' } }).catch(() => 0);
        if (!totalCatalogos) totalCatalogos = await Catalogo.count().catch(() => 0);
      }
      if (CatalogoUsuario && idUsuario) {
        totalCompartidos = await CatalogoUsuario.count({ where: { id_usuario: idUsuario } }).catch(() => 0);
      } else {
        totalCompartidos = totalCatalogos;
      }

      // 3. Conteo de Administración y Configuración
      if (Usuario) {
        totalUsuarios = await Usuario.count({ where: { estado: 'ACTIVO' } }).catch(() => 0);
      }

      if (Contacto) {
        totalContactos = await Contacto.count({ where: { estado: 'ACTIVO' } }).catch(() => 0);
      } else {
        totalContactos = 0;
      }

      if (Rol) {
        totalRoles = await Rol.count().catch(() => 0);
      }

      if (Unidad) {
        totalUnidades = await Unidad.count({ where: { estado: 'ACTIVO' } }).catch(() => 0);
      }

      if (Menu) {
        totalMenus = await Menu.count({ where: { estado: 'ACTIVO' } }).catch(() => 0);
        if (!totalMenus) totalMenus = await Menu.count().catch(() => 0);
      }

      if (PlantillaFormly) {
        totalPlantillas = await PlantillaFormly.count({ where: { estado: 'ACTIVO' } }).catch(() => 0);
        if (!totalPlantillas) totalPlantillas = await PlantillaFormly.count().catch(() => 0);
      }

      const contadores = {
        documentos: totalDocs,
        pendientes: totalPendientes,
        firmas: totalFirmas,
        archivos: totalArchivos,
        archivo: totalArchivo,
        impresion: totalImpresion,
        en_curso: totalEnCurso,
        monitoreo: totalMonitoreo,
        derivados: totalDerivados,
        catalogos: totalCatalogos,
        compartidos: totalCompartidos,
        usuarios: totalUsuarios,
        roles: totalRoles,
        unidades: totalUnidades,
        menus: totalMenus,
        plantillas: totalPlantillas,
        contactos: totalContactos
      };

      res.status(200).send(util.formatearMensaje('EXITO', 'Resumen cargado correctamente', { contadores }));
    } catch (error) {
      console.error('[DASHBOARD RESUMEN ERROR]', error);
      res.status(500).send(util.formatearMensaje('ERROR', 'Error al obtener resumen de dashboard', error));
    }
  });

  /**
   * POST /api/v1/usuarios/:id/foto
   * Endpoint para subir foto de perfil del usuario
   */
  app.post('/api/v1/usuarios/:id/foto', async (req, res) => {
    try {
      const idUsuario = req.params.id;
      let fotoUrl = null;

      const uploadDir = path.join(process.cwd(), 'public', 'adjuntos', 'usuarios');
      if (!fs.existsSync(uploadDir)) {
        fs.mkdirSync(uploadDir, { recursive: true });
      }

      // Opción A: Archivo en multipart req.files
      if (req.files && (req.files.foto || req.files.file || req.files.avatar)) {
        const fileObj = req.files.foto || req.files.file || req.files.avatar;
        const ext = path.extname(fileObj.name) || '.jpg';
        const fileName = `user_${idUsuario}_${Date.now()}${ext}`;
        const targetPath = path.join(uploadDir, fileName);

        await fileObj.mv(targetPath);
        fotoUrl = `/public/adjuntos/usuarios/${fileName}`;
      } 
      // Opción B: Base64 en req.body.fotoBase64
      else if (req.body && (req.body.fotoBase64 || req.body.foto)) {
        const base64Str = req.body.fotoBase64 || req.body.foto;
        const matches = base64Str.match(/^data:([A-Za-z-+\/]+);base64,(.+)$/);
        
        let buffer;
        let ext = '.jpg';

        if (matches && matches.length === 3) {
          buffer = Buffer.from(matches[2], 'base64');
          if (matches[1].includes('png')) ext = '.png';
          if (matches[1].includes('webp')) ext = '.webp';
        } else {
          buffer = Buffer.from(base64Str, 'base64');
        }

        const fileName = `user_${idUsuario}_${Date.now()}${ext}`;
        const targetPath = path.join(uploadDir, fileName);
        fs.writeFileSync(targetPath, buffer);
        fotoUrl = `/public/adjuntos/usuarios/${fileName}`;
      } else {
        return res.status(400).send(util.formatearMensaje('ERROR', 'No se proporcionó ningún archivo de imagen'));
      }

      // Actualizar en base de datos
      await Usuario.update({ foto: fotoUrl }, { where: { id_usuario: idUsuario } });

      // Retornar éxito
      res.status(200).send(util.formatearMensaje('EXITO', 'Foto de perfil actualizada correctamente', { foto: fotoUrl }));
    } catch (error) {
      console.error('[FOTO UPLOAD ERROR]', error);
      res.status(500).send(util.formatearMensaje('ERROR', 'Error al guardar la foto de perfil', error));
    }
  });

  // Alias para la ruta de profile
  app.post('/api/v1/profile/foto', (req, res) => {
    const auditUser = req.body.audit_usuario || {};
    const id = auditUser.id_usuario || (req.user ? req.user.id_usuario : 1);
    req.params.id = id;
    app._router.handle(req, res);
  });
};
