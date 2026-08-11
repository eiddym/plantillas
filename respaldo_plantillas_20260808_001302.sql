--
-- PostgreSQL database dump
--

\restrict lNgSh7FBlhFChtS89EravjbaJ29sFUbmX3deysny4jJBNFuu8Xw7GlQxrgi7hFe

-- Dumped from database version 13.23
-- Dumped by pg_dump version 13.23

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: enum_adjunto_aprobacion_cd_estado; Type: TYPE; Schema: public; Owner: plantillas
--

CREATE TYPE public.enum_adjunto_aprobacion_cd_estado AS ENUM (
    'NUEVO',
    'APROBADO',
    'ELIMINADO'
);


ALTER TYPE public.enum_adjunto_aprobacion_cd_estado OWNER TO plantillas;

--
-- Name: enum_catalogo_documento_estado; Type: TYPE; Schema: public; Owner: plantillas
--

CREATE TYPE public.enum_catalogo_documento_estado AS ENUM (
    'ACTIVO',
    'INACTIVO',
    'ELIMINADO'
);


ALTER TYPE public.enum_catalogo_documento_estado OWNER TO plantillas;

--
-- Name: enum_catalogo_estado; Type: TYPE; Schema: public; Owner: plantillas
--

CREATE TYPE public.enum_catalogo_estado AS ENUM (
    'ACTIVO',
    'INACTIVO',
    'ELIMINADO'
);


ALTER TYPE public.enum_catalogo_estado OWNER TO plantillas;

--
-- Name: enum_catalogo_usuario_estado; Type: TYPE; Schema: public; Owner: plantillas
--

CREATE TYPE public.enum_catalogo_usuario_estado AS ENUM (
    'ACTIVO',
    'INACTIVO',
    'ELIMINADO'
);


ALTER TYPE public.enum_catalogo_usuario_estado OWNER TO plantillas;

--
-- Name: enum_conf_notificacion_canal; Type: TYPE; Schema: public; Owner: plantillas
--

CREATE TYPE public.enum_conf_notificacion_canal AS ENUM (
    'SMS',
    'CORREO',
    'SMS_CORREO'
);


ALTER TYPE public.enum_conf_notificacion_canal OWNER TO plantillas;

--
-- Name: enum_conf_notificacion_estado; Type: TYPE; Schema: public; Owner: plantillas
--

CREATE TYPE public.enum_conf_notificacion_estado AS ENUM (
    'ACTIVO',
    'INACTIVO'
);


ALTER TYPE public.enum_conf_notificacion_estado OWNER TO plantillas;

--
-- Name: enum_contacto_estado; Type: TYPE; Schema: public; Owner: plantillas
--

CREATE TYPE public.enum_contacto_estado AS ENUM (
    'ACTIVO',
    'INACTIVO'
);


ALTER TYPE public.enum_contacto_estado OWNER TO plantillas;

--
-- Name: enum_correlativo_estado; Type: TYPE; Schema: public; Owner: plantillas
--

CREATE TYPE public.enum_correlativo_estado AS ENUM (
    'ACTIVO',
    'INACTIVO'
);


ALTER TYPE public.enum_correlativo_estado OWNER TO plantillas;

--
-- Name: enum_documento_estado; Type: TYPE; Schema: public; Owner: plantillas
--

CREATE TYPE public.enum_documento_estado AS ENUM (
    'NUEVO',
    'ENVIADO',
    'APROBADO',
    'RECHAZADO',
    'DERIVADO',
    'CERRADO',
    'ELIMINADO'
);


ALTER TYPE public.enum_documento_estado OWNER TO plantillas;

--
-- Name: enum_documento_impreso; Type: TYPE; Schema: public; Owner: plantillas
--

CREATE TYPE public.enum_documento_impreso AS ENUM (
    'SI',
    'NO'
);


ALTER TYPE public.enum_documento_impreso OWNER TO plantillas;

--
-- Name: enum_historial_catalogo_accion; Type: TYPE; Schema: public; Owner: plantillas
--

CREATE TYPE public.enum_historial_catalogo_accion AS ENUM (
    'CREAR',
    'MODIFICAR',
    'ELIMINAR'
);


ALTER TYPE public.enum_historial_catalogo_accion OWNER TO plantillas;

--
-- Name: enum_historial_flujo_accion; Type: TYPE; Schema: public; Owner: plantillas
--

CREATE TYPE public.enum_historial_flujo_accion AS ENUM (
    'ENVIADO',
    'APROBADO',
    'RECHAZADO',
    'DERIVADO',
    'CERRADO',
    'CREADO',
    'ELIMINADO',
    'FIRMO',
    'ANULADO',
    'APROBADO_CD'
);


ALTER TYPE public.enum_historial_flujo_accion OWNER TO plantillas;

--
-- Name: enum_historial_flujo_estado; Type: TYPE; Schema: public; Owner: plantillas
--

CREATE TYPE public.enum_historial_flujo_estado AS ENUM (
    'INACTIVO',
    'ACTIVO'
);


ALTER TYPE public.enum_historial_flujo_estado OWNER TO plantillas;

--
-- Name: enum_menu_estado; Type: TYPE; Schema: public; Owner: plantillas
--

CREATE TYPE public.enum_menu_estado AS ENUM (
    'ACTIVO',
    'INACTIVO'
);


ALTER TYPE public.enum_menu_estado OWNER TO plantillas;

--
-- Name: enum_notificacion_canal; Type: TYPE; Schema: public; Owner: plantillas
--

CREATE TYPE public.enum_notificacion_canal AS ENUM (
    'SMS',
    'CORREO',
    'SMS_CORREO'
);


ALTER TYPE public.enum_notificacion_canal OWNER TO plantillas;

--
-- Name: enum_notificacion_estado; Type: TYPE; Schema: public; Owner: plantillas
--

CREATE TYPE public.enum_notificacion_estado AS ENUM (
    'ACTIVO',
    'INACTIVO'
);


ALTER TYPE public.enum_notificacion_estado OWNER TO plantillas;

--
-- Name: enum_notificacion_tipo; Type: TYPE; Schema: public; Owner: plantillas
--

CREATE TYPE public.enum_notificacion_tipo AS ENUM (
    'EXITO',
    'ERROR'
);


ALTER TYPE public.enum_notificacion_tipo OWNER TO plantillas;

--
-- Name: enum_partida_estado; Type: TYPE; Schema: public; Owner: plantillas
--

CREATE TYPE public.enum_partida_estado AS ENUM (
    'ACTIVO',
    'INACTIVO'
);


ALTER TYPE public.enum_partida_estado OWNER TO plantillas;

--
-- Name: enum_partida_tipo; Type: TYPE; Schema: public; Owner: plantillas
--

CREATE TYPE public.enum_partida_tipo AS ENUM (
    'INICIAL',
    'MODIFICADO',
    'COMPROMETIDO',
    'PAGADO',
    'REVERTIDO'
);


ALTER TYPE public.enum_partida_tipo OWNER TO plantillas;

--
-- Name: enum_plantilla_formly_estado; Type: TYPE; Schema: public; Owner: plantillas
--

CREATE TYPE public.enum_plantilla_formly_estado AS ENUM (
    'ACTIVO',
    'INACTIVO'
);


ALTER TYPE public.enum_plantilla_formly_estado OWNER TO plantillas;

--
-- Name: enum_rol_estado; Type: TYPE; Schema: public; Owner: plantillas
--

CREATE TYPE public.enum_rol_estado AS ENUM (
    'ACTIVO',
    'INACTIVO'
);


ALTER TYPE public.enum_rol_estado OWNER TO plantillas;

--
-- Name: enum_solicitud_aprobacion_cd_estado; Type: TYPE; Schema: public; Owner: plantillas
--

CREATE TYPE public.enum_solicitud_aprobacion_cd_estado AS ENUM (
    'SOLICITADO',
    'APROBADO_CD',
    'FALLIDO'
);


ALTER TYPE public.enum_solicitud_aprobacion_cd_estado OWNER TO plantillas;

--
-- Name: enum_solicitud_aprobacion_cd_tipo; Type: TYPE; Schema: public; Owner: plantillas
--

CREATE TYPE public.enum_solicitud_aprobacion_cd_tipo AS ENUM (
    'DOCUMENTO',
    'ADJUNTO'
);


ALTER TYPE public.enum_solicitud_aprobacion_cd_tipo OWNER TO plantillas;

--
-- Name: enum_unidad_estado; Type: TYPE; Schema: public; Owner: plantillas
--

CREATE TYPE public.enum_unidad_estado AS ENUM (
    'ACTIVO',
    'INACTIVO'
);


ALTER TYPE public.enum_unidad_estado OWNER TO plantillas;

--
-- Name: enum_usuario_estado; Type: TYPE; Schema: public; Owner: plantillas
--

CREATE TYPE public.enum_usuario_estado AS ENUM (
    'ACTIVO',
    'INACTIVO'
);


ALTER TYPE public.enum_usuario_estado OWNER TO plantillas;

--
-- Name: enum_usuario_externo_estado; Type: TYPE; Schema: public; Owner: plantillas
--

CREATE TYPE public.enum_usuario_externo_estado AS ENUM (
    'ACTIVO',
    'INACTIVO'
);


ALTER TYPE public.enum_usuario_externo_estado OWNER TO plantillas;

--
-- Name: enum_usuario_his_estado; Type: TYPE; Schema: public; Owner: plantillas
--

CREATE TYPE public.enum_usuario_his_estado AS ENUM (
    'ACTIVO',
    'INACTIVO'
);


ALTER TYPE public.enum_usuario_his_estado OWNER TO plantillas;

--
-- Name: enum_usuario_rol_estado; Type: TYPE; Schema: public; Owner: plantillas
--

CREATE TYPE public.enum_usuario_rol_estado AS ENUM (
    'ACTIVO',
    'INACTIVO'
);


ALTER TYPE public.enum_usuario_rol_estado OWNER TO plantillas;

--
-- Name: enum_virtual_estado; Type: TYPE; Schema: public; Owner: plantillas
--

CREATE TYPE public.enum_virtual_estado AS ENUM (
    'ACTIVO',
    'INACTIVO'
);


ALTER TYPE public.enum_virtual_estado OWNER TO plantillas;

--
-- Name: enum_virtual_his_accion; Type: TYPE; Schema: public; Owner: plantillas
--

CREATE TYPE public.enum_virtual_his_accion AS ENUM (
    'ACTIVO',
    'INACTIVO'
);


ALTER TYPE public.enum_virtual_his_accion OWNER TO plantillas;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: adjunto_aprobacion_cd; Type: TABLE; Schema: public; Owner: plantillas
--

CREATE TABLE public.adjunto_aprobacion_cd (
    id integer NOT NULL,
    nombre_publico character varying(255) NOT NULL,
    nombre_privado character varying(255) NOT NULL,
    url text NOT NULL,
    estado public.enum_adjunto_aprobacion_cd_estado DEFAULT 'NUEVO'::public.enum_adjunto_aprobacion_cd_estado,
    _usuario_creacion integer NOT NULL,
    _usuario_modificacion integer,
    _fecha_creacion timestamp with time zone NOT NULL,
    _fecha_modificacion timestamp with time zone NOT NULL,
    fid_documento integer
);


ALTER TABLE public.adjunto_aprobacion_cd OWNER TO plantillas;

--
-- Name: adjunto_aprobacion_cd_id_seq; Type: SEQUENCE; Schema: public; Owner: plantillas
--

CREATE SEQUENCE public.adjunto_aprobacion_cd_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.adjunto_aprobacion_cd_id_seq OWNER TO plantillas;

--
-- Name: adjunto_aprobacion_cd_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: plantillas
--

ALTER SEQUENCE public.adjunto_aprobacion_cd_id_seq OWNED BY public.adjunto_aprobacion_cd.id;


--
-- Name: auth; Type: TABLE; Schema: public; Owner: plantillas
--

