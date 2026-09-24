# Guía de Integración Authentik (vía LDAP Outpost)

El sistema de aprobación de plantillas soporta autenticación centralizada contra **Authentik** utilizando el componente **LDAP Outpost** de Authentik.

---

## 1. Mapeo de Atributos de Usuario

El backend del sistema utiliza los siguientes atributos LDAP para crear y gestionar las cuentas de usuario de manera automática (`auto-provisioning`):

| Atributo LDAP en Authentik | Campo en la BD del Sistema | Descripción / Mapeo de Roles |
| :--- | :--- | :--- |
| `uid` (o `sAMAccountName`) | `usuario.usuario` | Nombre de usuario con el que inicia sesión. |
| `givenName` | `usuario.nombres` | Nombre(s) del usuario. |
| `sn` | `usuario.apellidos` | Apellidos del usuario. |
| `mail` | `usuario.email` | Correo electrónico institucional. |
| `title` | `usuario.cargo` | **Crucial para Roles:** El backend evalúa este campo para asignar el rol automáticamente. |

### Regla de Asignación Automática de Roles por `title` (Cargo):
* **Rol 2 (JEFE):** Si el atributo `title` contiene la palabra `jefe`, `responsable` o `director` (sin importar mayúsculas/minúsculas).
* **Rol 4 (SECRETARIA):** Si el atributo `title` contiene la palabra `secretaria`.
* **Rol 3 (OPERADOR):** Para cualquier otro valor o si el campo está vacío.

---

## 2. Configuración en Authentik

1. **Crear LDAP Outpost:**
   - En la consola de Authentik, ve a **Applications > Outposts**.
   - Crea o edita un **LDAP Outpost**.
   - Asigna las aplicaciones y usuarios o grupos autorizados.

2. **Propiedades del Usuario en Authentik:**
   - Asegúrate de completar los campos **First Name** (`givenName`), **Last Name** (`sn`), **Email** (`mail`) y la propiedad/atributo **title** (Cargo).

---

## 3. Configuración en `.env` (Sistema Plantillas)

Agrega o desglosa las siguientes variables en tu archivo `.env`:

```env
# Authentik LDAP Configuration
LDAP_URL=ldap://IP_DE_AUTHENTIK:389
LDAP_BIND_DN=cn=ak-outpost-ldap,ou=outposts,dc=authentik,dc=local
LDAP_BIND_PASSWORD=tu_password_outpost
LDAP_SEARCHBASE=ou=users,dc=authentik,dc=local
LDAP_SEARCHFILTER=(uid={{username}})
```

---

## 4. Reiniciar Servicios

Una vez configurado el `.env`, reinicia el contenedor de backend:

```bash
docker compose restart backend
```
