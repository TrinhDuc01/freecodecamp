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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: dk; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.dk (
    dk_id integer NOT NULL,
    address integer,
    stt integer,
    gap numeric,
    description text,
    is_vip boolean,
    name character varying(50) NOT NULL
);


ALTER TABLE public.dk OWNER TO freecodecamp;

--
-- Name: dk_dk_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.dk_dk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dk_dk_id_seq OWNER TO freecodecamp;

--
-- Name: dk_dk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.dk_dk_id_seq OWNED BY public.dk.dk_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    address integer,
    stt integer,
    gap numeric,
    description text,
    is_vip boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    address integer,
    stt integer,
    gap numeric,
    description text,
    is_vip boolean,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    address integer,
    stt integer,
    gap numeric,
    description text,
    is_vip boolean,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    address integer,
    stt integer,
    gap numeric,
    description text,
    is_vip boolean,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: dk dk_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dk ALTER COLUMN dk_id SET DEFAULT nextval('public.dk_dk_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: dk; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.dk VALUES (1, 22325, 2541234, 31566722, '2345gdf', true, 'dsdsadf23');
INSERT INTO public.dk VALUES (2, 721262345, 2415234, 31566722, 'jsdferaf', false, 'asdv');
INSERT INTO public.dk VALUES (3, 132462345, 252434, 31566722, 'bdsf574yr', true, 'qweewr');
INSERT INTO public.dk VALUES (4, 65623545, 25114234, 31566722, 'fds345q3asd5644', false, 'ewqr');
INSERT INTO public.dk VALUES (5, 23612345, 245234, 3451566722, 'kghsdfhf', true, 'dasf');
INSERT INTO public.dk VALUES (6, 234626345, 25234, 31566714242, 'assgf', true, 'cxxzcv');
INSERT INTO public.dk VALUES (7, 1326452345, 252634, 31543513566722, 'bdafadsfsfr', true, '32gd4duc423');
INSERT INTO public.dk VALUES (8, 231462345, 276523445, 31542466722, 'kbvcbcgf', true, 'cxdgvdasdfuc423');
INSERT INTO public.dk VALUES (9, 234642345, 252765734, 315661722, 'asafdsadff', true, 'af');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'mykiway', 12345, 234, 156672, 'qwerhagufdg', true);
INSERT INTO public.galaxy VALUES (2, 'mykiway1', 12313, 1243, 544231, 'wqrr12', true);
INSERT INTO public.galaxy VALUES (3, 'mykiway2', 7567, 75633, 2645, 'asdfaf', false);
INSERT INTO public.galaxy VALUES (4, 'mykiway3', 3423, 312, 4537, 'afds', false);
INSERT INTO public.galaxy VALUES (5, 'mykiway4', 85312, 6523, 1231, 'zcxv', true);
INSERT INTO public.galaxy VALUES (6, 'mykiway5', 8832, 9841, 1682, 'yfkru', true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'dsdsadf23', 22325, 2541234, 31566722, '2345gdf', true, 2);
INSERT INTO public.moon VALUES (2, 'asdv', 721262345, 2415234, 31566722, 'jsdferaf', false, 3);
INSERT INTO public.moon VALUES (3, 'qweewr', 132462345, 252434, 31566722, 'bdsf574yr', true, 4);
INSERT INTO public.moon VALUES (4, 'ewqr', 65623545, 25114234, 31566722, 'fds345q3asd5644', false, 5);
INSERT INTO public.moon VALUES (5, 'dasf', 23612345, 245234, 3451566722, 'kghsdfhf', true, 1);
INSERT INTO public.moon VALUES (6, 'cxxzcv', 234626345, 25234, 31566714242, 'assgf', true, 2);
INSERT INTO public.moon VALUES (7, '32gd4duc423', 1326452345, 252634, 31543513566722, 'bdafadsfsfr', true, 6);
INSERT INTO public.moon VALUES (8, 'cxdgvdasdfuc423', 231462345, 276523445, 31542466722, 'kbvcbcgf', true, 6);
INSERT INTO public.moon VALUES (9, 'af', 234642345, 252765734, 315661722, 'asafdsadff', true, 1);
INSERT INTO public.moon VALUES (10, '32gf44duc423', 1326231445, 252345, 3165566722, 'bdasdfasdfsfr', true, 4);
INSERT INTO public.moon VALUES (12, 'cxfgdfgvduc423', 23162345, 2525434, 3152566722, 'kxcvbcvbgf', true, 6);
INSERT INTO public.moon VALUES (13, 'asdf', 22325, 2541234, 31566722, '2345gdf', true, 2);
INSERT INTO public.moon VALUES (14, 'fj', 721262345, 2415234, 31566722, 'jsdferaf', false, 3);
INSERT INTO public.moon VALUES (15, 'sdfgn', 132462345, 252434, 31566722, 'bdsf574yr', true, 4);
INSERT INTO public.moon VALUES (16, 'sfg43', 65623545, 25114234, 31566722, 'fds345q3asd5644', false, 5);
INSERT INTO public.moon VALUES (17, '1234', 23612345, 245234, 3451566722, 'kghsdfhf', true, 1);
INSERT INTO public.moon VALUES (18, '142', 234626345, 25234, 31566714242, 'assgf', true, 2);
INSERT INTO public.moon VALUES (19, 'cxv', 1326452345, 252634, 31543513566722, 'bdafadsfsfr', true, 6);
INSERT INTO public.moon VALUES (20, 'erqw', 231462345, 276523445, 31542466722, 'kbvcbcgf', true, 6);
INSERT INTO public.moon VALUES (21, 'qwer', 234642345, 252765734, 315661722, 'asafdsadff', true, 1);
INSERT INTO public.moon VALUES (22, 'qwer23', 1326231445, 252345, 3165566722, 'bdasdfasdfsfr', true, 4);
INSERT INTO public.moon VALUES (23, 'wert', 65623145, 25234, 31566345722, 'fds5cbvcxvb644', false, 5);
INSERT INTO public.moon VALUES (24, 'sdfgsd', 23162345, 2525434, 3152566722, 'kxcvbcvbgf', true, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'dsdsadfuc423', 22325, 2541234, 31566722, '2345gdf', true, 2);
INSERT INTO public.planet VALUES (2, 'asdf34232dgdsfuc423', 721262345, 2415234, 31566722, 'jsdferaf', false, 3);
INSERT INTO public.planet VALUES (3, '324du23423gdfc423', 132462345, 252434, 31566722, 'bdsf574yr', true, 4);
INSERT INTO public.planet VALUES (4, 'ds243gfdgwrdfduc423', 65623545, 25114234, 31566722, 'fds345q3asd5644', false, 5);
INSERT INTO public.planet VALUES (5, 'cxvwq4wsrtyjhduc423', 23612345, 245234, 3451566722, 'kghsdfhf', true, 1);
INSERT INTO public.planet VALUES (6, 'dsduc231423', 234626345, 25234, 31566714242, 'assgf', true, 2);
INSERT INTO public.planet VALUES (7, '32gd4duc423', 1326452345, 252634, 31543513566722, 'bdafadsfsfr', true, 6);
INSERT INTO public.planet VALUES (8, 'cxdgvdasdfuc423', 231462345, 276523445, 31542466722, 'kbvcbcgf', true, 6);
INSERT INTO public.planet VALUES (9, 'saasdf43qw', 234642345, 252765734, 315661722, 'asafdsadff', true, 1);
INSERT INTO public.planet VALUES (10, '32ffgf4duc423', 1326231445, 252345, 3165566722, 'bdasdfasdfsfr', true, 4);
INSERT INTO public.planet VALUES (11, 'dsfdgfduc423', 65623145, 25234, 31566345722, 'fds5cbvcxvb644', false, 5);
INSERT INTO public.planet VALUES (12, 'cxfgdfgvduc423', 23162345, 2525434, 3152566722, 'kxcvbcvbgf', true, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'duc423', 762345, 25234, 31566722, 'hehe', true, 1);
INSERT INTO public.star VALUES (2, 'dsduc423', 23462345, 25234, 31566722, 'asf', true, 2);
INSERT INTO public.star VALUES (3, 'asdfduc423', 72162345, 25234, 31566722, 'jsdff', false, 3);
INSERT INTO public.star VALUES (4, '324duc423', 13262345, 25234, 31566722, 'bdsfr', true, 4);
INSERT INTO public.star VALUES (5, 'dsfduc423', 6562345, 25234, 31566722, 'fds5644', false, 5);
INSERT INTO public.star VALUES (6, 'cxvduc423', 2362345, 25234, 31566722, 'kgf', true, 6);


--
-- Name: dk_dk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.dk_dk_id_seq', 9, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: dk dk_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dk
    ADD CONSTRAINT dk_pkey PRIMARY KEY (dk_id);


--
-- Name: dk dk_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dk
    ADD CONSTRAINT dk_unique UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_unique UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_unique UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_unique UNIQUE (name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

