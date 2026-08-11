--
-- PostgreSQL database dump
--

\restrict 6G2cSETIM03cn8OvLFxx4PcF4SiDBKDefimtemW5xMQd6xG1ZnOsKyAYPUCfqyW

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

SET default_tablespace = '';

SET default_table_access_method = heap;

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
-- Name: menu id_menu; Type: DEFAULT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.menu ALTER COLUMN id_menu SET DEFAULT nextval('public.menu_id_menu_seq'::regclass);


--
-- Name: rol id_rol; Type: DEFAULT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.rol ALTER COLUMN id_rol SET DEFAULT nextval('public.rol_id_rol_seq'::regclass);


--
-- Name: rol_menu id_rol_menu; Type: DEFAULT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.rol_menu ALTER COLUMN id_rol_menu SET DEFAULT nextval('public.rol_menu_id_rol_menu_seq'::regclass);


--
-- Data for Name: menu; Type: TABLE DATA; Schema: public; Owner: plantillas
--

COPY public.menu (id_menu, fid_menu_padre, nombre, descripcion, orden, ruta, icono, estado, _usuario_creacion, _usuario_modificacion, _fecha_creacion, _fecha_modificacion) FROM stdin;
1	\N	CONFIGURACIÓN	Configuración	1		build	ACTIVO	1	1	2026-08-10 08:51:02.798+00	2026-08-10 08:51:02.798+00
2	1	PLANTILLAS	Bandeja de plantillas de documentos	1	plantillas	settings	ACTIVO	1	1	2026-08-10 08:51:02.798+00	2026-08-10 08:51:02.798+00
3	\N	ADMINISTRACIÓN	Administración	2		settings	ACTIVO	1	1	2026-08-10 08:51:02.798+00	2026-08-10 08:51:02.798+00
4	3	USUARIOS	Administración de usuarios	1	usuario	group	ACTIVO	1	1	2026-08-10 08:51:02.798+00	2026-08-10 08:51:02.798+00
5	3	ROLES	Administración de roles	2	rol	credit_card	ACTIVO	1	1	2026-08-10 08:51:02.798+00	2026-08-10 08:51:02.798+00
6	3	MENÚS	Administración de menús	3	menu	menu	ACTIVO	1	1	2026-08-10 08:51:02.798+00	2026-08-10 08:51:02.798+00
7	3	UNIDADES	Administración de unidades	4	unidad	business	ACTIVO	1	1	2026-08-10 08:51:02.798+00	2026-08-10 08:51:02.798+00
8	\N	DOCUMENTOS	Documentos	3		folder	ACTIVO	1	1	2026-08-10 08:51:02.798+00	2026-08-10 08:51:02.798+00
18	\N	CATALOGOS	Gestión de catálogos	1		folder	ACTIVO	1	1	2026-08-10 08:51:02.798+00	2026-08-10 08:51:02.798+00
19	18	MIS CATALOGOS	Bandeja de mis catálogos	1	catalogos	folder	ACTIVO	1	1	2026-08-10 08:51:02.798+00	2026-08-10 08:51:02.798+00
20	18	COMPARTIDOS	Bandeja de catálogos compartidos	1	compartidos	user	ACTIVO	1	1	2026-08-10 08:51:02.798+00	2026-08-10 08:51:02.798+00
9	8	MIS DOCUMENTOS	Bandeja de documentos	2	documentos	description	ACTIVO	1	1	2026-08-10 08:51:02.798+00	2026-08-10 08:51:02.88+00
10	8	DOCUMENTOS PENDIENTES	Bandeja de documentos pendientes	3	aprobacion	description	ACTIVO	1	1	2026-08-10 08:51:02.798+00	2026-08-10 08:51:02.88+00
11	8	IMPRIMIR DOCUMENTOS	Bandeja de documentos para impresión	4	impresion	description	ACTIVO	1	1	2026-08-10 08:51:02.798+00	2026-08-10 08:51:02.88+00
12	8	DERIVADOS	Bandeja de documentos derivados	0	aprobacion	description	ACTIVO	1	1	2026-08-10 08:51:02.798+00	2026-08-10 08:51:02.88+00
13	8	EN CURSO	Bandeja de documentos en curso	0	en_curso	description	ACTIVO	1	1	2026-08-10 08:51:02.798+00	2026-08-10 08:51:02.88+00
14	8	MONITOREO	Bandeja de monitoreo de solicitud de documentos	0	monitoreo	description	ACTIVO	1	1	2026-08-10 08:51:02.798+00	2026-08-10 08:51:02.88+00
15	8	FIRMAR	Bandeja de documentos a firmar	1	firmar	fingerprint	ACTIVO	1	1	2026-08-10 08:51:02.798+00	2026-08-10 08:51:02.88+00
16	8	APROBAR CON CD	Bandeja de documentos a aprobar	1	aprobar_documento	fingerprint	ACTIVO	1	1	2026-08-10 08:51:02.798+00	2026-08-10 08:51:02.88+00
17	8	CONTACTOS	Bandeja de contactos	1	contactos	user	ACTIVO	1	1	2026-08-10 08:51:02.798+00	2026-08-10 08:51:02.88+00
\.


