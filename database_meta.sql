



--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.4
-- Dumped by pg_dump version 9.5.5

-- Started on 2017-08-16 00:30:26 MSK

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

-- DROP DATABASE cp;
--
-- TOC entry 2507 (class 1262 OID 16639)
-- Name: cp; Type: DATABASE; Schema: -; Owner: postgres
--

--CREATE DATABASE cp WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';


--ALTER DATABASE cp OWNER TO postgres;

--\connect cp

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12623)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2510 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 2 (class 3079 OID 16640)
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- TOC entry 2511 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 182 (class 1259 OID 16651)
-- Name: data_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE data_log (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    dts timestamp with time zone DEFAULT now(),
    action text,
    data text,
    "user" uuid NOT NULL
);


ALTER TABLE data_log OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 16767)
-- Name: ref_guest_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ref_guest_tags (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    dts timestamp with time zone DEFAULT now(),
    name text NOT NULL,
    object_id uuid NOT NULL,
    state integer DEFAULT 0 NOT NULL,
    color text
);


ALTER TABLE ref_guest_tags OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 16778)
-- Name: ref_guests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ref_guests (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    dts timestamp with time zone DEFAULT now(),
    name text NOT NULL,
    code text NOT NULL,
    object_id uuid NOT NULL,
    discount_id uuid,
    bonus_id uuid,
    birthday date,
    phone text,
    address text,
    comment text,
    tags jsonb,
    state integer DEFAULT 0 NOT NULL,
    color text
);


ALTER TABLE ref_guests OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 16687)
-- Name: ref_object_owners; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ref_object_owners (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    user_id uuid NOT NULL,
    object_id uuid NOT NULL,
    state integer DEFAULT 0 NOT NULL
);


ALTER TABLE ref_object_owners OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 16677)
-- Name: ref_objects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ref_objects (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    state integer DEFAULT 0 NOT NULL,
    color text
);


ALTER TABLE ref_objects OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 16694)
-- Name: ref_pos_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ref_pos_types (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    state integer DEFAULT 0 NOT NULL,
    color text
);


ALTER TABLE ref_pos_types OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 16704)
-- Name: ref_poses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ref_poses (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    pos_type_id uuid NOT NULL,
    object_id uuid NOT NULL,
    server_address text,
    username text,
    password text,
    state integer DEFAULT 0 NOT NULL,
    color text
);


ALTER TABLE ref_poses OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 16756)
-- Name: ref_rk_bonuses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ref_rk_bonuses (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    dts timestamp with time zone DEFAULT now(),
    name text NOT NULL,
    code text NOT NULL,
    object_id uuid NOT NULL,
    state integer DEFAULT 0 NOT NULL,
    color text
);


--ALTER TABLE ref_rk_bonuses OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 16745)
-- Name: ref_rk_discounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ref_rk_discounts (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    dts timestamp with time zone DEFAULT now(),
    name text NOT NULL,
    code text NOT NULL,
    object_id uuid NOT NULL,
    state integer DEFAULT 0 NOT NULL,
    color text
);


--ALTER TABLE ref_rk_discounts OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 16724)
-- Name: ref_sys_rights; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ref_sys_rights (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    name text NOT NULL,
    tag text,
    state integer DEFAULT 0 NOT NULL
);


--ALTER TABLE ref_sys_rights OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 16669)
-- Name: ref_sys_states; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ref_sys_states (
    id integer NOT NULL,
    name text NOT NULL
);


--ALTER TABLE ref_sys_states OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 16659)
-- Name: ref_sys_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ref_sys_users (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    name text NOT NULL,
    pass text NOT NULL,
    state integer DEFAULT 0 NOT NULL,
    email text,
    telegram text
);


--ALTER TABLE ref_sys_users OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 16734)
-- Name: ref_sys_users_x_rights; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ref_sys_users_x_rights (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    user_id uuid NOT NULL,
    right_id uuid NOT NULL,
    state integer DEFAULT 0 NOT NULL
);


--ALTER TABLE ref_sys_users_x_rights OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 16717)
-- Name: tmp_sys_sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tmp_sys_sessions (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    user_id uuid NOT NULL,
    dts timestamp with time zone DEFAULT (now() + '01:00:00'::interval)
);


