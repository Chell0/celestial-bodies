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
-- Name: asteroids; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroids (
    asteroids_id integer NOT NULL,
    name character varying(255) NOT NULL,
    has_life boolean NOT NULL,
    distance_from_earth numeric NOT NULL,
    moon_id integer NOT NULL
);


ALTER TABLE public.asteroids OWNER TO freecodecamp;

--
-- Name: asteroids_asteroids_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroids_asteroids_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroids_asteroids_id_seq OWNER TO freecodecamp;

--
-- Name: asteroids_asteroids_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroids_asteroids_id_seq OWNED BY public.asteroids.asteroids_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    shape text,
    has_gas boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    size_in_square_kilometers numeric,
    composition character varying(255) NOT NULL,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    diameter_in_km integer,
    number_of_moons integer,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    spectral_type text NOT NULL,
    temperature_in_kelvins numeric,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: asteroids asteroids_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroids ALTER COLUMN asteroids_id SET DEFAULT nextval('public.asteroids_asteroids_id_seq'::regclass);


--
-- Data for Name: asteroids; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroids VALUES (1, 'Ceres', false, 2.8, 1);
INSERT INTO public.asteroids VALUES (2, 'Pallas', false, 2.7, 2);
INSERT INTO public.asteroids VALUES (3, 'Vesta', false, 2.4, 1);
INSERT INTO public.asteroids VALUES (4, 'Hygiea', false, 3.0, 2);
INSERT INTO public.asteroids VALUES (5, 'Eunomia', false, 2.9, 3);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Spiral', 'They have a central bulge of stars surrounded by a flat disk of stars, gas and dust', 'Spiral', true);
INSERT INTO public.galaxy VALUES (2, 'Elliptical', 'They are smooth, ellipsoidal shape and lack of spiral arms', 'Ellipsoidal', true);
INSERT INTO public.galaxy VALUES (3, 'Irregular', 'They can be small and faint, or large and bright, and often contain a mixture of young and old stars', 'Shapeless', false);
INSERT INTO public.galaxy VALUES (4, 'Barred spiral', 'They have a central bar of stars running through the center of their spiral arms', 'Spiral', false);
INSERT INTO public.galaxy VALUES (5, 'Lenticular', 'They have a disk-like structure like spiral galaxies, but they lack the distinctive spiral arms', 'Spiral', false);
INSERT INTO public.galaxy VALUES (6, 'Ring', 'They have a ring-like structure of stars, gas, and dust surrounding their central region', 'Ring-like', true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 37900000, 'rock', 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 37800, 'rock', 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 8300, 'rock', 4);
INSERT INTO public.moon VALUES (4, 'Europa', 19700000, 'water ice', 4);
INSERT INTO public.moon VALUES (5, 'Lo', 16, 'rock', 6);
INSERT INTO public.moon VALUES (6, 'Ganymede', 110000000, 'water ice', 6);
INSERT INTO public.moon VALUES (7, 'Callisto', 92000000, 'water ice', 6);
INSERT INTO public.moon VALUES (8, 'Mimas', 15000, 'water ice', 7);
INSERT INTO public.moon VALUES (9, 'Enceladus', 39000, 'water ice', 7);
INSERT INTO public.moon VALUES (10, 'Tethys', 61000000, 'water ice', 7);
INSERT INTO public.moon VALUES (11, 'Dione', 63000000, 'water ice', 7);
INSERT INTO public.moon VALUES (12, 'Rhea', 96500000, 'water ice', 7);
INSERT INTO public.moon VALUES (13, 'Titan', 243000000, 'water ice, methane and ammonia', 7);
INSERT INTO public.moon VALUES (14, 'Hyperion', 15000, 'water ice', 7);
INSERT INTO public.moon VALUES (15, 'Lapetus', 4000000, 'water ice', 7);
INSERT INTO public.moon VALUES (16, 'Umbriel', 29000, 'water ice', 8);
INSERT INTO public.moon VALUES (17, 'Ariel', 965000, 'water ice', 8);
INSERT INTO public.moon VALUES (18, 'Miranda', 1200000, 'water ice', 8);
INSERT INTO public.moon VALUES (19, 'Titania', 2900000, 'water ice', 8);
INSERT INTO public.moon VALUES (20, 'Oberon', 2800000, 'water ice', 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4878, 0, 3);
INSERT INTO public.planet VALUES (2, 'Venus', 12104, 0, 3);
INSERT INTO public.planet VALUES (3, 'Earth', 12760, 1, 3);
INSERT INTO public.planet VALUES (4, 'Mars', 6787, 2, 3);
INSERT INTO public.planet VALUES (5, 'Ceres', 950, 0, 3);
INSERT INTO public.planet VALUES (6, 'Jupiter', 139822, 79, 3);
INSERT INTO public.planet VALUES (7, 'Saturn', 120500, 82, 3);
INSERT INTO public.planet VALUES (8, 'Uranus', 51120, 27, 3);
INSERT INTO public.planet VALUES (9, 'Neptune', 49530, 14, 3);
INSERT INTO public.planet VALUES (10, 'Pluto', 2301, 5, 3);
INSERT INTO public.planet VALUES (11, 'Eris', 2326, 1, 3);
INSERT INTO public.planet VALUES (12, 'Sedna', 995, 0, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Red dwarfs', 'M', 3000, 1);
INSERT INTO public.star VALUES (2, 'Orange dwarfs', 'K', 4500, 2);
INSERT INTO public.star VALUES (3, 'Yellow dwarfs', 'K', 5500, 1);
INSERT INTO public.star VALUES (4, 'White dwarfs', 'D', 6500, 3);
INSERT INTO public.star VALUES (5, 'Red giants', 'M', 10000, 1);
INSERT INTO public.star VALUES (6, 'Supergiants', 'F', 7000, 1);


--
-- Name: asteroids_asteroids_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroids_asteroids_id_seq', 5, true);


--
-- Name: asteroids asteroids_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroids
    ADD CONSTRAINT asteroids_name_key UNIQUE (name);


--
-- Name: asteroids asteroids_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroids
    ADD CONSTRAINT asteroids_pkey PRIMARY KEY (asteroids_id);


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
-- Name: asteroids asteroids_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroids
    ADD CONSTRAINT asteroids_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


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

