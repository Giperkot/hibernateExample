--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.12
-- Dumped by pg_dump version 9.5.12

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: employe; Type: TABLE; Schema: public; Owner: unit_dev
--

CREATE TABLE public.employe (
    id bigint NOT NULL,
    name character varying(255),
    surname character varying(255),
    middlename character varying(255)
);


ALTER TABLE public.employe OWNER TO unit_dev;

--
-- Name: employe_id_seq; Type: SEQUENCE; Schema: public; Owner: unit_dev
--

CREATE SEQUENCE public.employe_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employe_id_seq OWNER TO unit_dev;

--
-- Name: employe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: unit_dev
--

ALTER SEQUENCE public.employe_id_seq OWNED BY public.employe.id;


--
-- Name: project; Type: TABLE; Schema: public; Owner: unit_dev
--

CREATE TABLE public.project (
    id bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE public.project OWNER TO unit_dev;

--
-- Name: project_id_seq; Type: SEQUENCE; Schema: public; Owner: unit_dev
--

CREATE SEQUENCE public.project_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.project_id_seq OWNER TO unit_dev;

--
-- Name: project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: unit_dev
--

ALTER SEQUENCE public.project_id_seq OWNED BY public.project.id;


--
-- Name: role; Type: TABLE; Schema: public; Owner: unit_dev
--

CREATE TABLE public.role (
    id bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE public.role OWNER TO unit_dev;

--
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: unit_dev
--

CREATE SEQUENCE public.role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_id_seq OWNER TO unit_dev;

--
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: unit_dev
--

ALTER SEQUENCE public.role_id_seq OWNED BY public.role.id;


--
-- Name: user_to_role_to_project; Type: TABLE; Schema: public; Owner: unit_dev
--

CREATE TABLE public.user_to_role_to_project (
    employe_id bigint NOT NULL,
    project_id bigint NOT NULL,
    role_id bigint NOT NULL
);


ALTER TABLE public.user_to_role_to_project OWNER TO unit_dev;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: unit_dev
--

ALTER TABLE ONLY public.employe ALTER COLUMN id SET DEFAULT nextval('public.employe_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: unit_dev
--

ALTER TABLE ONLY public.project ALTER COLUMN id SET DEFAULT nextval('public.project_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: unit_dev
--

ALTER TABLE ONLY public.role ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);


--
-- Data for Name: employe; Type: TABLE DATA; Schema: public; Owner: unit_dev
--

COPY public.employe (id, name, surname, middlename) FROM stdin;
1	Илья	Стволов	Сергеевич
2	Виктор	Везденёв	Сергеевич
3	Александр	Шатров	Андреевич
\.


--
-- Name: employe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: unit_dev
--

SELECT pg_catalog.setval('public.employe_id_seq', 3, true);


--
-- Data for Name: project; Type: TABLE DATA; Schema: public; Owner: unit_dev
--

COPY public.project (id, name) FROM stdin;
1	Inform
2	TeamsUp
3	landing
4	sir
5	portal
\.


--
-- Name: project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: unit_dev
--

SELECT pg_catalog.setval('public.project_id_seq', 5, true);


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: unit_dev
--

COPY public.role (id, name) FROM stdin;
1	Master
2	Developer
3	member
\.


--
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: unit_dev
--

SELECT pg_catalog.setval('public.role_id_seq', 3, true);


--
-- Data for Name: user_to_role_to_project; Type: TABLE DATA; Schema: public; Owner: unit_dev
--

COPY public.user_to_role_to_project (employe_id, project_id, role_id) FROM stdin;
1	2	2
1	3	1
2	2	2
3	1	1
1	1	1
1	3	3
3	2	2
\.


--
-- Name: employe_pkey; Type: CONSTRAINT; Schema: public; Owner: unit_dev
--

ALTER TABLE ONLY public.employe
    ADD CONSTRAINT employe_pkey PRIMARY KEY (id);


--
-- Name: project_pkey; Type: CONSTRAINT; Schema: public; Owner: unit_dev
--

ALTER TABLE ONLY public.project
    ADD CONSTRAINT project_pkey PRIMARY KEY (id);


--
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: unit_dev
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- Name: user_to_role_to_project_employe_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: unit_dev
--

ALTER TABLE ONLY public.user_to_role_to_project
    ADD CONSTRAINT user_to_role_to_project_employe_id_fkey FOREIGN KEY (employe_id) REFERENCES public.employe(id);


--
-- Name: user_to_role_to_project_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: unit_dev
--

ALTER TABLE ONLY public.user_to_role_to_project
    ADD CONSTRAINT user_to_role_to_project_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.project(id);


--
-- Name: user_to_role_to_project_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: unit_dev
--

ALTER TABLE ONLY public.user_to_role_to_project
    ADD CONSTRAINT user_to_role_to_project_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.role(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