--ALTER TABLE tmp_sys_sessions OWNER TO postgres;


CREATE TABLE ref_sys_menuitems(
    id uuid NOT NULL DEFAULT uuid_generate_v4(),
    name text NOT NULL,
    state integer NOT NULL DEFAULT 0,
    path text,
    icon text,
    right_ig uuid
);
--
-- TOC entry 2489 (class 0 OID 16651)
-- Dependencies: 182
-- Data for Name: data_log; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2501 (class 0 OID 16767)
-- Dependencies: 194
-- Data for Name: ref_guest_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2502 (class 0 OID 16778)
-- Dependencies: 195
-- Data for Name: ref_guests; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2493 (class 0 OID 16687)
-- Dependencies: 186
-- Data for Name: ref_object_owners; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO ref_object_owners (id, user_id, object_id, state) VALUES ('7f4a6941-6c5d-4e04-80dd-6f22c12c0f3b', '15f76e83-07d3-4b11-be18-bcbdb5f0cfab', '77ca561b-84b8-44f7-b362-5c0ac18c5bdd', 0);


--
-- TOC entry 2492 (class 0 OID 16677)
-- Dependencies: 185
-- Data for Name: ref_objects; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO ref_objects (id, name, code, state, color) VALUES ('77ca561b-84b8-44f7-b362-5c0ac18c5bdd', 'test', 'test', 0, NULL);


--
-- TOC entry 2494 (class 0 OID 16694)
-- Dependencies: 187
-- Data for Name: ref_pos_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO ref_pos_types (id, name, code, state, color) VALUES ('60bac0d1-3250-4856-b233-7a6936ebb758', 'RK7MidServer', 'RK7MID', 0, NULL);


--
-- TOC entry 2495 (class 0 OID 16704)
-- Dependencies: 188
-- Data for Name: ref_poses; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2500 (class 0 OID 16756)
-- Dependencies: 193
-- Data for Name: ref_rk_bonuses; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2499 (class 0 OID 16745)
-- Dependencies: 192
-- Data for Name: ref_rk_discounts; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2497 (class 0 OID 16724)
-- Dependencies: 190
-- Data for Name: ref_sys_rights; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO ref_sys_rights (id, name, tag, state) VALUES ('103c5141-ae66-490f-9bce-b485bed10027', 'access to application', 'general', 0);
INSERT INTO ref_sys_rights (id, name, tag, state) VALUES ('3e110c55-c622-4292-9208-ea87c3f3383f', 'datacollector', 'datacollector', 0);
INSERT INTO ref_sys_rights (id, name, tag, state) VALUES ('60b1f283-956c-4cfa-8104-fc453369e7fe', 'guest list', 'activeguest', 0);
INSERT INTO ref_sys_rights (id, name, tag, state) VALUES ('1afbcece-0e0b-4a54-b962-b63ef271101e', 'add transaction', 'activeguest', 0);


--
-- TOC entry 2491 (class 0 OID 16669)
-- Dependencies: 184
-- Data for Name: ref_sys_states; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO ref_sys_states (id, name) VALUES (0, 'Active');
INSERT INTO ref_sys_states (id, name) VALUES (1, 'Deleted');


--
-- TOC entry 2490 (class 0 OID 16659)
-- Dependencies: 183
-- Data for Name: ref_sys_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO ref_sys_users (id, name, pass, state, email, telegram) VALUES ('15f76e83-07d3-4b11-be18-bcbdb5f0cfab', 'count', 'shadowsx', 0, 'count@ya.ru', NULL);


--
-- TOC entry 2498 (class 0 OID 16734)
-- Dependencies: 191
-- Data for Name: ref_sys_users_x_rights; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO ref_sys_users_x_rights (id, user_id, right_id, state) VALUES ('935024a3-b4ff-40ef-bbac-cef32dc8f943', '15f76e83-07d3-4b11-be18-bcbdb5f0cfab', '103c5141-ae66-490f-9bce-b485bed10027', 0);
INSERT INTO ref_sys_users_x_rights (id, user_id, right_id, state) VALUES ('d6a60cec-c5b9-465f-8590-226dcfb42bd2', '15f76e83-07d3-4b11-be18-bcbdb5f0cfab', '60b1f283-956c-4cfa-8104-fc453369e7fe', 0);