--
-- Data for Name: rol; Type: TABLE DATA; Schema: public; Owner: plantillas
--

COPY public.rol (id_rol, nombre, descripcion, peso, estado, _usuario_creacion, _usuario_modificacion, _fecha_creacion, _fecha_modificacion) FROM stdin;
1	ADMIN	Administrador	0	ACTIVO	1	1	2026-08-10 08:51:02.83+00	2026-08-10 08:51:02.83+00
2	JEFE	Jefe/Responsable de Area o Unidad	0	ACTIVO	1	1	2026-08-10 08:51:02.83+00	2026-08-10 08:51:02.83+00
3	OPERADOR	Operador Administrativo Financiero	0	ACTIVO	1	1	2026-08-10 08:51:02.83+00	2026-08-10 08:51:02.83+00
4	SECRETARIA	Secretaria	0	ACTIVO	1	1	2026-08-10 08:51:02.83+00	2026-08-10 08:51:02.83+00
5	CONFIGURADOR	Configurador	0	ACTIVO	1	1	2026-08-10 08:51:02.83+00	2026-08-10 08:51:02.83+00
6	CORRESPONDENCIA	Responsable de correspondencia	1	ACTIVO	1	1	2026-08-10 08:51:02.83+00	2026-08-10 08:51:02.83+00
7	CONTACTOS	Administración de contactos	5	ACTIVO	1	1	2026-08-10 08:51:02.83+00	2026-08-10 08:51:02.83+00
\.


--
-- Data for Name: rol_menu; Type: TABLE DATA; Schema: public; Owner: plantillas
--

