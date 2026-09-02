# Despliegue con Dockge

Este proyecto se despliega como un stack Docker Compose mediante Dockge.

La configuración productiva se encuentra en:

```text
docker-compose.production.yml
```

## Requisitos

- VPS Linux con Docker Engine y Docker Compose.
- Dockge instalado.
- Acceso del VPS a GitHub.
- Un dominio o subdominio recomendado para producción.
- Archivo `.env` privado creado desde `.env.sample`.
- Puerto HTTP/HTTPS disponible.
- Espacio persistente para PostgreSQL y documentos PDF.

## Preparar variables

En el directorio del stack:

```bash
cp .env.sample .env
```

Edite `.env` y complete todas las credenciales, secretos y datos institucionales.

Nunca suba `.env` al repositorio.

## URL QR de verificación

El servicio `detector-ip` intenta detectar la IP del servidor y generar una URL LAN de verificación.

Para producción en Hostinger con dominio y HTTPS, defina manualmente:

```dotenv
URL_VERIFICACION=https://documentos.tudominio.com/verificar
```

La URL debe ser accesible desde los teléfonos que escanearán los códigos QR.

## Crear stack en Dockge

1. Abra Dockge.
2. Cree un nuevo stack.
3. Nombre sugerido:

   ```text
   plantillas-marabunta
   ```

4. Clone el repositorio:

   ```text
   https://github.com/eiddym/plantillas.git
   ```

5. Seleccione la rama:

   ```text
   prod/marabunta
   ```

6. Use:

   ```text
   docker-compose.production.yml
   ```

7. Cargue o cree el archivo `.env` privado.
8. Despliegue el stack.

## Servicios

| Servicio | Función | Exposición |
|---|---|---|
| `detector-ip` | Genera URL QR LAN si no existe una manual | No expuesto |
| `db` | PostgreSQL 13 | Red interna Docker |
| `backend` | API Node.js, lógica documental y PDFs | Red interna Docker |
| `frontend` | AngularJS y Nginx | Puerto `FRONTEND_PUERTO` |

## Persistencia

| Volumen | Contenido |
|---|---|
| `pgdata` | PostgreSQL |
| `plantillas-documentos` | Documentos PDF, adjuntos y archivos públicos |
| `shared-config` | Configuración compartida de despliegue y URL QR |

No elimine estos volúmenes sin realizar respaldos validados.

## Verificación posterior

Después del despliegue:

1. Confirme que PostgreSQL esté saludable.
2. Confirme que backend y frontend estén activos.
3. Ingrese a la aplicación.
4. Cree un documento de prueba.
5. Genere y visualice el PDF en escritorio y móvil.
6. Escanee el QR desde un teléfono externo.
7. Confirme que la URL QR use el dominio productivo y HTTPS.
