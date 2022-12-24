--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE users;
--
-- Name: users; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE users WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE users OWNER TO freecodecamp;

\connect users

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22),
    games_played integer,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (2, 'user_1671870581602', 2, 694);
INSERT INTO public.users VALUES (19, 'user_1671872209280', 2, 211);
INSERT INTO public.users VALUES (1, 'user_1671870581603', 5, 283);
INSERT INTO public.users VALUES (4, 'user_1671870684293', 2, 70);
INSERT INTO public.users VALUES (18, 'user_1671872209281', 5, 215);
INSERT INTO public.users VALUES (3, 'user_1671870684294', 5, 115);
INSERT INTO public.users VALUES (6, 'user_1671870803067', 2, 192);
INSERT INTO public.users VALUES (5, 'user_1671870803068', 5, 239);
INSERT INTO public.users VALUES (21, 'user_1671872263476', 2, 173);
INSERT INTO public.users VALUES (8, 'user_1671870843384', 2, 344);
INSERT INTO public.users VALUES (20, 'user_1671872263477', 5, 216);
INSERT INTO public.users VALUES (7, 'user_1671870843385', 5, 104);
INSERT INTO public.users VALUES (10, 'user_1671871108682', 2, 270);
INSERT INTO public.users VALUES (23, 'user_1671872346496', 2, 663);
INSERT INTO public.users VALUES (9, 'user_1671871108683', 5, 208);
INSERT INTO public.users VALUES (12, 'user_1671871122334', 2, 102);
INSERT INTO public.users VALUES (22, 'user_1671872346497', 5, 133);
INSERT INTO public.users VALUES (11, 'user_1671871122335', 5, 538);
INSERT INTO public.users VALUES (14, 'user_1671871222788', 2, 420);
INSERT INTO public.users VALUES (25, 'user_1671872357671', 2, 856);
INSERT INTO public.users VALUES (13, 'user_1671871222789', 5, 217);
INSERT INTO public.users VALUES (15, 'Prasert', 1, 10);
INSERT INTO public.users VALUES (17, 'user_1671872101910', 2, 325);
INSERT INTO public.users VALUES (24, 'user_1671872357672', 5, 223);
INSERT INTO public.users VALUES (16, 'user_1671872101911', 5, 501);
INSERT INTO public.users VALUES (27, 'user_1671872450166', 2, 305);
INSERT INTO public.users VALUES (26, 'user_1671872450167', 5, 329);
INSERT INTO public.users VALUES (29, 'user_1671872506851', 2, 192);
INSERT INTO public.users VALUES (28, 'user_1671872506852', 5, 140);
INSERT INTO public.users VALUES (31, 'user_1671872537807', 2, 619);
INSERT INTO public.users VALUES (30, 'user_1671872537808', 5, 130);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 31, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