--
-- TOC entry 2496 (class 0 OID 16717)
-- Dependencies: 189
-- Data for Name: tmp_sys_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tmp_sys_sessions (id, user_id, dts) VALUES ('f337eb52-4ad3-492b-829a-2e57596158f6', '15f76e83-07d3-4b11-be18-bcbdb5f0cfab', '2017-08-07 03:26:39.831114+03');
INSERT INTO tmp_sys_sessions (id, user_id, dts) VALUES ('c5d9722d-cfc2-40d4-acb3-da9320182be6', '15f76e83-07d3-4b11-be18-bcbdb5f0cfab', '2017-08-15 23:54:58.193289+03');
INSERT INTO tmp_sys_sessions (id, user_id, dts) VALUES ('e4f18f7d-c48f-4fed-949f-09a0c72a7cf2', '15f76e83-07d3-4b11-be18-bcbdb5f0cfab', '2017-08-15 23:55:22.844866+03');


--
-- TOC entry 2372 (class 2606 OID 16777)
-- Name: ref_guest_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ref_guest_tags
    ADD CONSTRAINT ref_guest_tags_pkey PRIMARY KEY (id);


--
-- TOC entry 2374 (class 2606 OID 16788)
-- Name: ref_guests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ref_guests
    ADD CONSTRAINT ref_guests_pkey PRIMARY KEY (id);


--
-- TOC entry 2356 (class 2606 OID 16693)
-- Name: ref_object_owners_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ref_object_owners
    ADD CONSTRAINT ref_object_owners_pkey PRIMARY KEY (id);


--
-- TOC entry 2354 (class 2606 OID 16686)
-- Name: ref_objects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ref_objects
    ADD CONSTRAINT ref_objects_pkey PRIMARY KEY (id);


--
-- TOC entry 2358 (class 2606 OID 16703)
-- Name: ref_opos_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ref_pos_types
    ADD CONSTRAINT ref_pos_types_pkey PRIMARY KEY (id);


--
-- TOC entry 2360 (class 2606 OID 16713)
-- Name: ref_poses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ref_poses
    ADD CONSTRAINT ref_poses_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 16766)
-- Name: ref_rk_bonuses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ref_rk_bonuses
    ADD CONSTRAINT ref_rk_bonuses_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 16755)
-- Name: ref_rk_discounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ref_rk_discounts
    ADD CONSTRAINT ref_rk_discounts_pkey PRIMARY KEY (id);


--
-- TOC entry 2364 (class 2606 OID 16733)
-- Name: ref_sys_rights_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ref_sys_rights
    ADD CONSTRAINT ref_sys_rights_pkey PRIMARY KEY (id);


--
-- TOC entry 2352 (class 2606 OID 16676)
-- Name: ref_sys_states_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ref_sys_states
    ADD CONSTRAINT ref_sys_states_pkey PRIMARY KEY (id);


--
-- TOC entry 2350 (class 2606 OID 16668)
-- Name: ref_sys_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ref_sys_users
    ADD CONSTRAINT ref_sys_users_pkey PRIMARY KEY (id);


--
-- TOC entry 2366 (class 2606 OID 16739)
-- Name: ref_sys_users_x_rights_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ref_sys_users_x_rights
    ADD CONSTRAINT ref_sys_users_x_rights_pkey PRIMARY KEY (id);


--
-- TOC entry 2362 (class 2606 OID 16723)
-- Name: tmp_sys_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tmp_sys_sessions
    ADD CONSTRAINT tmp_sys_sessions_pkey PRIMARY KEY (id);



ALTER TABLE ONLY ref_sys_menuitems
    ADD CONSTRAINT ef_sys_menuitems_pkey PRIMARY KEY (id);

--
-- TOC entry 2509 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2017-08-16 00:30:26 MSK

--
-- PostgreSQL database dump complete
--