CREATE TABLE public.auth (
    id integer NOT NULL,
    state character varying(100) NOT NULL,
    parametros jsonb,
    tokens jsonb,
    id_usuario character varying(20),
    estado character varying(30) DEFAULT 'INICIO'::character varying NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.auth OWNER TO plantillas;

--
-- Name: auth_id_seq; Type: SEQUENCE; Schema: public; Owner: plantillas
--

CREATE SEQUENCE public.auth_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_id_seq OWNER TO plantillas;

--
-- Name: auth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: plantillas
--

ALTER SEQUENCE public.auth_id_seq OWNED BY public.auth.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: plantillas
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(255) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(255) NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    cargo character varying(255),
    ci character varying(255),
    habilitado_marcar boolean NOT NULL,
    cas integer,
    fecha_asignacion timestamp with time zone,
    nro_item integer,
    unidad_dependencia character varying(255)
);


ALTER TABLE public.auth_user OWNER TO plantillas;

--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: plantillas
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO plantillas;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: plantillas
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: catalogo; Type: TABLE; Schema: public; Owner: plantillas
--

CREATE TABLE public.catalogo (
    id_catalogo integer NOT NULL,
    nombre text NOT NULL,
    descripcion text NOT NULL,
    comentario text,
    propietario integer NOT NULL,
    estado public.enum_catalogo_estado DEFAULT 'ACTIVO'::public.enum_catalogo_estado NOT NULL,
    _usuario_creacion integer NOT NULL,
    _usuario_modificacion integer,
    _fecha_creacion timestamp with time zone NOT NULL,
    _fecha_modificacion timestamp with time zone NOT NULL
);


ALTER TABLE public.catalogo OWNER TO plantillas;

--
-- Name: catalogo_documento; Type: TABLE; Schema: public; Owner: plantillas
--

CREATE TABLE public.catalogo_documento (
    id_catalogo_documento integer NOT NULL,
    fid_catalogo integer NOT NULL,
    fid_documento integer NOT NULL,
    descripcion text NOT NULL,
    estado public.enum_catalogo_documento_estado DEFAULT 'ACTIVO'::public.enum_catalogo_documento_estado NOT NULL,
    orden integer DEFAULT 0 NOT NULL,
    _usuario_creacion integer NOT NULL,
    _usuario_modificacion integer,
    _fecha_creacion timestamp with time zone NOT NULL,
    _fecha_modificacion timestamp with time zone NOT NULL
);


ALTER TABLE public.catalogo_documento OWNER TO plantillas;

--
-- Name: catalogo_documento_id_catalogo_documento_seq; Type: SEQUENCE; Schema: public; Owner: plantillas
--

CREATE SEQUENCE public.catalogo_documento_id_catalogo_documento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.catalogo_documento_id_catalogo_documento_seq OWNER TO plantillas;

--
-- Name: catalogo_documento_id_catalogo_documento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: plantillas
--

ALTER SEQUENCE public.catalogo_documento_id_catalogo_documento_seq OWNED BY public.catalogo_documento.id_catalogo_documento;


--
-- Name: catalogo_id_catalogo_seq; Type: SEQUENCE; Schema: public; Owner: plantillas
--

CREATE SEQUENCE public.catalogo_id_catalogo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.catalogo_id_catalogo_seq OWNER TO plantillas;

--
-- Name: catalogo_id_catalogo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: plantillas
--

ALTER SEQUENCE public.catalogo_id_catalogo_seq OWNED BY public.catalogo.id_catalogo;


--
-- Name: catalogo_usuario; Type: TABLE; Schema: public; Owner: plantillas
--

CREATE TABLE public.catalogo_usuario (
    id_catalogo_usuario integer NOT NULL,
    fid_catalogo integer NOT NULL,
    fid_usuario integer NOT NULL,
    lectura boolean DEFAULT true NOT NULL,
    escritura boolean DEFAULT false NOT NULL,
    eliminar boolean DEFAULT false NOT NULL,
    estado public.enum_catalogo_usuario_estado DEFAULT 'ACTIVO'::public.enum_catalogo_usuario_estado NOT NULL,
    _usuario_creacion integer NOT NULL,
    _usuario_modificacion integer,
    _fecha_creacion timestamp with time zone NOT NULL,
    _fecha_modificacion timestamp with time zone NOT NULL
);


ALTER TABLE public.catalogo_usuario OWNER TO plantillas;

--
-- Name: catalogo_usuario_id_catalogo_usuario_seq; Type: SEQUENCE; Schema: public; Owner: plantillas
--

CREATE SEQUENCE public.catalogo_usuario_id_catalogo_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.catalogo_usuario_id_catalogo_usuario_seq OWNER TO plantillas;

--
-- Name: catalogo_usuario_id_catalogo_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: plantillas
--

ALTER SEQUENCE public.catalogo_usuario_id_catalogo_usuario_seq OWNED BY public.catalogo_usuario.id_catalogo_usuario;


--
-- Name: conf_notificacion; Type: TABLE; Schema: public; Owner: plantillas
--

CREATE TABLE public.conf_notificacion (
    id_conf_notificacion integer NOT NULL,
    fid_usuario integer NOT NULL,
    celular character varying(10),
    canal public.enum_conf_notificacion_canal DEFAULT 'CORREO'::public.enum_conf_notificacion_canal,
    canal_habilitado boolean DEFAULT true,
    enviado boolean DEFAULT true,
    observado boolean DEFAULT true,
    aprobado boolean DEFAULT true,
    derivado boolean DEFAULT true,
    aprobar_ciudadania boolean DEFAULT true,
    aprobados_ciudadania boolean DEFAULT true,
    estado public.enum_conf_notificacion_estado DEFAULT 'ACTIVO'::public.enum_conf_notificacion_estado,
    _usuario_creacion integer NOT NULL,
    _usuario_modificacion integer,
    _fecha_creacion timestamp with time zone NOT NULL,
    _fecha_modificacion timestamp with time zone NOT NULL
);


ALTER TABLE public.conf_notificacion OWNER TO plantillas;

--
-- Name: conf_notificacion_id_conf_notificacion_seq; Type: SEQUENCE; Schema: public; Owner: plantillas
--

CREATE SEQUENCE public.conf_notificacion_id_conf_notificacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conf_notificacion_id_conf_notificacion_seq OWNER TO plantillas;

--
-- Name: conf_notificacion_id_conf_notificacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: plantillas
--

ALTER SEQUENCE public.conf_notificacion_id_conf_notificacion_seq OWNED BY public.conf_notificacion.id_conf_notificacion;


--
-- Name: contacto; Type: TABLE; Schema: public; Owner: plantillas
--

CREATE TABLE public.contacto (
    id_contacto integer NOT NULL,
    grado character varying(150),
    nombres character varying(150) NOT NULL,
    apellidos character varying(150) NOT NULL,
    cargo character varying(250),
    entidad character varying(250),
    tipo_entidad character varying(250),
    sigla character varying(80),
    direccion text,
    telefono text,
    departamento character varying(50),
    estado public.enum_contacto_estado DEFAULT 'ACTIVO'::public.enum_contacto_estado NOT NULL,
    _usuario_creacion integer NOT NULL,
    _usuario_modificacion integer,
    _fecha_creacion timestamp with time zone NOT NULL,
    _fecha_modificacion timestamp with time zone NOT NULL
);


ALTER TABLE public.contacto OWNER TO plantillas;

--
-- Name: contacto_id_contacto_seq; Type: SEQUENCE; Schema: public; Owner: plantillas
--

CREATE SEQUENCE public.contacto_id_contacto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contacto_id_contacto_seq OWNER TO plantillas;

--
-- Name: contacto_id_contacto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: plantillas
--

ALTER SEQUENCE public.contacto_id_contacto_seq OWNED BY public.contacto.id_contacto;


--
-- Name: correlativo; Type: TABLE; Schema: public; Owner: plantillas
--

CREATE TABLE public.correlativo (
    id_correlativo integer NOT NULL,
    abreviacion character varying(255) NOT NULL,
    valor integer NOT NULL,
    anio character varying(4) NOT NULL,
    estado public.enum_correlativo_estado DEFAULT 'ACTIVO'::public.enum_correlativo_estado,
    _usuario_creacion integer NOT NULL,
    _usuario_modificacion integer,
    _fecha_creacion timestamp with time zone NOT NULL,
    _fecha_modificacion timestamp with time zone NOT NULL
);


ALTER TABLE public.correlativo OWNER TO plantillas;

--
-- Name: correlativo_id_correlativo_seq; Type: SEQUENCE; Schema: public; Owner: plantillas
--

CREATE SEQUENCE public.correlativo_id_correlativo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.correlativo_id_correlativo_seq OWNER TO plantillas;

--
-- Name: correlativo_id_correlativo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: plantillas
--

ALTER SEQUENCE public.correlativo_id_correlativo_seq OWNED BY public.correlativo.id_correlativo;


--
-- Name: documento; Type: TABLE; Schema: public; Owner: plantillas
--

CREATE TABLE public.documento (
    id_documento integer NOT NULL,
    nombre character varying(255) NOT NULL,
    plantilla text NOT NULL,
    plantilla_valor text NOT NULL,
    nombre_plantilla text,
    abreviacion character varying(255),
    de text,
    aprobaron_de integer[],
    para text,
    via text,
    via_actual integer,
    firmado boolean DEFAULT false,
    firmante_actual integer,
    firmaron integer[],
    aprobado_cd boolean DEFAULT false,
    aprobador_cd_actual integer,
    aprobaron_cd integer[],
    referencia text,
    fecha timestamp with time zone,
    observaciones text,
    impreso public.enum_documento_impreso DEFAULT 'NO'::public.enum_documento_impreso,
    anulado boolean DEFAULT false,
    documento_padre integer,
    grupo integer,
    multiple text,
    estado public.enum_documento_estado DEFAULT 'NUEVO'::public.enum_documento_estado,
    _usuario_creacion integer NOT NULL,
    _usuario_modificacion integer,
    _fecha_creacion timestamp with time zone NOT NULL,
    _fecha_modificacion timestamp with time zone NOT NULL
);


ALTER TABLE public.documento OWNER TO plantillas;

--
-- Name: documento_id_documento_seq; Type: SEQUENCE; Schema: public; Owner: plantillas
--

CREATE SEQUENCE public.documento_id_documento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.documento_id_documento_seq OWNER TO plantillas;

--
-- Name: documento_id_documento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: plantillas
--

ALTER SEQUENCE public.documento_id_documento_seq OWNED BY public.documento.id_documento;


--
-- Name: firma; Type: TABLE; Schema: public; Owner: plantillas
--

CREATE TABLE public.firma (
    id_firma integer NOT NULL,
    fid_documento integer NOT NULL,
    hash text,
    codigo character varying(10) NOT NULL,
    _usuario_creacion integer NOT NULL,
    _usuario_modificacion integer,
    _fecha_creacion timestamp with time zone NOT NULL,
    _fecha_modificacion timestamp with time zone NOT NULL
);


ALTER TABLE public.firma OWNER TO plantillas;

--
-- Name: firma_id_firma_seq; Type: SEQUENCE; Schema: public; Owner: plantillas
--

CREATE SEQUENCE public.firma_id_firma_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.firma_id_firma_seq OWNER TO plantillas;

--
-- Name: firma_id_firma_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: plantillas
--

ALTER SEQUENCE public.firma_id_firma_seq OWNED BY public.firma.id_firma;


--
-- Name: historial_catalogo; Type: TABLE; Schema: public; Owner: plantillas
--

CREATE TABLE public.historial_catalogo (
    id_historial_catalogo integer NOT NULL,
    fid_catalogo integer,
    accion public.enum_historial_catalogo_accion NOT NULL,
    datos json NOT NULL,
    _usuario_creacion integer NOT NULL,
    _usuario_modificacion integer,
    _fecha_creacion timestamp with time zone NOT NULL,
    _fecha_modificacion timestamp with time zone NOT NULL
);


ALTER TABLE public.historial_catalogo OWNER TO plantillas;

--
-- Name: historial_catalogo_id_historial_catalogo_seq; Type: SEQUENCE; Schema: public; Owner: plantillas
--

CREATE SEQUENCE public.historial_catalogo_id_historial_catalogo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.historial_catalogo_id_historial_catalogo_seq OWNER TO plantillas;

--
-- Name: historial_catalogo_id_historial_catalogo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: plantillas
--

ALTER SEQUENCE public.historial_catalogo_id_historial_catalogo_seq OWNED BY public.historial_catalogo.id_historial_catalogo;


