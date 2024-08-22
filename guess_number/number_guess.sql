--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    number_of_guesses integer NOT NULL,
    secret_number integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.games ALTER COLUMN game_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.games_game_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.users ALTER COLUMN user_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 6, 551);
INSERT INTO public.games VALUES (2, 2, 504, 503);
INSERT INTO public.games VALUES (3, 2, 284, 283);
INSERT INTO public.games VALUES (4, 3, 170, 169);
INSERT INTO public.games VALUES (5, 3, 407, 406);
INSERT INTO public.games VALUES (6, 2, 862, 859);
INSERT INTO public.games VALUES (7, 2, 804, 803);
INSERT INTO public.games VALUES (8, 2, 611, 610);
INSERT INTO public.games VALUES (9, 1, 1, 583);
INSERT INTO public.games VALUES (10, 1, 1, 21);
INSERT INTO public.games VALUES (11, 4, 804, 803);
INSERT INTO public.games VALUES (12, 4, 388, 387);
INSERT INTO public.games VALUES (13, 5, 934, 933);
INSERT INTO public.games VALUES (14, 5, 392, 391);
INSERT INTO public.games VALUES (15, 4, 645, 642);
INSERT INTO public.games VALUES (16, 4, 331, 330);
INSERT INTO public.games VALUES (17, 4, 454, 453);
INSERT INTO public.games VALUES (18, 6, 856, 855);
INSERT INTO public.games VALUES (19, 6, 318, 317);
INSERT INTO public.games VALUES (20, 7, 668, 667);
INSERT INTO public.games VALUES (21, 7, 860, 859);
INSERT INTO public.games VALUES (22, 6, 278, 275);
INSERT INTO public.games VALUES (23, 6, 519, 518);
INSERT INTO public.games VALUES (24, 6, 577, 576);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'Duc');
INSERT INTO public.users VALUES (2, 'user_1724310557274');
INSERT INTO public.users VALUES (3, 'user_1724310557273');
INSERT INTO public.users VALUES (4, 'user_1724311072068');
INSERT INTO public.users VALUES (5, 'user_1724311072067');
INSERT INTO public.users VALUES (6, 'user_1724311216543');
INSERT INTO public.users VALUES (7, 'user_1724311216542');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 24, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 7, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

