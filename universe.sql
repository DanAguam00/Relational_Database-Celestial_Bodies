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
-- Name: celestial_relationship; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.celestial_relationship (
    celestial_relationship_id integer NOT NULL,
    name character varying(255) NOT NULL,
    object_1_id integer NOT NULL,
    object_2_id integer NOT NULL,
    relationship_type text NOT NULL,
    object_1_type text NOT NULL,
    object_2_type text NOT NULL,
    CONSTRAINT celestial_relationship_object_1_type_check CHECK ((object_1_type = ANY (ARRAY['galaxy'::text, 'star'::text, 'planet'::text, 'moon'::text]))),
    CONSTRAINT celestial_relationship_object_2_type_check CHECK ((object_2_type = ANY (ARRAY['galaxy'::text, 'star'::text, 'planet'::text, 'moon'::text])))
);


ALTER TABLE public.celestial_relationship OWNER TO freecodecamp;

--
-- Name: celestial_relationship_celestial_relationship_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.celestial_relationship_celestial_relationship_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.celestial_relationship_celestial_relationship_id_seq OWNER TO freecodecamp;

--
-- Name: celestial_relationship_celestial_relationship_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.celestial_relationship_celestial_relationship_id_seq OWNED BY public.celestial_relationship.celestial_relationship_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_type text NOT NULL,
    distance_from_earth numeric NOT NULL,
    has_life boolean NOT NULL,
    age_in_millions_of_years integer NOT NULL
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
    name character varying(255) NOT NULL,
    planet_id integer,
    diameter integer NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer NOT NULL
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
    name character varying(255) NOT NULL,
    star_id integer,
    has_life boolean NOT NULL,
    radius integer NOT NULL,
    orbit_period numeric NOT NULL
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
    name character varying(255) NOT NULL,
    galaxy_id integer,
    star_type text NOT NULL,
    mass numeric NOT NULL,
    is_spherical boolean NOT NULL
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
-- Name: celestial_relationship celestial_relationship_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_relationship ALTER COLUMN celestial_relationship_id SET DEFAULT nextval('public.celestial_relationship_celestial_relationship_id_seq'::regclass);


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
-- Data for Name: celestial_relationship; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.celestial_relationship VALUES (1, 'Milky Way contains Sun', 1, 1, 'contains', 'galaxy', 'star');
INSERT INTO public.celestial_relationship VALUES (2, 'Milky Way contains Sirius', 1, 2, 'contains', 'galaxy', 'star');
INSERT INTO public.celestial_relationship VALUES (3, 'Andromeda contains Vega', 2, 6, 'contains', 'galaxy', 'star');
INSERT INTO public.celestial_relationship VALUES (4, 'Triangulum contains Rigel', 3, 7, 'contains', 'galaxy', 'star');
INSERT INTO public.celestial_relationship VALUES (5, 'Milky Way contains Betelgeuse', 1, 3, 'contains', 'galaxy', 'star');
INSERT INTO public.celestial_relationship VALUES (6, 'Milky Way contains Alpha Centauri A', 1, 4, 'contains', 'galaxy', 'star');
INSERT INTO public.celestial_relationship VALUES (7, 'Sombrero contains another star', 5, 8, 'contains', 'galaxy', 'star');
INSERT INTO public.celestial_relationship VALUES (8, 'Earth orbits Sun', 9, 1, 'orbits', 'planet', 'star');
INSERT INTO public.celestial_relationship VALUES (9, 'Mars orbits Sun', 10, 1, 'orbits', 'planet', 'star');
INSERT INTO public.celestial_relationship VALUES (10, 'Moon orbits Earth', 11, 9, 'orbits', 'moon', 'planet');
INSERT INTO public.celestial_relationship VALUES (11, 'Phobos orbits Mars', 12, 10, 'orbits', 'moon', 'planet');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 0, true, 13600);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2537000, false, 10000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 3000000, false, 5000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 23000000, false, 4000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Elliptical', 29000000, false, 10000);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'Elliptical', 53000000, false, 11000);
INSERT INTO public.galaxy VALUES (7, 'Cartwheel', 'Lenticular', 500000000, false, 1500);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 3474, true, 4500);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 22, false, 4500);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 12, false, 4500);
INSERT INTO public.moon VALUES (4, 'Io', 4, 3642, true, 4500);
INSERT INTO public.moon VALUES (5, 'Europa', 4, 3121, true, 4500);
INSERT INTO public.moon VALUES (6, 'Ganymede', 4, 5262, true, 4500);
INSERT INTO public.moon VALUES (7, 'Callisto', 4, 4821, true, 4500);
INSERT INTO public.moon VALUES (8, 'Titan', 5, 5150, true, 4500);
INSERT INTO public.moon VALUES (9, 'Enceladus', 5, 504, true, 4500);
INSERT INTO public.moon VALUES (10, 'Mimas', 5, 396, true, 4500);
INSERT INTO public.moon VALUES (11, 'Triton', 6, 2707, true, 4500);
INSERT INTO public.moon VALUES (12, 'Nereid', 6, 340, false, 4500);
INSERT INTO public.moon VALUES (13, 'Charon', 6, 1207, true, 4500);
INSERT INTO public.moon VALUES (14, 'Dysnomia', 6, 700, false, 4500);
INSERT INTO public.moon VALUES (15, 'Oberon', 6, 1523, true, 4500);
INSERT INTO public.moon VALUES (16, 'Titania', 6, 1578, true, 4500);
INSERT INTO public.moon VALUES (17, 'Ariel', 6, 1158, true, 4500);
INSERT INTO public.moon VALUES (18, 'Umbriel', 6, 1169, true, 4500);
INSERT INTO public.moon VALUES (19, 'Miranda', 6, 471, true, 4500);
INSERT INTO public.moon VALUES (20, 'Proteus', 6, 420, false, 4500);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, true, 6371, 365.25);
INSERT INTO public.planet VALUES (2, 'Mars', 1, false, 3389, 687);
INSERT INTO public.planet VALUES (3, 'Venus', 1, false, 6052, 225);
INSERT INTO public.planet VALUES (4, 'Jupiter', 1, false, 69911, 4333);
INSERT INTO public.planet VALUES (5, 'Saturn', 1, false, 58232, 10759);
INSERT INTO public.planet VALUES (6, 'Neptune', 1, false, 24622, 60190);
INSERT INTO public.planet VALUES (7, 'Alpha Centauri Bb', 4, false, 3500, 20.4);
INSERT INTO public.planet VALUES (8, 'Proxima b', 5, false, 7100, 11.2);
INSERT INTO public.planet VALUES (9, 'Kepler-22b', 6, false, 13800, 290);
INSERT INTO public.planet VALUES (10, 'Gliese 581g', 6, false, 4500, 36.6);
INSERT INTO public.planet VALUES (11, 'HD 209458 b', 6, false, 100000, 3.5);
INSERT INTO public.planet VALUES (12, '55 Cancri e', 6, false, 8700, 18);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G-type', 1.0, true);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'A-type', 2.02, true);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 'Red Supergiant', 20.0, true);
INSERT INTO public.star VALUES (4, 'Alpha Centauri A', 1, 'G-type', 1.1, true);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 1, 'M-type', 0.12, true);
INSERT INTO public.star VALUES (6, 'Vega', 2, 'A-type', 2.1, true);
INSERT INTO public.star VALUES (7, 'Rigel', 3, 'Blue Supergiant', 21.0, true);


--
-- Name: celestial_relationship_celestial_relationship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.celestial_relationship_celestial_relationship_id_seq', 11, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: celestial_relationship celestial_relationship_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_relationship
    ADD CONSTRAINT celestial_relationship_name_key UNIQUE (name);


--
-- Name: celestial_relationship celestial_relationship_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_relationship
    ADD CONSTRAINT celestial_relationship_pkey PRIMARY KEY (celestial_relationship_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


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