--
-- Name: historial_flujo; Type: TABLE; Schema: public; Owner: plantillas
--

CREATE TABLE public.historial_flujo (
    id_historial_flujo integer NOT NULL,
    accion public.enum_historial_flujo_accion,
    observacion text,
    estado public.enum_historial_flujo_estado DEFAULT 'ACTIVO'::public.enum_historial_flujo_estado,
    _usuario_creacion integer NOT NULL,
    _usuario_modificacion integer,
    _fecha_creacion timestamp with time zone NOT NULL,
    _fecha_modificacion timestamp with time zone NOT NULL,
    id_documento integer
);


ALTER TABLE public.historial_flujo OWNER TO plantillas;

--
-- Name: historial_flujo_id_historial_flujo_seq; Type: SEQUENCE; Schema: public; Owner: plantillas
--

CREATE SEQUENCE public.historial_flujo_id_historial_flujo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.historial_flujo_id_historial_flujo_seq OWNER TO plantillas;

--
-- Name: historial_flujo_id_historial_flujo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: plantillas
--

ALTER SEQUENCE public.historial_flujo_id_historial_flujo_seq OWNED BY public.historial_flujo.id_historial_flujo;


--
-- Name: menu; Type: TABLE; Schema: public; Owner: plantillas
--

CREATE TABLE public.menu (
    id_menu integer NOT NULL,
    fid_menu_padre integer,
    nombre character varying(100) NOT NULL,
    descripcion character varying(150),
    orden integer,
    ruta character varying(100),
    icono character varying(100),
    estado public.enum_menu_estado DEFAULT 'ACTIVO'::public.enum_menu_estado NOT NULL,
    _usuario_creacion integer NOT NULL,
    _usuario_modificacion integer,
    _fecha_creacion timestamp with time zone NOT NULL,
    _fecha_modificacion timestamp with time zone NOT NULL
);


ALTER TABLE public.menu OWNER TO plantillas;

--
-- Name: menu_id_menu_seq; Type: SEQUENCE; Schema: public; Owner: plantillas
--

CREATE SEQUENCE public.menu_id_menu_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menu_id_menu_seq OWNER TO plantillas;

--
-- Name: menu_id_menu_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: plantillas
--

ALTER SEQUENCE public.menu_id_menu_seq OWNED BY public.menu.id_menu;


--
-- Name: monitor; Type: TABLE; Schema: public; Owner: plantillas
--

CREATE TABLE public.monitor (
    id_monitor integer NOT NULL,
    fid_usuario integer NOT NULL,
    fid_documento integer NOT NULL,
    fecha_visita date NOT NULL,
    ip text NOT NULL,
    mac text,
    contador integer NOT NULL,
    relacionado boolean DEFAULT false,
    cite boolean DEFAULT false,
    _usuario_creacion integer NOT NULL,
    _usuario_modificacion integer,
    _fecha_creacion timestamp with time zone NOT NULL,
    _fecha_modificacion timestamp with time zone NOT NULL
);


ALTER TABLE public.monitor OWNER TO plantillas;

--
-- Name: monitor_id_monitor_seq; Type: SEQUENCE; Schema: public; Owner: plantillas
--

CREATE SEQUENCE public.monitor_id_monitor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.monitor_id_monitor_seq OWNER TO plantillas;

--
-- Name: monitor_id_monitor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: plantillas
--

ALTER SEQUENCE public.monitor_id_monitor_seq OWNED BY public.monitor.id_monitor;


--
-- Name: notificacion; Type: TABLE; Schema: public; Owner: plantillas
--

CREATE TABLE public.notificacion (
    id_notificacion integer NOT NULL,
    destinatario integer NOT NULL,
    canal public.enum_notificacion_canal NOT NULL,
    mensaje text NOT NULL,
    estado public.enum_notificacion_estado DEFAULT 'ACTIVO'::public.enum_notificacion_estado,
    tipo public.enum_notificacion_tipo DEFAULT 'EXITO'::public.enum_notificacion_tipo,
    detalle text,
    _usuario_creacion integer NOT NULL,
    _usuario_modificacion integer,
    _fecha_creacion timestamp with time zone NOT NULL,
    _fecha_modificacion timestamp with time zone NOT NULL,
    fid_documento integer
);


ALTER TABLE public.notificacion OWNER TO plantillas;

--
-- Name: notificacion_id_notificacion_seq; Type: SEQUENCE; Schema: public; Owner: plantillas
--

CREATE SEQUENCE public.notificacion_id_notificacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notificacion_id_notificacion_seq OWNER TO plantillas;

--
-- Name: notificacion_id_notificacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: plantillas
--

ALTER SEQUENCE public.notificacion_id_notificacion_seq OWNED BY public.notificacion.id_notificacion;


--
-- Name: partida; Type: TABLE; Schema: public; Owner: plantillas
--

CREATE TABLE public.partida (
    id_partida integer NOT NULL,
    cite_ref character varying(100),
    cite character varying(100),
    numero character varying(50) NOT NULL,
    descripcion text,
    monto numeric(15,2),
    fid_partida integer,
    multiple integer,
    gestion character varying(5) NOT NULL,
    estado public.enum_partida_estado DEFAULT 'ACTIVO'::public.enum_partida_estado NOT NULL,
    tipo public.enum_partida_tipo NOT NULL,
    _usuario_creacion integer NOT NULL,
    _usuario_modificacion integer,
    _fecha_creacion timestamp with time zone NOT NULL,
    _fecha_modificacion timestamp with time zone NOT NULL
);


ALTER TABLE public.partida OWNER TO plantillas;

--
-- Name: partida_id_partida_seq; Type: SEQUENCE; Schema: public; Owner: plantillas
--

CREATE SEQUENCE public.partida_id_partida_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.partida_id_partida_seq OWNER TO plantillas;

--
-- Name: partida_id_partida_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: plantillas
--

ALTER SEQUENCE public.partida_id_partida_seq OWNED BY public.partida.id_partida;


--
-- Name: plantilla_formly; Type: TABLE; Schema: public; Owner: plantillas
--

CREATE TABLE public.plantilla_formly (
    id_plantilla_formly integer NOT NULL,
    nombre character varying(255) NOT NULL,
    abreviacion character varying(255) NOT NULL,
    plantilla text NOT NULL,
    plantilla_valor text,
    estado public.enum_plantilla_formly_estado DEFAULT 'ACTIVO'::public.enum_plantilla_formly_estado,
    _usuario_creacion integer NOT NULL,
    _usuario_modificacion integer,
    _fecha_creacion timestamp with time zone NOT NULL,
    _fecha_modificacion timestamp with time zone NOT NULL
);


ALTER TABLE public.plantilla_formly OWNER TO plantillas;

--
-- Name: plantilla_formly_id_plantilla_formly_seq; Type: SEQUENCE; Schema: public; Owner: plantillas
--

CREATE SEQUENCE public.plantilla_formly_id_plantilla_formly_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plantilla_formly_id_plantilla_formly_seq OWNER TO plantillas;

--
-- Name: plantilla_formly_id_plantilla_formly_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: plantillas
--

ALTER SEQUENCE public.plantilla_formly_id_plantilla_formly_seq OWNED BY public.plantilla_formly.id_plantilla_formly;


--
-- Name: rol; Type: TABLE; Schema: public; Owner: plantillas
--

CREATE TABLE public.rol (
    id_rol integer NOT NULL,
    nombre character varying(100) NOT NULL,
    descripcion character varying(255),
    peso integer NOT NULL,
    estado public.enum_rol_estado DEFAULT 'ACTIVO'::public.enum_rol_estado,
    _usuario_creacion integer NOT NULL,
    _usuario_modificacion integer,
    _fecha_creacion timestamp with time zone NOT NULL,
    _fecha_modificacion timestamp with time zone NOT NULL
);


ALTER TABLE public.rol OWNER TO plantillas;

--
-- Name: rol_id_rol_seq; Type: SEQUENCE; Schema: public; Owner: plantillas
--

CREATE SEQUENCE public.rol_id_rol_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rol_id_rol_seq OWNER TO plantillas;

--
-- Name: rol_id_rol_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: plantillas
--

ALTER SEQUENCE public.rol_id_rol_seq OWNED BY public.rol.id_rol;


--
-- Name: rol_menu; Type: TABLE; Schema: public; Owner: plantillas
--

CREATE TABLE public.rol_menu (
    id_rol_menu integer NOT NULL,
    fid_rol integer NOT NULL,
    fid_menu integer NOT NULL,
    estado character varying(30) DEFAULT 'ACTIVO'::character varying NOT NULL,
    _usuario_creacion integer NOT NULL,
    _usuario_modificacion integer,
    _fecha_creacion timestamp with time zone NOT NULL,
    _fecha_modificacion timestamp with time zone NOT NULL
);


ALTER TABLE public.rol_menu OWNER TO plantillas;

--
-- Name: rol_menu_id_rol_menu_seq; Type: SEQUENCE; Schema: public; Owner: plantillas
--

CREATE SEQUENCE public.rol_menu_id_rol_menu_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rol_menu_id_rol_menu_seq OWNER TO plantillas;

--
-- Name: rol_menu_id_rol_menu_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: plantillas
--

ALTER SEQUENCE public.rol_menu_id_rol_menu_seq OWNED BY public.rol_menu.id_rol_menu;


--
-- Name: solicitud_aprobacion_cd; Type: TABLE; Schema: public; Owner: plantillas
--

CREATE TABLE public.solicitud_aprobacion_cd (
    id integer NOT NULL,
    uuid_solicitud character varying(255) NOT NULL,
    respuesta_servicio_aprobacion text,
    fecha_aprobacion timestamp with time zone,
    tipo public.enum_solicitud_aprobacion_cd_tipo NOT NULL,
    estado public.enum_solicitud_aprobacion_cd_estado NOT NULL,
    _usuario_creacion integer NOT NULL,
    _usuario_modificacion integer,
    _fecha_creacion timestamp with time zone NOT NULL,
    _fecha_modificacion timestamp with time zone NOT NULL,
    fid_adjunto_aprobacion_cd integer,
    fid_documento integer
);


ALTER TABLE public.solicitud_aprobacion_cd OWNER TO plantillas;

--
-- Name: solicitud_aprobacion_cd_id_seq; Type: SEQUENCE; Schema: public; Owner: plantillas
--

CREATE SEQUENCE public.solicitud_aprobacion_cd_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solicitud_aprobacion_cd_id_seq OWNER TO plantillas;

--
-- Name: solicitud_aprobacion_cd_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: plantillas
--

ALTER SEQUENCE public.solicitud_aprobacion_cd_id_seq OWNED BY public.solicitud_aprobacion_cd.id;


--
-- Name: unidad; Type: TABLE; Schema: public; Owner: plantillas
--

CREATE TABLE public.unidad (
    id_unidad integer NOT NULL,
    nombre character varying(255) NOT NULL,
    abreviacion text NOT NULL,
    estado public.enum_unidad_estado DEFAULT 'ACTIVO'::public.enum_unidad_estado,
    _usuario_creacion integer NOT NULL,
    _usuario_modificacion integer,
    _fecha_creacion timestamp with time zone NOT NULL,
    _fecha_modificacion timestamp with time zone NOT NULL
);


ALTER TABLE public.unidad OWNER TO plantillas;

--
-- Name: unidad_id_unidad_seq; Type: SEQUENCE; Schema: public; Owner: plantillas
--

CREATE SEQUENCE public.unidad_id_unidad_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.unidad_id_unidad_seq OWNER TO plantillas;

--
-- Name: unidad_id_unidad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: plantillas
--

ALTER SEQUENCE public.unidad_id_unidad_seq OWNED BY public.unidad.id_unidad;


--
-- Name: usuario; Type: TABLE; Schema: public; Owner: plantillas
--

CREATE TABLE public.usuario (
    id_usuario integer NOT NULL,
    fid_unidad integer,
    usuario character varying(255) NOT NULL,
    contrasena character varying(255) NOT NULL,
    numero_documento character varying(255) NOT NULL,
    nombres character varying(255) NOT NULL,
    apellidos character varying(255) NOT NULL,
    cargo character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    virtual boolean DEFAULT false,
    estado public.enum_usuario_estado DEFAULT 'ACTIVO'::public.enum_usuario_estado,
    _usuario_creacion integer NOT NULL,
    _usuario_modificacion integer,
    _fecha_creacion timestamp with time zone NOT NULL,
    _fecha_modificacion timestamp with time zone NOT NULL
);


