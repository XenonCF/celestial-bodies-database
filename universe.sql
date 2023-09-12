--
-- PostgreSQL database dump
--

-- Dumped from database version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)

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
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    black_hole_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(10) NOT NULL,
    coordinates_relative_to_center character varying(30)
);


ALTER TABLE public.black_hole OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_hole_black_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_hole_black_hole_id_seq OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_hole_black_hole_id_seq OWNED BY public.black_hole.black_hole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    type character varying(20),
    distance_in_mill_ly integer,
    diameter_in_ly integer,
    special_characteristics text
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
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    dist_to_parent_planet_in_km integer,
    surface_temperature_kelvin integer,
    atmosphere character varying(30),
    is_minable boolean
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
    name character varying(20) NOT NULL,
    planet_type character varying(20),
    earth_masses numeric(4,2),
    earth_radii numeric(4,2),
    atmosphere character varying(30),
    has_base boolean,
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
    name character varying(30) NOT NULL,
    galaxy_id integer,
    apparent_magnitude numeric(2,1),
    solar_masses numeric(2,1),
    solar_radii numeric(2,1),
    temperature_in_kelvin integer
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
-- Name: black_hole black_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_hole_black_hole_id_seq'::regclass);


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
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_hole VALUES (1, 4, 'ABC-456', 'Sector A-12');
INSERT INTO public.black_hole VALUES (2, 2, 'XYZ-789', 'Quadrant B-7');
INSERT INTO public.black_hole VALUES (3, 6, 'DEF-123', 'Cluster X-9');
INSERT INTO public.black_hole VALUES (4, 1, 'GHI-234', 'Nebula 3-C');
INSERT INTO public.black_hole VALUES (5, 3, 'JKL-567', 'Cluster M-5');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Estelaris', 'Spiral', 30, 100000, 'It has an active core with intense star formation in its spiral arms');
INSERT INTO public.galaxy VALUES (2, 'Celestial', 'Irregular', 45, 60000, 'This galaxy contains numerous bright nebulae and star clusters in its irregular arms.');
INSERT INTO public.galaxy VALUES (3, 'Enigma', 'Eliptic', 70, 150000, 'Enigma hosts a supermassive black hole at its center, surrounded by a dense population of old stars.');
INSERT INTO public.galaxy VALUES (4, 'Aurora', 'Spiral', 25, 80000, 'Aurora is known for its spectacular galactic auroras that illuminate its polar regions.');
INSERT INTO public.galaxy VALUES (5, 'Hyperion', 'Annular', 55, 120000, 'Hyperion has a luminous ring around its core and is home to an advanced civilization of interstellar beings.');
INSERT INTO public.galaxy VALUES (6, 'Eterna', 'Barred Spiral', 50, 120000, 'The Eternal Galaxy is characterized by its distinctive central bar of stars that crosses its core.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 7, 'Lunaria', 120000, -220, 'None', false);
INSERT INTO public.moon VALUES (2, 12, 'Aqualuna', 180000, -150, 'Thin', true);
INSERT INTO public.moon VALUES (3, 3, 'Ignis', 90000, 300, 'None', false);
INSERT INTO public.moon VALUES (4, 18, 'Glacius', 210000, -250, 'Thin', true);
INSERT INTO public.moon VALUES (5, 5, 'Verdantia', 150000, 20, 'Breathable', true);
INSERT INTO public.moon VALUES (6, 11, 'Silvania', 175000, -180, 'None', false);
INSERT INTO public.moon VALUES (7, 9, 'Aerion', 160000, -130, 'Thin', true);
INSERT INTO public.moon VALUES (8, 14, 'Tundrica', 195000, -270, 'Thin', true);
INSERT INTO public.moon VALUES (9, 6, 'Solaris', 155000, 400, 'None', false);
INSERT INTO public.moon VALUES (10, 2, 'Abyssia', 85000, -280, 'None', false);
INSERT INTO public.moon VALUES (11, 13, 'Sapphire', 185000, -200, 'Thin', true);
INSERT INTO public.moon VALUES (12, 8, 'Aerith', 165000, -140, 'Thin', true);
INSERT INTO public.moon VALUES (13, 10, 'Nocturna', 170000, -210, 'None', false);
INSERT INTO public.moon VALUES (14, 4, 'Volcania', 110000, 600, 'None', false);
INSERT INTO public.moon VALUES (15, 15, 'Nebula', 200000, -240, 'Thin', true);
INSERT INTO public.moon VALUES (16, 17, 'Celestia', 205000, -190, 'Thin', true);
INSERT INTO public.moon VALUES (17, 1, 'Mystica', 80000, -300, 'None', false);
INSERT INTO public.moon VALUES (18, 16, 'Eclipse', 195000, -220, 'Thin', true);
INSERT INTO public.moon VALUES (19, 19, 'Aurora', 220000, -160, 'Thin', true);
INSERT INTO public.moon VALUES (20, 7, 'Nova', 125000, 350, 'None', false);
INSERT INTO public.moon VALUES (21, 12, 'Quasar', 185000, -260, 'Thin', true);
INSERT INTO public.moon VALUES (22, 3, 'Stellaria', 95000, 250, 'None', false);
INSERT INTO public.moon VALUES (23, 18, 'Nebulon', 215000, -230, 'Thin', true);
INSERT INTO public.moon VALUES (24, 5, 'Polaris', 145000, -170, 'Thin', true);
INSERT INTO public.moon VALUES (25, 11, 'Solstice', 170000, -240, 'None', false);
INSERT INTO public.moon VALUES (26, 9, 'Equinox', 155000, -190, 'Thin', true);
INSERT INTO public.moon VALUES (27, 14, 'Orbita', 190000, -280, 'None', false);
INSERT INTO public.moon VALUES (28, 6, 'Cometia', 160000, 300, 'None', false);
INSERT INTO public.moon VALUES (29, 2, 'Meteoris', 90000, -270, 'None', false);
INSERT INTO public.moon VALUES (30, 13, 'Starfall', 180000, -210, 'None', false);
INSERT INTO public.moon VALUES (31, 8, 'Galactia', 170000, -220, 'Thin', true);
INSERT INTO public.moon VALUES (32, 10, 'Cosmos', 175000, -200, 'Thin', true);
INSERT INTO public.moon VALUES (33, 4, 'Asteria', 105000, -250, 'None', false);
INSERT INTO public.moon VALUES (34, 15, 'Luminaria', 195000, -180, 'Thin', true);
INSERT INTO public.moon VALUES (35, 17, 'Aerona', 210000, -150, 'Thin', true);
INSERT INTO public.moon VALUES (36, 1, 'Sidera', 75000, -320, 'None', false);
INSERT INTO public.moon VALUES (37, 16, 'Pulsaria', 200000, -270, 'Thin', true);
INSERT INTO public.moon VALUES (38, 19, 'Nebula', 215000, -190, 'Thin', true);
INSERT INTO public.moon VALUES (39, 20, 'Stellaris', 230000, -170, 'Thin', true);
INSERT INTO public.moon VALUES (40, 7, 'Caelum', 130000, -160, 'Thin', true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Aquatica', 'Terrestrial', 0.92, 0.86, 'Nitrogen-Oxygen', false, 4);
INSERT INTO public.planet VALUES (2, 'Pyrovia', 'Gas Giant', 2.81, 10.20, 'Hydrogen-Helium', true, 2);
INSERT INTO public.planet VALUES (3, 'Cryos', 'Ice Giant', 1.75, 5.90, 'Methane-Ammonia', true, 5);
INSERT INTO public.planet VALUES (4, 'Terranova', 'Terrestrial', 1.12, 0.94, 'Oxygen-Argon', false, 1);
INSERT INTO public.planet VALUES (5, 'Zephyria', 'Terrestrial', 0.79, 0.77, 'Carbon Dioxide-Nitrogen', false, 3);
INSERT INTO public.planet VALUES (6, 'Volcanara', 'Terrestrial', 1.33, 1.09, 'Sulfur Dioxide-Carbon Dioxide', false, 6);
INSERT INTO public.planet VALUES (7, 'Helion', 'Terrestrial', 0.98, 0.91, 'Helium-Hydrogen', false, 2);
INSERT INTO public.planet VALUES (8, 'Seraphina', 'Terrestrial', 0.87, 0.82, 'Oxygen-Argon', false, 5);
INSERT INTO public.planet VALUES (9, 'Quasaris', 'Gas Giant', 3.64, 12.40, 'Hydrogen-Helium', true, 1);
INSERT INTO public.planet VALUES (10, 'Nebulon', 'Ice Giant', 2.15, 7.20, 'Methane-Ammonia', false, 6);
INSERT INTO public.planet VALUES (11, 'Solaria', 'Terrestrial', 1.05, 1.01, 'Oxygen-Nitrogen', false, 3);
INSERT INTO public.planet VALUES (12, 'Celestis', 'Terrestrial', 1.19, 1.15, 'Oxygen-Argon', false, 4);
INSERT INTO public.planet VALUES (13, 'Geodora', 'Terrestrial', 0.91, 0.87, 'Carbon Dioxide-Nitrogen', false, 1);
INSERT INTO public.planet VALUES (14, 'Titanis', 'Terrestrial', 1.28, 1.07, 'Methane-Nitrogen', false, 6);
INSERT INTO public.planet VALUES (15, 'Phobius', 'Terrestrial', 0.81, 0.75, 'Carbon Dioxide-Argon', false, 5);
INSERT INTO public.planet VALUES (16, 'Solara', 'Gas Giant', 4.12, 11.80, 'Hydrogen-Helium', true, 4);
INSERT INTO public.planet VALUES (17, 'Auroria', 'Terrestrial', 1.03, 0.98, 'Oxygen-Argon', false, 2);
INSERT INTO public.planet VALUES (18, 'Lumina', 'Terrestrial', 0.96, 0.92, 'Nitrogen-Oxygen', false, 3);
INSERT INTO public.planet VALUES (19, 'Eclipsia', 'Ice Giant', 2.45, 8.50, 'Methane-Ammonia', true, 6);
INSERT INTO public.planet VALUES (20, 'Nebulae', 'Terrestrial', 1.10, 1.03, 'Oxygen-Nitrogen', false, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Stellara', 1, -3.5, 2.5, 5.2, 20000);
INSERT INTO public.star VALUES (2, 'Luminaris', 6, -4.2, 1.8, 4.5, 22500);
INSERT INTO public.star VALUES (3, 'Ignitron', 5, -2.8, 3.0, 6.0, 18000);
INSERT INTO public.star VALUES (4, 'Aurora Alpha', 4, -3.9, 2.2, 4.8, 21000);
INSERT INTO public.star VALUES (5, 'Celestia', 2, -4.5, 1.6, 4.2, 23000);
INSERT INTO public.star VALUES (6, 'Eclipsis', 3, -3.2, 2.7, 5.5, 19500);


--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_hole_black_hole_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 40, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 20, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: black_hole black_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_pkey PRIMARY KEY (black_hole_id);


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
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: black_hole unique_black_hole_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT unique_black_hole_id UNIQUE (black_hole_id);


--
-- Name: galaxy unique_galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_id UNIQUE (galaxy_id);


--
-- Name: moon unique_moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_id UNIQUE (moon_id);


--
-- Name: planet unique_planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_id UNIQUE (planet_id);


--
-- Name: star unique_star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_id UNIQUE (star_id);


--
-- Name: black_hole galaxy_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT galaxy_id_fk FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

