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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_earth numeric,
    age integer,
    diameter_in_km integer,
    has_life boolean NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    is_spherical boolean,
    distance_from_earth numeric NOT NULL,
    age_in_millions_of_years integer,
    diameter_in_light_years integer,
    has_life boolean NOT NULL,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    is_spherical boolean,
    distance_from_planet numeric NOT NULL,
    orbital_period integer,
    mass integer,
    has_life boolean NOT NULL,
    description text,
    planet text,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    is_spherical boolean,
    distance_from_earth numeric NOT NULL,
    age_in_millions_of_years integer,
    diameter_in_km integer,
    has_life boolean NOT NULL,
    description text,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    is_spherical boolean,
    distance_from_earth numeric NOT NULL,
    age_in_millions_of_years integer,
    diameter_in_km integer,
    has_life boolean NOT NULL,
    description text,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (3, '2 Pallas', 232429, 8, 570, false);
INSERT INTO public.asteroid VALUES (2, '1 Ceres', 248369, 4, 945, false);
INSERT INTO public.asteroid VALUES (1, '4 Vesta', 385355, 13, 525, false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', false, 0, 14, 100000, true, 'The Milky Way is a barred spiral galaxy with a estimated D 25 isophotal diameter of 26.8 + 1.1 kiloparsecs..');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', false, 0, 10, 220000, false, 'Andromeda is a spiral galaxy located about 2.5 million light-years from Earth.');
INSERT INTO public.galaxy VALUES (4, 'Messier 81', false, 12, 11, 96000, false, 'Messier 81 is a grand design spiral galaxy located in the constellation Ursa Major.');
INSERT INTO public.galaxy VALUES (5, 'Cartwheel', false, 500, 300, 150000, false, 'The Cartwheel Galaxy is a lenticular ring galaxy about 500 million light-years away in the constellation Sculptor.');
INSERT INTO public.galaxy VALUES (3, 'Messier 64', false, 17, 10, 70000, false, 'Messier 64 is an isolated spiral galaxy located 17 million light-years away in the constellation of Coma Berenices.');
INSERT INTO public.galaxy VALUES (6, 'Messier 82', false, 12, 100, 40800, false, 'Messier 82 is an irregular galaxy that was discovered by German astronomer Johann Elert Bode.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', true, 382500, 5, 3474, false, 'Earths sole natural satellite and nearest large celestial body.', 'Earth', NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', true, 9377, 0, 11, false, 'Phobos is one of the two moons of Mars and it is the larger of the two moons.', 'Mars', NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', true, 23436, 1, 2, false, 'Deimos is the smaller of the two Martian moons and is less irregular in shape.', 'Mars', NULL);
INSERT INTO public.moon VALUES (4, 'Titan', true, 759000, 16, 135, false, 'Tiitan is an icy moon with a surface of rock-hard water-ice.', 'Saturn', NULL);
INSERT INTO public.moon VALUES (5, 'Enceladus', true, 238000, 1, 1, false, 'Enceladus is the sixth-largest moon of Saturn and is 500 kilometers in diameter.', 'Saturn', NULL);
INSERT INTO public.moon VALUES (6, 'Epimetheus', false, 151472, 17, 1017, false, 'Epimetheus is a potato-shaped moon with a mean radius of 36 miles.', 'Saturn', NULL);
INSERT INTO public.moon VALUES (7, 'Mimas', false, 115000, 22, 392, false, 'Mimas is the smallest and innermost of Saturns moons and is less than 123 miles in mean radius.', 'Saturn', NULL);
INSERT INTO public.moon VALUES (8, 'Europa', false, 671000, 3, 1940, false, 'Europa is one of Jupiters moons and may have twice as much water as Earth.', 'Jupiter', NULL);
INSERT INTO public.moon VALUES (9, 'Ganymede', true, 665000, 7, 2631, false, 'EGanymede is composed of approximately equal amounts of silica and water.', 'Jupiter', NULL);
INSERT INTO public.moon VALUES (10, 'Callisto', true, 880000, 16, 1070, false, 'Callisto is Jupiters second-largest moon and the third-largest moon in our Solar System.', 'Jupiter', NULL);
INSERT INTO public.moon VALUES (11, 'Thebe', true, 220000, 1, 1017, false, 'Thebe is the one of the four known small moons that orbit closer to Jupiter than the four larger Galilean moons.', 'Jupiter', NULL);
INSERT INTO public.moon VALUES (12, 'Triton', true, 354800, 5, 1214, false, 'Triton is the largest of Neptunes moons and rotattes in the opposite direction of Neptunes rotation.', 'Neptune', NULL);
INSERT INTO public.moon VALUES (13, 'Thalassa', true, 50074, 1, 374, false, 'Thalassa most likely formed from fragments of Neptunes original moons which were smashed when Neptune caught Triton.', 'Neptune', NULL);
INSERT INTO public.moon VALUES (14, 'Despina', false, 52526, 8, 2098, false, 'Despina is the third closest inner moon oof Neptune andis irregularly shaped and orbits.Neptune every 8 days.', 'Neptune', NULL);
INSERT INTO public.moon VALUES (15, 'Naiad', false, 48224, 7, 194, false, 'Naiad is an irregularly-shaped moon and is likely a rubble pile from Neptunes original satellites.', 'Neptune', NULL);
INSERT INTO public.moon VALUES (16, 'Titania', false, 436000, 9, 520, false, 'Titania is the largest of Uranus moons and the eighth-largest moon in the Solar System.', 'Uranus', NULL);
INSERT INTO public.moon VALUES (17, 'Miranda', false, 129900, 34, 500, false, 'Miranda is one of Uranus moons it is the smallest and the one which has the least rotation time.', 'Uranus', NULL);
INSERT INTO public.moon VALUES (18, 'Ariel', false, 190900, 3, 1294, false, 'Ariel is the fourth-largest of the 27 known moons of Uranus and orbits in the equatorial plane of Uranus.', 'Uranus', NULL);
INSERT INTO public.moon VALUES (19, 'Umbriel', false, 266000, 4, 1221, false, 'Umbriel is a moon of Uranus discovered on October 24 1851 by William Lassell.', 'Uranus', NULL);
INSERT INTO public.moon VALUES (20, 'Oberon', false, 584000, 14, 2883, false, 'Oberon is the second-largest moon of Uranus and is composed of roughly half ice and half rock.', 'Uranus', NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, 0, 15, 12756, true, 'A rocky planet with a solid and dynamic surface of mountains, canyons, plains and more.', NULL);
INSERT INTO public.planet VALUES (5, 'Mars', true, 119.44, 5, 6779, false, 'A dusty, cold, desert world with a very thin atmosphere.', NULL);
INSERT INTO public.planet VALUES (6, 'Jupiter', true, 778, 5, 143000, false, 'The fifth planet from our Sun and is, by far, the largest planet in the Solar System.', NULL);
INSERT INTO public.planet VALUES (7, 'Saturn', true, 996, 5, 116460, false, 'The sixth planet from our Sun and is the second-largest planet in the Solar System.', NULL);
INSERT INTO public.planet VALUES (8, 'Venus', true, 120, 5, 12104, false, 'The second planet from our Sun and Earth closest neighbor in the Solar System.', NULL);
INSERT INTO public.planet VALUES (9, 'Neptune', true, 2.872, 5, 49244, false, 'An ice giant made of water, ammonia and methane flowing over a solid core the size of Earth.', NULL);
INSERT INTO public.planet VALUES (10, 'Uranus', true, 1.8815, 5, 50724, false, 'One of two ice giants in the outer Solar System, the other being Neptune.', NULL);
INSERT INTO public.planet VALUES (11, 'Mercury', true, 126.93, 5, 48794, false, 'The smallest planet in our Solar System and nearest to the Sun.', NULL);
INSERT INTO public.planet VALUES (12, 'Kepler-452b', true, 156, 6, 21000, true, 'A super-Earth exoplanet orbiting within the inner edge of the habitable zone of the sun-like star Kepler-452.', NULL);
INSERT INTO public.planet VALUES (13, 'Kepler-186f', true, 500, 4, 14300, true, 'An exoplanet orbiting the red dwarf Kepler-186 about 580 light-years from Earth.', NULL);
INSERT INTO public.planet VALUES (14, 'HD 209458 b', true, 150, 4, 7, false, 'Also known as Osiris HD 209458 b is an exoplanet that orbits the solar analog HD 209458 in the constellation Pegasus.', NULL);
INSERT INTO public.planet VALUES (15, '51 Pegasi b', true, 48, 7, 7, false, '51 Pegasi b was the first-discovered planetary-mass companion of a main-sequence parent star.', NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Polaris', true, 323, 70, 70, false, 'A bright star at the end of the handle of the Little Dipper in the constellation Ursa Minor.', NULL);
INSERT INTO public.star VALUES (2, 'Sirius', true, 66, 250, 12000, false, 'Sirius is a binary star system consisting of the main star Sirius A and its dwarf companion Sirius B.', NULL);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', true, 4.6, 250, 702420, false, 'SAlpha Centauri is a triple star system it is the closest star and planetary system to our Solar System.', NULL);
INSERT INTO public.star VALUES (4, 'Betelgeuse', true, 5, 427, 10, false, 'Betelgeuse is a red supergiant of spectral type M1-2 and one of the largest stars visible to the naked eye.', NULL);
INSERT INTO public.star VALUES (5, 'Rigel', true, 860, 8, 105, false, 'Rigel is a blue supergiant star in the constellation of Orion.', NULL);
INSERT INTO public.star VALUES (6, 'Vega', true, 25, 455, 4, false, 'Vega is the brightest of the succesive northern pole stars.', NULL);


--
-- Name: asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_id_seq', 1, false);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 1, false);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 15, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 1, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key1 UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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