ALTER TABLE public.usuario OWNER TO plantillas;

--
-- Name: usuario_externo; Type: TABLE; Schema: public; Owner: plantillas
--

CREATE TABLE public.usuario_externo (
    id_usuario_externo integer NOT NULL,
    entidad character varying(255) NOT NULL,
    contacto character varying(255) NOT NULL,
    iat integer,
    key character varying(50),
    estado public.enum_usuario_externo_estado DEFAULT 'ACTIVO'::public.enum_usuario_externo_estado,
    _fecha_creacion timestamp with time zone NOT NULL,
    _fecha_modificacion timestamp with time zone NOT NULL
);


ALTER TABLE public.usuario_externo OWNER TO plantillas;

--
-- Name: usuario_externo_id_usuario_externo_seq; Type: SEQUENCE; Schema: public; Owner: plantillas
--

CREATE SEQUENCE public.usuario_externo_id_usuario_externo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_externo_id_usuario_externo_seq OWNER TO plantillas;

--
-- Name: usuario_externo_id_usuario_externo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: plantillas
--

ALTER SEQUENCE public.usuario_externo_id_usuario_externo_seq OWNED BY public.usuario_externo.id_usuario_externo;


--
-- Name: usuario_his; Type: TABLE; Schema: public; Owner: plantillas
--

CREATE TABLE public.usuario_his (
    id_usuario_his integer NOT NULL,
    fid_usuario integer NOT NULL,
    usuario character varying(255) NOT NULL,
    contrasena character varying(255) NOT NULL,
    numero_documento character varying(255) NOT NULL,
    nombre character varying(255) NOT NULL,
    apellido character varying(255) NOT NULL,
    cargo character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    estado public.enum_usuario_his_estado DEFAULT 'ACTIVO'::public.enum_usuario_his_estado,
    _usuario_creacion integer NOT NULL,
    _usuario_modificacion integer,
    _fecha_creacion timestamp with time zone NOT NULL,
    _fecha_modificacion timestamp with time zone NOT NULL
);


ALTER TABLE public.usuario_his OWNER TO plantillas;

--
-- Name: usuario_his_id_usuario_his_seq; Type: SEQUENCE; Schema: public; Owner: plantillas
--

CREATE SEQUENCE public.usuario_his_id_usuario_his_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_his_id_usuario_his_seq OWNER TO plantillas;

--
-- Name: usuario_his_id_usuario_his_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: plantillas
--

ALTER SEQUENCE public.usuario_his_id_usuario_his_seq OWNED BY public.usuario_his.id_usuario_his;


--
-- Name: usuario_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: plantillas
--

CREATE SEQUENCE public.usuario_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_id_usuario_seq OWNER TO plantillas;

--
-- Name: usuario_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: plantillas
--

ALTER SEQUENCE public.usuario_id_usuario_seq OWNED BY public.usuario.id_usuario;


--
-- Name: usuario_rol; Type: TABLE; Schema: public; Owner: plantillas
--

CREATE TABLE public.usuario_rol (
    id_usuario_rol integer NOT NULL,
    fid_usuario integer NOT NULL,
    fid_rol integer NOT NULL,
    estado public.enum_usuario_rol_estado DEFAULT 'ACTIVO'::public.enum_usuario_rol_estado NOT NULL,
    _usuario_creacion integer NOT NULL,
    _usuario_modificacion integer,
    _fecha_creacion timestamp with time zone NOT NULL,
    _fecha_modificacion timestamp with time zone NOT NULL
);


ALTER TABLE public.usuario_rol OWNER TO plantillas;

--
-- Name: usuario_rol_id_usuario_rol_seq; Type: SEQUENCE; Schema: public; Owner: plantillas
--

CREATE SEQUENCE public.usuario_rol_id_usuario_rol_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_rol_id_usuario_rol_seq OWNER TO plantillas;

--
-- Name: usuario_rol_id_usuario_rol_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: plantillas
--

ALTER SEQUENCE public.usuario_rol_id_usuario_rol_seq OWNED BY public.usuario_rol.id_usuario_rol;


--
-- Name: virtual; Type: TABLE; Schema: public; Owner: plantillas
--

CREATE TABLE public.virtual (
    id_virtual integer NOT NULL,
    fid_usuario_titular integer NOT NULL,
    fid_usuario_virtual integer NOT NULL,
    estado public.enum_virtual_estado DEFAULT 'ACTIVO'::public.enum_virtual_estado,
    _usuario_creacion integer NOT NULL,
    _usuario_modificacion integer,
    _fecha_creacion timestamp with time zone NOT NULL,
    _fecha_modificacion timestamp with time zone NOT NULL
);


ALTER TABLE public.virtual OWNER TO plantillas;

--
-- Name: virtual_his; Type: TABLE; Schema: public; Owner: plantillas
--

CREATE TABLE public.virtual_his (
    id_virtual_his integer NOT NULL,
    fid_virtual integer NOT NULL,
    id_virtual integer NOT NULL,
    id_titular integer NOT NULL,
    accion public.enum_virtual_his_accion DEFAULT 'ACTIVO'::public.enum_virtual_his_accion,
    _usuario_creacion integer NOT NULL,
    _usuario_modificacion integer,
    _fecha_creacion timestamp with time zone NOT NULL,
    _fecha_modificacion timestamp with time zone NOT NULL
);


ALTER TABLE public.virtual_his OWNER TO plantillas;

--
-- Name: virtual_his_id_virtual_his_seq; Type: SEQUENCE; Schema: public; Owner: plantillas
--

CREATE SEQUENCE public.virtual_his_id_virtual_his_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.virtual_his_id_virtual_his_seq OWNER TO plantillas;

--
-- Name: virtual_his_id_virtual_his_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: plantillas
--

ALTER SEQUENCE public.virtual_his_id_virtual_his_seq OWNED BY public.virtual_his.id_virtual_his;


--
-- Name: virtual_id_virtual_seq; Type: SEQUENCE; Schema: public; Owner: plantillas
--

CREATE SEQUENCE public.virtual_id_virtual_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.virtual_id_virtual_seq OWNER TO plantillas;

--
-- Name: virtual_id_virtual_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: plantillas
--

ALTER SEQUENCE public.virtual_id_virtual_seq OWNED BY public.virtual.id_virtual;


--
-- Name: adjunto_aprobacion_cd id; Type: DEFAULT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.adjunto_aprobacion_cd ALTER COLUMN id SET DEFAULT nextval('public.adjunto_aprobacion_cd_id_seq'::regclass);


