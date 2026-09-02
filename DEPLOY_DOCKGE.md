# Despliegue con Dockge

Este proyecto puede desplegarse como un stack Docker Compose mediante Dockge.

## Requisitos

- Docker Engine y Docker Compose disponibles en el servidor.
- Dockge instalado y accesible.
- Acceso del servidor a GitHub.
- Un puerto HTTP disponible; por defecto se usa el puerto 80.
- Un archivo `.env` configurado a partir de `.env.sample`.

## Crear el archivo de entorno

En el servidor, antes del despliegue, copie el archivo de ejemplo:

```bash
cp .env.sample .env
```

Edite `.env` y complete las credenciales, datos de base de datos, secretos JWT, URL pública e identidad institucional.

Nunca suba `.env` a Git.

## Crear el stack en Dockge

1. Abra Dockge.
2. Seleccione `Compose` y luego `Create Stack`.
3. Asigne un nombre, por ejemplo: `plantillas`.
4. Configure Dockge para clonar el repositorio:

   ```text
   https://github.com/eiddym/plantillas.git
   ```

5. Seleccione una rama estable o un tag de versión.
6. Use el archivo:

   ```text
   docker-compose.production.yml
   ```

7. Configure las variables de entorno según `.env.sample`.
8. Inicie el stack.

## Servicios

| Servicio | Función | Exposición |
|---|---|---|
| `frontend` | Aplicación web AngularJS servida por Nginx | Puerto configurado mediante `FRONTEND_PORT` |
| `backend` | API Node.js y generación de documentos PDF | Red interna Docker |
| `db` | PostgreSQL 13 | Red interna Docker |

## Persistencia

Los siguientes volúmenes deben conservarse al actualizar el stack:

- `plantillas_postgres_data`: datos de PostgreSQL.
- `plantillas_documentos`: PDFs generados.
- `plantillas_externos`: archivos externos.
- `plantillas_aprobacion`: archivos del flujo de aprobación.

No elimine estos volúmenes salvo que exista un respaldo validado.

## Actualización

1. Realice respaldo de la base de datos y archivos.
2. Actualice la referencia Git a una rama estable o tag.
3. Use `Redeploy` en Dockge.
4. Verifique el inicio de `db`, `backend` y `frontend`.
5. Pruebe el acceso web, creación de documento, PDF y verificación QR.

## Notas

Actualmente el stack de producción construye las imágenes desde el repositorio. En una siguiente versión se recomienda usar imágenes precompiladas y versionadas en GitHub Container Registry para acelerar y estandarizar los despliegues.