COPY public.rol_menu (id_rol_menu, fid_rol, fid_menu, estado, _usuario_creacion, _usuario_modificacion, _fecha_creacion, _fecha_modificacion) FROM stdin;
1	1	2	ACTIVO	1	1	2026-08-10 08:51:02.836+00	2026-08-10 08:51:02.836+00
2	1	3	ACTIVO	1	1	2026-08-10 08:51:02.836+00	2026-08-10 08:51:02.836+00
3	1	4	ACTIVO	1	1	2026-08-10 08:51:02.836+00	2026-08-10 08:51:02.836+00
4	1	5	ACTIVO	1	1	2026-08-10 08:51:02.836+00	2026-08-10 08:51:02.836+00
5	1	6	ACTIVO	1	1	2026-08-10 08:51:02.836+00	2026-08-10 08:51:02.836+00
6	1	7	ACTIVO	1	1	2026-08-10 08:51:02.836+00	2026-08-10 08:51:02.836+00
7	1	8	ACTIVO	1	1	2026-08-10 08:51:02.836+00	2026-08-10 08:51:02.836+00
8	1	9	ACTIVO	1	1	2026-08-10 08:51:02.836+00	2026-08-10 08:51:02.836+00
9	1	10	ACTIVO	1	1	2026-08-10 08:51:02.836+00	2026-08-10 08:51:02.836+00
10	2	7	ACTIVO	1	1	2026-08-10 08:51:02.837+00	2026-08-10 08:51:02.837+00
11	2	8	ACTIVO	1	1	2026-08-10 08:51:02.837+00	2026-08-10 08:51:02.837+00
12	2	9	ACTIVO	1	1	2026-08-10 08:51:02.837+00	2026-08-10 08:51:02.837+00
13	2	12	ACTIVO	1	1	2026-08-10 08:51:02.837+00	2026-08-10 08:51:02.837+00
14	2	13	ACTIVO	1	1	2026-08-10 08:51:02.837+00	2026-08-10 08:51:02.837+00
15	2	18	ACTIVO	1	1	2026-08-10 08:51:02.837+00	2026-08-10 08:51:02.837+00
16	2	19	ACTIVO	1	1	2026-08-10 08:51:02.837+00	2026-08-10 08:51:02.837+00
17	2	15	ACTIVO	1	1	2026-08-10 08:51:02.837+00	2026-08-10 08:51:02.837+00
18	3	7	ACTIVO	1	1	2026-08-10 08:51:02.837+00	2026-08-10 08:51:02.837+00
19	3	8	ACTIVO	1	1	2026-08-10 08:51:02.837+00	2026-08-10 08:51:02.837+00
20	3	11	ACTIVO	1	1	2026-08-10 08:51:02.837+00	2026-08-10 08:51:02.837+00
21	3	18	ACTIVO	1	1	2026-08-10 08:51:02.837+00	2026-08-10 08:51:02.837+00
22	3	19	ACTIVO	1	1	2026-08-10 08:51:02.837+00	2026-08-10 08:51:02.837+00
23	3	15	ACTIVO	1	1	2026-08-10 08:51:02.837+00	2026-08-10 08:51:02.837+00
24	4	7	ACTIVO	1	1	2026-08-10 08:51:02.837+00	2026-08-10 08:51:02.837+00
25	4	8	ACTIVO	1	1	2026-08-10 08:51:02.837+00	2026-08-10 08:51:02.837+00
26	4	10	ACTIVO	1	1	2026-08-10 08:51:02.837+00	2026-08-10 08:51:02.837+00
27	4	11	ACTIVO	1	1	2026-08-10 08:51:02.837+00	2026-08-10 08:51:02.837+00
28	4	18	ACTIVO	1	1	2026-08-10 08:51:02.837+00	2026-08-10 08:51:02.837+00
29	4	19	ACTIVO	1	1	2026-08-10 08:51:02.837+00	2026-08-10 08:51:02.837+00
30	4	15	ACTIVO	1	1	2026-08-10 08:51:02.837+00	2026-08-10 08:51:02.837+00
31	5	7	ACTIVO	1	1	2026-08-10 08:51:02.837+00	2026-08-10 08:51:02.837+00
32	5	8	ACTIVO	1	1	2026-08-10 08:51:02.837+00	2026-08-10 08:51:02.837+00
33	5	2	ACTIVO	1	1	2026-08-10 08:51:02.837+00	2026-08-10 08:51:02.837+00
34	5	11	ACTIVO	1	1	2026-08-10 08:51:02.837+00	2026-08-10 08:51:02.837+00
35	6	7	ACTIVO	1	1	2026-08-10 08:51:02.837+00	2026-08-10 08:51:02.837+00
36	6	8	ACTIVO	1	1	2026-08-10 08:51:02.837+00	2026-08-10 08:51:02.837+00
37	6	9	ACTIVO	1	1	2026-08-10 08:51:02.837+00	2026-08-10 08:51:02.837+00
38	6	10	ACTIVO	1	1	2026-08-10 08:51:02.837+00	2026-08-10 08:51:02.837+00
39	7	15	ACTIVO	1	1	2026-08-10 08:51:02.837+00	2026-08-10 08:51:02.837+00
\.


--
-- Name: menu_id_menu_seq; Type: SEQUENCE SET; Schema: public; Owner: plantillas
--

SELECT pg_catalog.setval('public.menu_id_menu_seq', 20, true);


--
-- Name: rol_id_rol_seq; Type: SEQUENCE SET; Schema: public; Owner: plantillas
--

SELECT pg_catalog.setval('public.rol_id_rol_seq', 7, true);


--
-- Name: rol_menu_id_rol_menu_seq; Type: SEQUENCE SET; Schema: public; Owner: plantillas
--

SELECT pg_catalog.setval('public.rol_menu_id_rol_menu_seq', 39, true);


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
-- Name: menu menu_fid_menu_padre_fkey; Type: FK CONSTRAINT; Schema: public; Owner: plantillas
--

ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_fid_menu_padre_fkey FOREIGN KEY (fid_menu_padre) REFERENCES public.menu(id_menu) ON UPDATE CASCADE ON DELETE SET NULL;


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
-- PostgreSQL database dump complete
--

\unrestrict 6G2cSETIM03cn8OvLFxx4PcF4SiDBKDefimtemW5xMQd6xG1ZnOsKyAYPUCfqyW