--
-- Name: auth id; Type: DEFAULT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.auth ALTER COLUMN id SET DEFAULT nextval('public.auth_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: catalogo id_catalogo; Type: DEFAULT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.catalogo ALTER COLUMN id_catalogo SET DEFAULT nextval('public.catalogo_id_catalogo_seq'::regclass);


--
-- Name: catalogo_documento id_catalogo_documento; Type: DEFAULT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.catalogo_documento ALTER COLUMN id_catalogo_documento SET DEFAULT nextval('public.catalogo_documento_id_catalogo_documento_seq'::regclass);


--
-- Name: catalogo_usuario id_catalogo_usuario; Type: DEFAULT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.catalogo_usuario ALTER COLUMN id_catalogo_usuario SET DEFAULT nextval('public.catalogo_usuario_id_catalogo_usuario_seq'::regclass);


--
-- Name: conf_notificacion id_conf_notificacion; Type: DEFAULT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.conf_notificacion ALTER COLUMN id_conf_notificacion SET DEFAULT nextval('public.conf_notificacion_id_conf_notificacion_seq'::regclass);


--
-- Name: contacto id_contacto; Type: DEFAULT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.contacto ALTER COLUMN id_contacto SET DEFAULT nextval('public.contacto_id_contacto_seq'::regclass);


--
-- Name: correlativo id_correlativo; Type: DEFAULT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.correlativo ALTER COLUMN id_correlativo SET DEFAULT nextval('public.correlativo_id_correlativo_seq'::regclass);


--
-- Name: documento id_documento; Type: DEFAULT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.documento ALTER COLUMN id_documento SET DEFAULT nextval('public.documento_id_documento_seq'::regclass);


--
-- Name: firma id_firma; Type: DEFAULT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.firma ALTER COLUMN id_firma SET DEFAULT nextval('public.firma_id_firma_seq'::regclass);


--
-- Name: historial_catalogo id_historial_catalogo; Type: DEFAULT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.historial_catalogo ALTER COLUMN id_historial_catalogo SET DEFAULT nextval('public.historial_catalogo_id_historial_catalogo_seq'::regclass);


--
-- Name: historial_flujo id_historial_flujo; Type: DEFAULT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.historial_flujo ALTER COLUMN id_historial_flujo SET DEFAULT nextval('public.historial_flujo_id_historial_flujo_seq'::regclass);


--
-- Name: menu id_menu; Type: DEFAULT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.menu ALTER COLUMN id_menu SET DEFAULT nextval('public.menu_id_menu_seq'::regclass);


--
-- Name: monitor id_monitor; Type: DEFAULT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.monitor ALTER COLUMN id_monitor SET DEFAULT nextval('public.monitor_id_monitor_seq'::regclass);


--
-- Name: notificacion id_notificacion; Type: DEFAULT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.notificacion ALTER COLUMN id_notificacion SET DEFAULT nextval('public.notificacion_id_notificacion_seq'::regclass);


--
-- Name: partida id_partida; Type: DEFAULT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.partida ALTER COLUMN id_partida SET DEFAULT nextval('public.partida_id_partida_seq'::regclass);


--
-- Name: plantilla_formly id_plantilla_formly; Type: DEFAULT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.plantilla_formly ALTER COLUMN id_plantilla_formly SET DEFAULT nextval('public.plantilla_formly_id_plantilla_formly_seq'::regclass);


--
-- Name: rol id_rol; Type: DEFAULT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.rol ALTER COLUMN id_rol SET DEFAULT nextval('public.rol_id_rol_seq'::regclass);


--
-- Name: rol_menu id_rol_menu; Type: DEFAULT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.rol_menu ALTER COLUMN id_rol_menu SET DEFAULT nextval('public.rol_menu_id_rol_menu_seq'::regclass);


--
-- Name: solicitud_aprobacion_cd id; Type: DEFAULT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.solicitud_aprobacion_cd ALTER COLUMN id SET DEFAULT nextval('public.solicitud_aprobacion_cd_id_seq'::regclass);


--
-- Name: unidad id_unidad; Type: DEFAULT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.unidad ALTER COLUMN id_unidad SET DEFAULT nextval('public.unidad_id_unidad_seq'::regclass);


--
-- Name: usuario id_usuario; Type: DEFAULT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuario_id_usuario_seq'::regclass);


--
-- Name: usuario_externo id_usuario_externo; Type: DEFAULT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.usuario_externo ALTER COLUMN id_usuario_externo SET DEFAULT nextval('public.usuario_externo_id_usuario_externo_seq'::regclass);


--
-- Name: usuario_his id_usuario_his; Type: DEFAULT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.usuario_his ALTER COLUMN id_usuario_his SET DEFAULT nextval('public.usuario_his_id_usuario_his_seq'::regclass);


--
-- Name: usuario_rol id_usuario_rol; Type: DEFAULT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.usuario_rol ALTER COLUMN id_usuario_rol SET DEFAULT nextval('public.usuario_rol_id_usuario_rol_seq'::regclass);


--
-- Name: virtual id_virtual; Type: DEFAULT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.virtual ALTER COLUMN id_virtual SET DEFAULT nextval('public.virtual_id_virtual_seq'::regclass);


--
-- Name: virtual_his id_virtual_his; Type: DEFAULT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.virtual_his ALTER COLUMN id_virtual_his SET DEFAULT nextval('public.virtual_his_id_virtual_his_seq'::regclass);


--
-- Data for Name: adjunto_aprobacion_cd; Type: TABLE DATA; Schema: public; Owner: plantillas
--

COPY public.adjunto_aprobacion_cd (id, nombre_publico, nombre_privado, url, estado, _usuario_creacion, _usuario_modificacion, _fecha_creacion, _fecha_modificacion, fid_documento) FROM stdin;
\.


--
-- Data for Name: auth; Type: TABLE DATA; Schema: public; Owner: plantillas
--

COPY public.auth (id, state, parametros, tokens, id_usuario, estado, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: plantillas
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, cargo, ci, habilitado_marcar, cas, fecha_asignacion, nro_item, unidad_dependencia) FROM stdin;
\.


--
-- Data for Name: catalogo; Type: TABLE DATA; Schema: public; Owner: plantillas
--

COPY public.catalogo (id_catalogo, nombre, descripcion, comentario, propietario, estado, _usuario_creacion, _usuario_modificacion, _fecha_creacion, _fecha_modificacion) FROM stdin;
\.


--
-- Data for Name: catalogo_documento; Type: TABLE DATA; Schema: public; Owner: plantillas
--

COPY public.catalogo_documento (id_catalogo_documento, fid_catalogo, fid_documento, descripcion, estado, orden, _usuario_creacion, _usuario_modificacion, _fecha_creacion, _fecha_modificacion) FROM stdin;
\.


--
-- Data for Name: catalogo_usuario; Type: TABLE DATA; Schema: public; Owner: plantillas
--

COPY public.catalogo_usuario (id_catalogo_usuario, fid_catalogo, fid_usuario, lectura, escritura, eliminar, estado, _usuario_creacion, _usuario_modificacion, _fecha_creacion, _fecha_modificacion) FROM stdin;
\.


--
-- Data for Name: conf_notificacion; Type: TABLE DATA; Schema: public; Owner: plantillas
--

COPY public.conf_notificacion (id_conf_notificacion, fid_usuario, celular, canal, canal_habilitado, enviado, observado, aprobado, derivado, aprobar_ciudadania, aprobados_ciudadania, estado, _usuario_creacion, _usuario_modificacion, _fecha_creacion, _fecha_modificacion) FROM stdin;
1	2	77777777	CORREO	t	t	t	t	t	t	t	ACTIVO	1	1	2026-08-07 22:54:24.807+00	2026-08-07 22:54:24.807+00
\.


--
-- Data for Name: contacto; Type: TABLE DATA; Schema: public; Owner: plantillas
--

COPY public.contacto (id_contacto, grado, nombres, apellidos, cargo, entidad, tipo_entidad, sigla, direccion, telefono, departamento, estado, _usuario_creacion, _usuario_modificacion, _fecha_creacion, _fecha_modificacion) FROM stdin;
\.


--
-- Data for Name: correlativo; Type: TABLE DATA; Schema: public; Owner: plantillas
--

COPY public.correlativo (id_correlativo, abreviacion, valor, anio, estado, _usuario_creacion, _usuario_modificacion, _fecha_creacion, _fecha_modificacion) FROM stdin;
\.


--
-- Data for Name: documento; Type: TABLE DATA; Schema: public; Owner: plantillas
--

COPY public.documento (id_documento, nombre, plantilla, plantilla_valor, nombre_plantilla, abreviacion, de, aprobaron_de, para, via, via_actual, firmado, firmante_actual, firmaron, aprobado_cd, aprobador_cd_actual, aprobaron_cd, referencia, fecha, observaciones, impreso, anulado, documento_padre, grupo, multiple, estado, _usuario_creacion, _usuario_modificacion, _fecha_creacion, _fecha_modificacion) FROM stdin;
\.


--
-- Data for Name: firma; Type: TABLE DATA; Schema: public; Owner: plantillas
--

COPY public.firma (id_firma, fid_documento, hash, codigo, _usuario_creacion, _usuario_modificacion, _fecha_creacion, _fecha_modificacion) FROM stdin;
\.


--
-- Data for Name: historial_catalogo; Type: TABLE DATA; Schema: public; Owner: plantillas
--

COPY public.historial_catalogo (id_historial_catalogo, fid_catalogo, accion, datos, _usuario_creacion, _usuario_modificacion, _fecha_creacion, _fecha_modificacion) FROM stdin;
\.


--
-- Data for Name: historial_flujo; Type: TABLE DATA; Schema: public; Owner: plantillas
--

COPY public.historial_flujo (id_historial_flujo, accion, observacion, estado, _usuario_creacion, _usuario_modificacion, _fecha_creacion, _fecha_modificacion, id_documento) FROM stdin;
\.


--
-- Data for Name: menu; Type: TABLE DATA; Schema: public; Owner: plantillas
--

COPY public.menu (id_menu, fid_menu_padre, nombre, descripcion, orden, ruta, icono, estado, _usuario_creacion, _usuario_modificacion, _fecha_creacion, _fecha_modificacion) FROM stdin;
1	\N	CONFIGURACIÓN	Configuración	1		build	ACTIVO	1	1	2026-08-07 22:54:24.741+00	2026-08-07 22:54:24.741+00
2	1	PLANTILLAS	Bandeja de plantillas de documentos	1	plantillas	settings	ACTIVO	1	1	2026-08-07 22:54:24.741+00	2026-08-07 22:54:24.741+00
3	\N	ADMINISTRACIÓN	Administración	2		settings	ACTIVO	1	1	2026-08-07 22:54:24.741+00	2026-08-07 22:54:24.741+00
4	3	USUARIOS	Administración de usuarios	1	usuario	group	ACTIVO	1	1	2026-08-07 22:54:24.741+00	2026-08-07 22:54:24.741+00
5	3	ROLES	Administración de roles	2	rol	credit_card	ACTIVO	1	1	2026-08-07 22:54:24.741+00	2026-08-07 22:54:24.741+00
6	3	MENÚS	Administración de menús	3	menu	menu	ACTIVO	1	1	2026-08-07 22:54:24.741+00	2026-08-07 22:54:24.741+00
7	\N	DOCUMENTOS	Documentos	3		folder	ACTIVO	1	1	2026-08-07 22:54:24.741+00	2026-08-07 22:54:24.741+00
8	7	MIS DOCUMENTOS	Bandeja de documentos	2	documentos	description	ACTIVO	1	1	2026-08-07 22:54:24.741+00	2026-08-07 22:54:24.741+00
9	7	DOCUMENTOS PENDIENTES	Bandeja de documentos pendientes	3	aprobacion	description	ACTIVO	1	1	2026-08-07 22:54:24.741+00	2026-08-07 22:54:24.741+00
10	7	IMPRIMIR DOCUMENTOS	Bandeja de documentos para impresión	4	impresion	description	ACTIVO	1	1	2026-08-07 22:54:24.741+00	2026-08-07 22:54:24.741+00
11	7	DERIVADOS	Bandeja de documentos derivados	0	aprobacion	description	ACTIVO	1	1	2026-08-07 22:54:24.741+00	2026-08-07 22:54:24.741+00
12	7	EN CURSO	Bandeja de documentos en curso	0	en_curso	description	ACTIVO	1	1	2026-08-07 22:54:24.741+00	2026-08-07 22:54:24.741+00
13	7	MONITOREO	Bandeja de monitoreo de solicitud de documentos	0	monitoreo	description	ACTIVO	1	1	2026-08-07 22:54:24.741+00	2026-08-07 22:54:24.741+00
14	7	FIRMAR	Bandeja de documentos a firmar	1	firmar	fingerprint	ACTIVO	1	1	2026-08-07 22:54:24.741+00	2026-08-07 22:54:24.741+00
15	7	APROBAR CON CD	Bandeja de documentos a aprobar	1	aprobar_documento	fingerprint	ACTIVO	1	1	2026-08-07 22:54:24.741+00	2026-08-07 22:54:24.741+00
16	7	CONTACTOS	Bandeja de contactos	1	contactos	user	ACTIVO	1	1	2026-08-07 22:54:24.741+00	2026-08-07 22:54:24.741+00
17	\N	CATALOGOS	Gestión de catálogos	1		folder	ACTIVO	1	1	2026-08-07 22:54:24.741+00	2026-08-07 22:54:24.741+00
18	17	MIS CATALOGOS	Bandeja de mis catálogos	1	catalogos	folder	ACTIVO	1	1	2026-08-07 22:54:24.741+00	2026-08-07 22:54:24.741+00
19	17	COMPARTIDOS	Bandeja de catálogos compartidos	1	compartidos	user	ACTIVO	1	1	2026-08-07 22:54:24.741+00	2026-08-07 22:54:24.741+00
\.


--
-- Data for Name: monitor; Type: TABLE DATA; Schema: public; Owner: plantillas
--

COPY public.monitor (id_monitor, fid_usuario, fid_documento, fecha_visita, ip, mac, contador, relacionado, cite, _usuario_creacion, _usuario_modificacion, _fecha_creacion, _fecha_modificacion) FROM stdin;
\.


--
-- Data for Name: notificacion; Type: TABLE DATA; Schema: public; Owner: plantillas
--

COPY public.notificacion (id_notificacion, destinatario, canal, mensaje, estado, tipo, detalle, _usuario_creacion, _usuario_modificacion, _fecha_creacion, _fecha_modificacion, fid_documento) FROM stdin;
\.


--
-- Data for Name: partida; Type: TABLE DATA; Schema: public; Owner: plantillas
--

COPY public.partida (id_partida, cite_ref, cite, numero, descripcion, monto, fid_partida, multiple, gestion, estado, tipo, _usuario_creacion, _usuario_modificacion, _fecha_creacion, _fecha_modificacion) FROM stdin;
\.


--
-- Data for Name: plantilla_formly; Type: TABLE DATA; Schema: public; Owner: plantillas
--

COPY public.plantilla_formly (id_plantilla_formly, nombre, abreviacion, plantilla, plantilla_valor, estado, _usuario_creacion, _usuario_modificacion, _fecha_creacion, _fecha_modificacion) FROM stdin;
1	Memorandum	M	[{"type":"cite","key":0,"templateOptions":{"labelCite":"CITE","labelFecha":"FECHA","tipo":"general","numeracionPagina":"true"}},{"type":"texto","key":"texto","templateOptions":{"label":"MEMORÁNDUM","tipo":"h2","className":"ap-text-center","mTop":true,"mBot":true}},{"type":"encabezado","key":"encabezado","templateOptions":{"labelw":10,"labelRef":"ASUNTO:","show":{"para":true,"via":true,"de":true,"ref":true}}},{"type":"datosGenerales","key":"datosGenerales","templateOptions":{"labelw":10,"showItem":false,"labelRef":"REF.:","show":{"para":true,"via":true,"de":true,"ref":false},"aprobarPorDireccion":false}},{"type":"documentosRelacionados","key":"documentosRelacionados","templateOptions":{"labelw":10,"label":"Referencias:"}},{"type":"textarea","key":"inputTextArea","templateOptions":{"label":"","rows":4,"grow":false,"required":true}},{"type":"texto","key":"parrafo","templateOptions":{"label":"Sin otro particular saludo a usted, atentamente.","tipo":"p","className":"ap-text-left","mTop":true,"mBot":true}},{"type":"vacio","key":0,"templateOptions":{"height":"2","style":{"height":"2cm"}}},{"type":"ccArchivo","key":"ccArchivo","templateOptions":{"labelw":10,"label":"CC/Archivo:"}}]	{"textarea-3":"Vanessa Villarreal\\nProfesional en Planificación","textarea-4":"Clara Fedra Valverde\\nJefe de la Unidad Administrativa Fin"}	ACTIVO	100	100	2016-12-14 21:48:01.769+00	2017-01-27 15:39:00.025+00
2	Nota Externa	NE	[{"type":"cite","key":0,"templateOptions":{"labelCite":"CITE","labelFecha":"FECHA","tipo":"general","tipoMembrete":"externo","numeracionPagina":"true"}},{"type":"vacio","key":0,"templateOptions":{"height":"1.4","style":{"height":"1.4cm"}}},{"type":"textarea","key":"inputTextArea","templateOptions":{"label":"","rows":2,"grow":false,"required":true}},{"type":"texto","key":"parrafo","templateOptions":{"label":"Presente.-","tipo":"p","className":"ap-text-left","mTop":true,"mBot":true}},{"type":"vacio","key":0,"templateOptions":{"height":"0.50","style":{"height":"0.50cm"}}},{"type":"inputt","key":0,"templateOptions":{"labelw":25,"labelx":"REF.:","required":true}},{"type":"texto","key":"parrafo","templateOptions":{"label":"De mi consideración:","tipo":"p","className":"ap-text-left","mTop":true,"mBot":true}},{"type":"vacio","key":0,"templateOptions":{"height":"0.5","style":{"height":"0.5cm"}}},{"type":"textarea","key":"inputTextArea","templateOptions":{"label":"","rows":2,"grow":false,"required":false}},{"type":"editorTexto","key":0,"templateOptions":{"label":"jojojo"}},{"type":"texto","key":"parrafo","templateOptions":{"label":"Sin otro particular, saludo a usted atentamente.","tipo":"p","className":"ap-text-left","mTop":true,"mBot":true}},{"type":"ccArchivo","key":"ccArchivo","templateOptions":{"labelw":10,"label":"CC/Archivo:"}},{"type":"datosGenerales","key":"datosGenerales","templateOptions":{"labelw":10,"labelRef":"","showItem":false,"show":{"para":true,"via":true,"de":true,"ref":false},"aprobarPorDireccion":false}}]	{"editorTexto-0":"","textarea-1":""}	ACTIVO	100	100	2016-12-15 21:07:42.44+00	2017-02-01 20:07:36.824+00
3	Informe de Comisión	IC	[{"type":"cite","key":0,"templateOptions":{"labelCite":"CITE","labelFecha":"FECHA","tipo":"general","numeracionPagina":"true"}},{"type":"texto","key":"texto","templateOptions":{"label":"INFORME DE COMISIÓN","tipo":"h2","className":"ap-text-center","mTop":true,"mBot":true}},{"type":"datosGenerales","key":"datosGenerales","templateOptions":{"labelw":10,"labelRef":"ASUNTO:","showItem":true,"show":{"para":true,"via":false,"de":true,"ref":true}}},{"type":"vacio","templateOptions":{"height":1,"style":{}}},{"type":"texto","key":"texto","templateOptions":{"label":"ANTECEDENTES","tipo":"h3","className":"ap-text-left","mTop":true,"mBot":true}},{"type":"textarea","key":"inputTextArea","templateOptions":{"label":"","rows":2,"grow":false,"required":true}},{"type":"texto","key":"texto","templateOptions":{"label":"DESARROLLO","tipo":"h3","className":"ap-text-left","mTop":true,"mBot":true}},{"type":"textarea","key":"inputTextArea","templateOptions":{"label":"","rows":2,"grow":false,"required":true}},{"type":"editorTexto","templateOptions":{"label":"jojojo"}},{"type":"texto","key":"texto","templateOptions":{"label":"CONCLUSIONES","tipo":"h3","className":"ap-text-left","mTop":true,"mBot":true}},{"type":"textarea","key":"inputTextArea","templateOptions":{"label":"","rows":2,"grow":false,"required":true}},{"type":"vacio","templateOptions":{"height":1,"style":{}}},{"type":"ccArchivo","key":"ccArchivo","templateOptions":{"labelw":10,"label":"CC/Archivo:"}}]	{}	ACTIVO	100	100	2016-12-27 22:06:49.812+00	2017-01-27 15:34:57.707+00
4	Informe Técnico	IT	[{"type":"cite","key":0,"templateOptions":{"labelCite":"CITE","labelFecha":"FECHA","tipo":"unidad","numeracionPagina":"true"}},{"type":"texto","key":"texto","templateOptions":{"label":"INFORME TÉCNICO","tipo":"h2","className":"ap-text-center","mTop":true,"mBot":true}},{"type":"datosGenerales","key":"datosGenerales","templateOptions":{"labelw":10,"showItem":true,"labelRef":"ASUNTO.:","show":{"para":true,"via":true,"de":true,"ref":true}}},{"type":"documentosRelacionados","key":"documentosRelacionados","templateOptions":{"labelw":10,"showItem":true,"label":"Referencias:"}},{"type":"textarea","key":"inputTextArea","templateOptions":{"label":"","rows":2,"grow":false,"required":false}},{"type":"texto","key":"texto","templateOptions":{"label":"ANTECEDENTES","tipo":"h3","className":"ap-text-left","mTop":true,"mBot":true}},{"type":"textarea","key":"inputTextArea","templateOptions":{"label":"","rows":2,"grow":false,"required":false}},{"type":"editorTexto","key":0,"templateOptions":{"label":"jojojo"}},{"type":"texto","key":"texto","templateOptions":{"label":"DESARROLLO","tipo":"h3","className":"ap-text-left","mTop":true,"mBot":true}},{"type":"textarea","key":"inputTextArea","templateOptions":{"label":"","rows":2,"grow":false,"required":true}},{"type":"editorTexto","key":0,"templateOptions":{"label":"jojojo"}},{"type":"textarea","key":"inputTextArea","templateOptions":{"label":"","rows":2,"grow":false}},{"type":"texto","key":"texto","templateOptions":{"label":"CONCLUSIONES","tipo":"h3","className":"ap-text-left","mTop":true,"mBot":true}},{"type":"textarea","key":"inputTextArea","templateOptions":{"label":"","rows":2,"grow":false,"required":true}},{"type":"editorTexto","key":0,"templateOptions":{"label":"jojojo"}},{"type":"texto","key":"texto","templateOptions":{"label":"RECOMENDACIONES","tipo":"h3","className":"ap-text-left","mTop":true,"mBot":true}},{"type":"textarea","key":"inputTextArea","templateOptions":{"label":"","rows":2,"grow":false,"required":true}},{"type":"editorTexto","templateOptions":{"label":"jojojo"}},{"type":"ccArchivo","key":"ccArchivo","templateOptions":{"labelw":10,"label":"CC/Archivo:"}}]	{}	ACTIVO	100	100	2016-12-15 14:29:25.318+00	2017-01-27 15:29:28.588+00
5	Informe Técnico - Aprobación CD	IT-ACD	[{"type":"cite","key":0,"templateOptions":{"labelCite":"CITE","labelFecha":"FECHA","tipo":"unidad","numeracionPagina":"true"}},{"type":"texto","key":"texto","templateOptions":{"label":"INFORME TÉCNICO","tipo":"h2","className":"ap-text-center","mTop":true,"mBot":true}},{"type":"datosGenerales","key":"datosGenerales","templateOptions":{"labelw":10,"showItem":true,"labelRef":"ASUNTO.:","show":{"para":true,"via":true,"de":true,"ref":true}}},{"type":"documentosRelacionados","key":"documentosRelacionados","templateOptions":{"labelw":10,"showItem":true,"label":"Referencias:"}},{"type":"textarea","key":"inputTextArea","templateOptions":{"label":"","rows":2,"grow":false,"required":false}},{"type":"texto","key":"texto","templateOptions":{"label":"ANTECEDENTES","tipo":"h3","className":"ap-text-left","mTop":true,"mBot":true}},{"type":"textarea","key":"inputTextArea","templateOptions":{"label":"","rows":2,"grow":false,"required":false}},{"type":"editorTexto","key":0,"templateOptions":{"label":"jojojo"}},{"type":"texto","key":"texto","templateOptions":{"label":"DESARROLLO","tipo":"h3","className":"ap-text-left","mTop":true,"mBot":true}},{"type":"textarea","key":"inputTextArea","templateOptions":{"label":"","rows":2,"grow":false,"required":true}},{"type":"editorTexto","key":0,"templateOptions":{"label":"jojojo"}},{"type":"textarea","key":"inputTextArea","templateOptions":{"label":"","rows":2,"grow":false}},{"type":"texto","key":"texto","templateOptions":{"label":"CONCLUSIONES","tipo":"h3","className":"ap-text-left","mTop":true,"mBot":true}},{"type":"textarea","key":"inputTextArea","templateOptions":{"label":"","rows":2,"grow":false,"required":true}},{"type":"editorTexto","key":0,"templateOptions":{"label":"jojojo"}},{"type":"texto","key":"texto","templateOptions":{"label":"RECOMENDACIONES","tipo":"h3","className":"ap-text-left","mTop":true,"mBot":true}},{"type":"textarea","key":"inputTextArea","templateOptions":{"label":"","rows":2,"grow":false,"required":true}},{"type":"pdfsAprobacionCD","key":"pdfsAprobacionCD","templateOptions":{"label":"ADJUNTAR"}},{"type":"editorTexto","templateOptions":{"label":"jojojo"}},{"type":"ccArchivo","key":"ccArchivo","templateOptions":{"labelw":10,"label":"CC/Archivo:"}}]	{}	ACTIVO	100	100	2021-11-22 14:29:25.318+00	2021-11-22 15:29:28.588+00
6	Nota Interna	NI	[{"type":"cite","key":0,"templateOptions":{"labelCite":"CITE","labelFecha":"FECHA","tipo":"unidad","numeracionPagina":"true"}},{"type":"texto","key":"texto","templateOptions":{"label":"NOTA INTERNA","tipo":"h2","className":"ap-text-center","mTop":true,"mBot":true}},{"type":"encabezado","key":"encabezado","templateOptions":{"labelw":10,"labelRef":"REF.:","show":{"para":true,"via":true,"de":true,"ref":true}}},{"type":"documentosRelacionados","key":"documentosRelacionados","templateOptions":{"labelw":10,"label":"Referencias:"}},{"type":"datosGenerales","key":"datosGenerales","templateOptions":{"labelw":10,"labelRef":"REF.:","showItem":false,"show":{"para":true,"via":true,"de":true,"ref":true}}},{"type":"texto","key":"parrafo","templateOptions":{"label":"De mi consideración:","tipo":"p","className":"ap-text-left","mTop":true,"mBot":false}},{"type":"vacio","key":0,"templateOptions":{"height":"0.5","style":{"height":"0.5cm"}}},{"type":"textarea","key":"inputTextArea","templateOptions":{"label":"","rows":2,"grow":false,"required":true}},{"type":"editorTexto","key":0,"templateOptions":{"label":"jojojo"}},{"type":"texto","key":"parrafo","templateOptions":{"label":"Sin otro particular, saludo a usted atentamente.","tipo":"p","className":"ap-text-left","mTop":true,"mBot":true}},{"type":"ccArchivo","key":"ccArchivo","templateOptions":{"labelw":10,"label":"CC/Archivo:"}}]	null	ACTIVO	100	100	2016-12-14 22:16:03.975+00	2017-02-15 15:00:19.282+00
\.


--
-- Data for Name: rol; Type: TABLE DATA; Schema: public; Owner: plantillas
--

COPY public.rol (id_rol, nombre, descripcion, peso, estado, _usuario_creacion, _usuario_modificacion, _fecha_creacion, _fecha_modificacion) FROM stdin;
1	ADMIN	Administrador	0	ACTIVO	1	1	2026-08-07 22:54:24.769+00	2026-08-07 22:54:24.769+00
2	JEFE	Jefe/Responsable de Area o Unidad	0	ACTIVO	1	1	2026-08-07 22:54:24.769+00	2026-08-07 22:54:24.769+00
3	OPERADOR	Operador Administrativo Financiero	0	ACTIVO	1	1	2026-08-07 22:54:24.769+00	2026-08-07 22:54:24.769+00
4	SECRETARIA	Secretaria	0	ACTIVO	1	1	2026-08-07 22:54:24.769+00	2026-08-07 22:54:24.769+00
5	CONFIGURADOR	Configurador	0	ACTIVO	1	1	2026-08-07 22:54:24.769+00	2026-08-07 22:54:24.769+00
6	CORRESPONDENCIA	Responsable de correspondencia	1	ACTIVO	1	1	2026-08-07 22:54:24.769+00	2026-08-07 22:54:24.769+00
7	CONTACTOS	Administración de contactos	5	ACTIVO	1	1	2026-08-07 22:54:24.769+00	2026-08-07 22:54:24.769+00
\.


--
-- Data for Name: rol_menu; Type: TABLE DATA; Schema: public; Owner: plantillas
--

COPY public.rol_menu (id_rol_menu, fid_rol, fid_menu, estado, _usuario_creacion, _usuario_modificacion, _fecha_creacion, _fecha_modificacion) FROM stdin;
1	1	2	ACTIVO	1	1	2026-08-07 22:54:24.774+00	2026-08-07 22:54:24.774+00
2	1	3	ACTIVO	1	1	2026-08-07 22:54:24.774+00	2026-08-07 22:54:24.774+00
3	1	4	ACTIVO	1	1	2026-08-07 22:54:24.774+00	2026-08-07 22:54:24.774+00
4	1	5	ACTIVO	1	1	2026-08-07 22:54:24.774+00	2026-08-07 22:54:24.774+00
5	1	6	ACTIVO	1	1	2026-08-07 22:54:24.774+00	2026-08-07 22:54:24.774+00
6	1	7	ACTIVO	1	1	2026-08-07 22:54:24.774+00	2026-08-07 22:54:24.774+00
7	1	8	ACTIVO	1	1	2026-08-07 22:54:24.774+00	2026-08-07 22:54:24.774+00
8	1	9	ACTIVO	1	1	2026-08-07 22:54:24.774+00	2026-08-07 22:54:24.774+00
9	1	10	ACTIVO	1	1	2026-08-07 22:54:24.774+00	2026-08-07 22:54:24.774+00
10	2	7	ACTIVO	1	1	2026-08-07 22:54:24.774+00	2026-08-07 22:54:24.774+00
11	2	8	ACTIVO	1	1	2026-08-07 22:54:24.774+00	2026-08-07 22:54:24.774+00
12	2	9	ACTIVO	1	1	2026-08-07 22:54:24.774+00	2026-08-07 22:54:24.774+00
13	2	12	ACTIVO	1	1	2026-08-07 22:54:24.774+00	2026-08-07 22:54:24.774+00
14	2	13	ACTIVO	1	1	2026-08-07 22:54:24.774+00	2026-08-07 22:54:24.774+00
15	2	18	ACTIVO	1	1	2026-08-07 22:54:24.774+00	2026-08-07 22:54:24.774+00
16	2	19	ACTIVO	1	1	2026-08-07 22:54:24.774+00	2026-08-07 22:54:24.775+00
17	2	15	ACTIVO	1	1	2026-08-07 22:54:24.775+00	2026-08-07 22:54:24.775+00
18	3	7	ACTIVO	1	1	2026-08-07 22:54:24.775+00	2026-08-07 22:54:24.775+00
19	3	8	ACTIVO	1	1	2026-08-07 22:54:24.775+00	2026-08-07 22:54:24.775+00
20	3	11	ACTIVO	1	1	2026-08-07 22:54:24.775+00	2026-08-07 22:54:24.775+00
21	3	18	ACTIVO	1	1	2026-08-07 22:54:24.775+00	2026-08-07 22:54:24.775+00
22	3	19	ACTIVO	1	1	2026-08-07 22:54:24.775+00	2026-08-07 22:54:24.775+00
23	3	15	ACTIVO	1	1	2026-08-07 22:54:24.775+00	2026-08-07 22:54:24.775+00
24	4	7	ACTIVO	1	1	2026-08-07 22:54:24.775+00	2026-08-07 22:54:24.775+00
25	4	8	ACTIVO	1	1	2026-08-07 22:54:24.775+00	2026-08-07 22:54:24.775+00
26	4	10	ACTIVO	1	1	2026-08-07 22:54:24.775+00	2026-08-07 22:54:24.775+00
27	4	11	ACTIVO	1	1	2026-08-07 22:54:24.775+00	2026-08-07 22:54:24.775+00
28	4	18	ACTIVO	1	1	2026-08-07 22:54:24.775+00	2026-08-07 22:54:24.775+00
29	4	19	ACTIVO	1	1	2026-08-07 22:54:24.775+00	2026-08-07 22:54:24.775+00
30	4	15	ACTIVO	1	1	2026-08-07 22:54:24.775+00	2026-08-07 22:54:24.775+00
31	5	7	ACTIVO	1	1	2026-08-07 22:54:24.775+00	2026-08-07 22:54:24.775+00
32	5	8	ACTIVO	1	1	2026-08-07 22:54:24.775+00	2026-08-07 22:54:24.775+00
33	5	2	ACTIVO	1	1	2026-08-07 22:54:24.775+00	2026-08-07 22:54:24.775+00
34	5	11	ACTIVO	1	1	2026-08-07 22:54:24.775+00	2026-08-07 22:54:24.775+00
35	6	7	ACTIVO	1	1	2026-08-07 22:54:24.775+00	2026-08-07 22:54:24.775+00
36	6	8	ACTIVO	1	1	2026-08-07 22:54:24.775+00	2026-08-07 22:54:24.775+00
37	6	9	ACTIVO	1	1	2026-08-07 22:54:24.775+00	2026-08-07 22:54:24.775+00
38	6	10	ACTIVO	1	1	2026-08-07 22:54:24.775+00	2026-08-07 22:54:24.775+00
39	7	15	ACTIVO	1	1	2026-08-07 22:54:24.775+00	2026-08-07 22:54:24.775+00
\.


--
-- Data for Name: solicitud_aprobacion_cd; Type: TABLE DATA; Schema: public; Owner: plantillas
--

COPY public.solicitud_aprobacion_cd (id, uuid_solicitud, respuesta_servicio_aprobacion, fecha_aprobacion, tipo, estado, _usuario_creacion, _usuario_modificacion, _fecha_creacion, _fecha_modificacion, fid_adjunto_aprobacion_cd, fid_documento) FROM stdin;
\.


--
-- Data for Name: unidad; Type: TABLE DATA; Schema: public; Owner: plantillas
--

COPY public.unidad (id_unidad, nombre, abreviacion, estado, _usuario_creacion, _usuario_modificacion, _fecha_creacion, _fecha_modificacion) FROM stdin;
1	Unidad de Test	UTEST	ACTIVO	1	1	2026-08-07 22:54:24.764+00	2026-08-07 22:54:24.764+00
\.


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: plantillas
--

COPY public.usuario (id_usuario, fid_unidad, usuario, contrasena, numero_documento, nombres, apellidos, cargo, email, virtual, estado, _usuario_creacion, _usuario_modificacion, _fecha_creacion, _fecha_modificacion) FROM stdin;
1	1	sys_default	3fb7b39416f1d067268747fc214494d759d2609f863ace1a8a76705618d5c80b	1111111	system	default 	Default system user	user@default.net	f	ACTIVO	1	1	2026-08-07 22:54:24.793+00	2026-08-07 22:54:24.793+00
2	1	10794552-1J	3fb7b39416f1d067268747fc214494d759d2609f863ace1a8a76705618d5c80b	10794552-1J	FABIOLA	SANCHEZ VACA	Default	10794552-1J@mailinator.com	f	ACTIVO	1	1	2026-08-07 22:54:24.793+00	2026-08-07 22:54:24.793+00
\.


--
-- Data for Name: usuario_externo; Type: TABLE DATA; Schema: public; Owner: plantillas
--

COPY public.usuario_externo (id_usuario_externo, entidad, contacto, iat, key, estado, _fecha_creacion, _fecha_modificacion) FROM stdin;
\.


--
-- Data for Name: usuario_his; Type: TABLE DATA; Schema: public; Owner: plantillas
--

COPY public.usuario_his (id_usuario_his, fid_usuario, usuario, contrasena, numero_documento, nombre, apellido, cargo, email, estado, _usuario_creacion, _usuario_modificacion, _fecha_creacion, _fecha_modificacion) FROM stdin;
\.


--
-- Data for Name: usuario_rol; Type: TABLE DATA; Schema: public; Owner: plantillas
--

COPY public.usuario_rol (id_usuario_rol, fid_usuario, fid_rol, estado, _usuario_creacion, _usuario_modificacion, _fecha_creacion, _fecha_modificacion) FROM stdin;
1	1	1	ACTIVO	1	1	2026-08-07 22:54:24.8+00	2026-08-07 22:54:24.8+00
2	2	1	ACTIVO	1	1	2026-08-07 22:54:24.8+00	2026-08-07 22:54:24.8+00
\.


--
-- Data for Name: virtual; Type: TABLE DATA; Schema: public; Owner: plantillas
--

COPY public.virtual (id_virtual, fid_usuario_titular, fid_usuario_virtual, estado, _usuario_creacion, _usuario_modificacion, _fecha_creacion, _fecha_modificacion) FROM stdin;
\.


--
-- Data for Name: virtual_his; Type: TABLE DATA; Schema: public; Owner: plantillas
--

COPY public.virtual_his (id_virtual_his, fid_virtual, id_virtual, id_titular, accion, _usuario_creacion, _usuario_modificacion, _fecha_creacion, _fecha_modificacion) FROM stdin;
\.


--
-- Name: adjunto_aprobacion_cd_id_seq; Type: SEQUENCE SET; Schema: public; Owner: plantillas
--

SELECT pg_catalog.setval('public.adjunto_aprobacion_cd_id_seq', 1, false);


--
-- Name: auth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: plantillas
--

SELECT pg_catalog.setval('public.auth_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: plantillas
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, false);


--
-- Name: catalogo_documento_id_catalogo_documento_seq; Type: SEQUENCE SET; Schema: public; Owner: plantillas
--

SELECT pg_catalog.setval('public.catalogo_documento_id_catalogo_documento_seq', 1, false);


--
-- Name: catalogo_id_catalogo_seq; Type: SEQUENCE SET; Schema: public; Owner: plantillas
--

SELECT pg_catalog.setval('public.catalogo_id_catalogo_seq', 1, false);


--
-- Name: catalogo_usuario_id_catalogo_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: plantillas
--

SELECT pg_catalog.setval('public.catalogo_usuario_id_catalogo_usuario_seq', 1, false);


--
-- Name: conf_notificacion_id_conf_notificacion_seq; Type: SEQUENCE SET; Schema: public; Owner: plantillas
--

SELECT pg_catalog.setval('public.conf_notificacion_id_conf_notificacion_seq', 1, true);


--
-- Name: contacto_id_contacto_seq; Type: SEQUENCE SET; Schema: public; Owner: plantillas
--

SELECT pg_catalog.setval('public.contacto_id_contacto_seq', 1, false);


--
-- Name: correlativo_id_correlativo_seq; Type: SEQUENCE SET; Schema: public; Owner: plantillas
--

SELECT pg_catalog.setval('public.correlativo_id_correlativo_seq', 1, false);


--
-- Name: documento_id_documento_seq; Type: SEQUENCE SET; Schema: public; Owner: plantillas
--

SELECT pg_catalog.setval('public.documento_id_documento_seq', 1, false);


--
-- Name: firma_id_firma_seq; Type: SEQUENCE SET; Schema: public; Owner: plantillas
--

SELECT pg_catalog.setval('public.firma_id_firma_seq', 1, false);


--
-- Name: historial_catalogo_id_historial_catalogo_seq; Type: SEQUENCE SET; Schema: public; Owner: plantillas
--

SELECT pg_catalog.setval('public.historial_catalogo_id_historial_catalogo_seq', 1, false);


--
-- Name: historial_flujo_id_historial_flujo_seq; Type: SEQUENCE SET; Schema: public; Owner: plantillas
--

SELECT pg_catalog.setval('public.historial_flujo_id_historial_flujo_seq', 1, false);


--
-- Name: menu_id_menu_seq; Type: SEQUENCE SET; Schema: public; Owner: plantillas
--

SELECT pg_catalog.setval('public.menu_id_menu_seq', 39, true);


--
-- Name: monitor_id_monitor_seq; Type: SEQUENCE SET; Schema: public; Owner: plantillas
--

SELECT pg_catalog.setval('public.monitor_id_monitor_seq', 1, false);


--
-- Name: notificacion_id_notificacion_seq; Type: SEQUENCE SET; Schema: public; Owner: plantillas
--

SELECT pg_catalog.setval('public.notificacion_id_notificacion_seq', 1, false);


--
-- Name: partida_id_partida_seq; Type: SEQUENCE SET; Schema: public; Owner: plantillas
--

SELECT pg_catalog.setval('public.partida_id_partida_seq', 1, false);


--
-- Name: plantilla_formly_id_plantilla_formly_seq; Type: SEQUENCE SET; Schema: public; Owner: plantillas
--

SELECT pg_catalog.setval('public.plantilla_formly_id_plantilla_formly_seq', 6, true);


--
-- Name: rol_id_rol_seq; Type: SEQUENCE SET; Schema: public; Owner: plantillas
--

SELECT pg_catalog.setval('public.rol_id_rol_seq', 7, true);


--
-- Name: rol_menu_id_rol_menu_seq; Type: SEQUENCE SET; Schema: public; Owner: plantillas
--

SELECT pg_catalog.setval('public.rol_menu_id_rol_menu_seq', 39, true);


--
-- Name: solicitud_aprobacion_cd_id_seq; Type: SEQUENCE SET; Schema: public; Owner: plantillas
--

SELECT pg_catalog.setval('public.solicitud_aprobacion_cd_id_seq', 1, false);


--
-- Name: unidad_id_unidad_seq; Type: SEQUENCE SET; Schema: public; Owner: plantillas
--

SELECT pg_catalog.setval('public.unidad_id_unidad_seq', 1, true);


--
-- Name: usuario_externo_id_usuario_externo_seq; Type: SEQUENCE SET; Schema: public; Owner: plantillas
--

SELECT pg_catalog.setval('public.usuario_externo_id_usuario_externo_seq', 1, false);


--
-- Name: usuario_his_id_usuario_his_seq; Type: SEQUENCE SET; Schema: public; Owner: plantillas
--

SELECT pg_catalog.setval('public.usuario_his_id_usuario_his_seq', 1, false);


--
-- Name: usuario_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: plantillas
--

SELECT pg_catalog.setval('public.usuario_id_usuario_seq', 2, true);


--
-- Name: usuario_rol_id_usuario_rol_seq; Type: SEQUENCE SET; Schema: public; Owner: plantillas
--

SELECT pg_catalog.setval('public.usuario_rol_id_usuario_rol_seq', 2, true);


--
-- Name: virtual_his_id_virtual_his_seq; Type: SEQUENCE SET; Schema: public; Owner: plantillas
--

SELECT pg_catalog.setval('public.virtual_his_id_virtual_his_seq', 1, false);


--
-- Name: virtual_id_virtual_seq; Type: SEQUENCE SET; Schema: public; Owner: plantillas
--

SELECT pg_catalog.setval('public.virtual_id_virtual_seq', 1, false);


--
-- Name: adjunto_aprobacion_cd adjunto_aprobacion_cd_pkey; Type: CONSTRAINT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.adjunto_aprobacion_cd
    ADD CONSTRAINT adjunto_aprobacion_cd_pkey PRIMARY KEY (id);


--
-- Name: auth auth_pkey; Type: CONSTRAINT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.auth
    ADD CONSTRAINT auth_pkey PRIMARY KEY (id);


--
-- Name: auth auth_state_key; Type: CONSTRAINT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.auth
    ADD CONSTRAINT auth_state_key UNIQUE (state);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: catalogo_documento catalogo_documento_pkey; Type: CONSTRAINT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.catalogo_documento
    ADD CONSTRAINT catalogo_documento_pkey PRIMARY KEY (id_catalogo_documento);


--
-- Name: catalogo catalogo_pkey; Type: CONSTRAINT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.catalogo
    ADD CONSTRAINT catalogo_pkey PRIMARY KEY (id_catalogo);


--
-- Name: catalogo_usuario catalogo_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.catalogo_usuario
    ADD CONSTRAINT catalogo_usuario_pkey PRIMARY KEY (id_catalogo_usuario);


--
-- Name: conf_notificacion conf_notificacion_fid_usuario_key; Type: CONSTRAINT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.conf_notificacion
    ADD CONSTRAINT conf_notificacion_fid_usuario_key UNIQUE (fid_usuario);


--
-- Name: conf_notificacion conf_notificacion_pkey; Type: CONSTRAINT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.conf_notificacion
    ADD CONSTRAINT conf_notificacion_pkey PRIMARY KEY (id_conf_notificacion);


--
-- Name: contacto contacto_pkey; Type: CONSTRAINT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.contacto
    ADD CONSTRAINT contacto_pkey PRIMARY KEY (id_contacto);


--
-- Name: correlativo correlativo_pkey; Type: CONSTRAINT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.correlativo
    ADD CONSTRAINT correlativo_pkey PRIMARY KEY (id_correlativo);


--
-- Name: documento documento_pkey; Type: CONSTRAINT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.documento
    ADD CONSTRAINT documento_pkey PRIMARY KEY (id_documento);


--
-- Name: firma firma_pkey; Type: CONSTRAINT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.firma
    ADD CONSTRAINT firma_pkey PRIMARY KEY (id_firma);


--
-- Name: historial_catalogo historial_catalogo_pkey; Type: CONSTRAINT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.historial_catalogo
    ADD CONSTRAINT historial_catalogo_pkey PRIMARY KEY (id_historial_catalogo);


--
-- Name: historial_flujo historial_flujo_pkey; Type: CONSTRAINT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.historial_flujo
    ADD CONSTRAINT historial_flujo_pkey PRIMARY KEY (id_historial_flujo);


--
-- Name: menu menu_nombre_key; Type: CONSTRAINT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_nombre_key UNIQUE (nombre);


--
-- Name: menu menu_pkey; Type: CONSTRAINT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_pkey PRIMARY KEY (id_menu);


--
-- Name: monitor monitor_pkey; Type: CONSTRAINT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.monitor
    ADD CONSTRAINT monitor_pkey PRIMARY KEY (id_monitor);


--
-- Name: notificacion notificacion_pkey; Type: CONSTRAINT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.notificacion
    ADD CONSTRAINT notificacion_pkey PRIMARY KEY (id_notificacion);


--
-- Name: partida partida_pkey; Type: CONSTRAINT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.partida
    ADD CONSTRAINT partida_pkey PRIMARY KEY (id_partida);


--
-- Name: plantilla_formly plantilla_formly_pkey; Type: CONSTRAINT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.plantilla_formly
    ADD CONSTRAINT plantilla_formly_pkey PRIMARY KEY (id_plantilla_formly);


--
-- Name: rol_menu rol_menu_fid_rol_fid_menu_key; Type: CONSTRAINT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.rol_menu
    ADD CONSTRAINT rol_menu_fid_rol_fid_menu_key UNIQUE (fid_rol, fid_menu);


--
-- Name: rol_menu rol_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.rol_menu
    ADD CONSTRAINT rol_menu_pkey PRIMARY KEY (id_rol_menu);


--
-- Name: rol rol_pkey; Type: CONSTRAINT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.rol
    ADD CONSTRAINT rol_pkey PRIMARY KEY (id_rol);


--
-- Name: solicitud_aprobacion_cd solicitud_aprobacion_cd_pkey; Type: CONSTRAINT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.solicitud_aprobacion_cd
    ADD CONSTRAINT solicitud_aprobacion_cd_pkey PRIMARY KEY (id);


--
-- Name: unidad unidad_pkey; Type: CONSTRAINT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.unidad
    ADD CONSTRAINT unidad_pkey PRIMARY KEY (id_unidad);


--
-- Name: usuario_externo usuario_externo_entidad_key; Type: CONSTRAINT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.usuario_externo
    ADD CONSTRAINT usuario_externo_entidad_key UNIQUE (entidad);


--
-- Name: usuario_externo usuario_externo_pkey; Type: CONSTRAINT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.usuario_externo
    ADD CONSTRAINT usuario_externo_pkey PRIMARY KEY (id_usuario_externo);


--
-- Name: usuario_his usuario_his_pkey; Type: CONSTRAINT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.usuario_his
    ADD CONSTRAINT usuario_his_pkey PRIMARY KEY (id_usuario_his);


--
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario);


--
-- Name: usuario_rol usuario_rol_pkey; Type: CONSTRAINT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.usuario_rol
    ADD CONSTRAINT usuario_rol_pkey PRIMARY KEY (id_usuario_rol);


--
-- Name: usuario usuario_usuario_key; Type: CONSTRAINT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_usuario_key UNIQUE (usuario);


--
-- Name: virtual_his virtual_his_pkey; Type: CONSTRAINT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.virtual_his
    ADD CONSTRAINT virtual_his_pkey PRIMARY KEY (id_virtual_his);


--
-- Name: virtual virtual_pkey; Type: CONSTRAINT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.virtual
    ADD CONSTRAINT virtual_pkey PRIMARY KEY (id_virtual);


--
-- Name: adjunto_aprobacion_cd adjunto_aprobacion_cd_fid_documento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.adjunto_aprobacion_cd
    ADD CONSTRAINT adjunto_aprobacion_cd_fid_documento_fkey FOREIGN KEY (fid_documento) REFERENCES public.documento(id_documento) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: catalogo_documento catalogo_documento_fid_catalogo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.catalogo_documento
    ADD CONSTRAINT catalogo_documento_fid_catalogo_fkey FOREIGN KEY (fid_catalogo) REFERENCES public.catalogo(id_catalogo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: catalogo_usuario catalogo_usuario_fid_catalogo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.catalogo_usuario
    ADD CONSTRAINT catalogo_usuario_fid_catalogo_fkey FOREIGN KEY (fid_catalogo) REFERENCES public.catalogo(id_catalogo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: conf_notificacion conf_notificacion_fid_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.conf_notificacion
    ADD CONSTRAINT conf_notificacion_fid_usuario_fkey FOREIGN KEY (fid_usuario) REFERENCES public.usuario(id_usuario) ON UPDATE CASCADE;


--
-- Name: firma firma_fid_documento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.firma
    ADD CONSTRAINT firma_fid_documento_fkey FOREIGN KEY (fid_documento) REFERENCES public.documento(id_documento) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: historial_flujo historial_flujo_id_documento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.historial_flujo
    ADD CONSTRAINT historial_flujo_id_documento_fkey FOREIGN KEY (id_documento) REFERENCES public.documento(id_documento) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: menu menu_fid_menu_padre_fkey; Type: FK CONSTRAINT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_fid_menu_padre_fkey FOREIGN KEY (fid_menu_padre) REFERENCES public.menu(id_menu) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: notificacion notificacion_fid_documento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.notificacion
    ADD CONSTRAINT notificacion_fid_documento_fkey FOREIGN KEY (fid_documento) REFERENCES public.documento(id_documento) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: rol_menu rol_menu_fid_menu_fkey; Type: FK CONSTRAINT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.rol_menu
    ADD CONSTRAINT rol_menu_fid_menu_fkey FOREIGN KEY (fid_menu) REFERENCES public.menu(id_menu) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: rol_menu rol_menu_fid_rol_fkey; Type: FK CONSTRAINT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.rol_menu
    ADD CONSTRAINT rol_menu_fid_rol_fkey FOREIGN KEY (fid_rol) REFERENCES public.rol(id_rol) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: solicitud_aprobacion_cd solicitud_aprobacion_cd_fid_adjunto_aprobacion_cd_fkey; Type: FK CONSTRAINT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.solicitud_aprobacion_cd
    ADD CONSTRAINT solicitud_aprobacion_cd_fid_adjunto_aprobacion_cd_fkey FOREIGN KEY (fid_adjunto_aprobacion_cd) REFERENCES public.adjunto_aprobacion_cd(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: solicitud_aprobacion_cd solicitud_aprobacion_cd_fid_documento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.solicitud_aprobacion_cd
    ADD CONSTRAINT solicitud_aprobacion_cd_fid_documento_fkey FOREIGN KEY (fid_documento) REFERENCES public.documento(id_documento) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: usuario usuario_fid_unidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_fid_unidad_fkey FOREIGN KEY (fid_unidad) REFERENCES public.unidad(id_unidad) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: usuario_his usuario_his_fid_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.usuario_his
    ADD CONSTRAINT usuario_his_fid_usuario_fkey FOREIGN KEY (fid_usuario) REFERENCES public.usuario(id_usuario);


--
-- Name: usuario_rol usuario_rol_fid_rol_fkey; Type: FK CONSTRAINT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.usuario_rol
    ADD CONSTRAINT usuario_rol_fid_rol_fkey FOREIGN KEY (fid_rol) REFERENCES public.rol(id_rol) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: usuario_rol usuario_rol_fid_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.usuario_rol
    ADD CONSTRAINT usuario_rol_fid_usuario_fkey FOREIGN KEY (fid_usuario) REFERENCES public.usuario(id_usuario) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict lNgSh7FBlhFChtS89EravjbaJ29sFUbmX3deysny4jJBNFuu8Xw7GlQxrgi7hFe

