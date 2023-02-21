--
-- PostgreSQL database dump
--

-- Dumped from database version 12.10 (Debian 12.10-1.pgdg90+1)
-- Dumped by pg_dump version 12.10 (Debian 12.10-1.pgdg90+1)

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

--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ass_observation_collection_observation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ass_observation_collection_observation (
    observation_collection_id bigint NOT NULL,
    observation_id bigint NOT NULL
);


ALTER TABLE public.ass_observation_collection_observation OWNER TO postgres;

--
-- Name: ass_observation_deployment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ass_observation_deployment (
    observation_id bigint NOT NULL,
    deployment_id bigint NOT NULL
);


ALTER TABLE public.ass_observation_deployment OWNER TO postgres;

--
-- Name: ass_observation_host; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ass_observation_host (
    observation_id bigint NOT NULL,
    host_id bigint NOT NULL
);


ALTER TABLE public.ass_observation_host OWNER TO postgres;

--
-- Name: ass_observation_observer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ass_observation_observer (
    observation_id bigint NOT NULL,
    observer_id bigint NOT NULL
);


ALTER TABLE public.ass_observation_observer OWNER TO postgres;

--
-- Name: ass_preparation_procedure_preparation_step; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ass_preparation_procedure_preparation_step (
    preparation_procedure_id bigint NOT NULL,
    preparation_step_id bigint NOT NULL
);


ALTER TABLE public.ass_preparation_procedure_preparation_step OWNER TO postgres;

--
-- Name: ass_related_observation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ass_related_observation (
    observation_id bigint NOT NULL,
    related_observation_id bigint NOT NULL
);


ALTER TABLE public.ass_related_observation OWNER TO postgres;

--
-- Name: ass_related_observation_collection; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ass_related_observation_collection (
    observation_collection_id bigint NOT NULL,
    related_observation_collection_id bigint NOT NULL
);


ALTER TABLE public.ass_related_observation_collection OWNER TO postgres;

--
-- Name: ass_related_sample; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ass_related_sample (
    sample_id bigint NOT NULL,
    related_sample_id bigint NOT NULL
);


ALTER TABLE public.ass_related_sample OWNER TO postgres;

--
-- Name: ass_related_sample_collection; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ass_related_sample_collection (
    sample_collection_id bigint NOT NULL,
    related_sample_collection_id bigint NOT NULL
);


ALTER TABLE public.ass_related_sample_collection OWNER TO postgres;

--
-- Name: ass_related_sampling; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ass_related_sampling (
    sampling_id bigint NOT NULL,
    related_sampling_id bigint NOT NULL
);


ALTER TABLE public.ass_related_sampling OWNER TO postgres;

--
-- Name: ass_sample_collection_sample; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ass_sample_collection_sample (
    sample_collection_id bigint NOT NULL,
    sample_id bigint NOT NULL
);


ALTER TABLE public.ass_sample_collection_sample OWNER TO postgres;

--
-- Name: ass_sample_sampling; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ass_sample_sampling (
    sample_id bigint NOT NULL,
    sampling_id bigint NOT NULL
);


ALTER TABLE public.ass_sample_sampling OWNER TO postgres;

--
-- Name: ass_sampler_sampling; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ass_sampler_sampling (
    sampler_id bigint NOT NULL,
    sampling_id bigint NOT NULL
);


ALTER TABLE public.ass_sampler_sampling OWNER TO postgres;

--
-- Name: ass_sampling_procedure_sampler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ass_sampling_procedure_sampler (
    sampling_procedure_id bigint NOT NULL,
    sampler_id bigint NOT NULL
);


ALTER TABLE public.ass_sampling_procedure_sampler OWNER TO postgres;

--
-- Name: ass_sampling_procedure_sampling; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ass_sampling_procedure_sampling (
    sampling_procedure_id bigint NOT NULL,
    sampling_id bigint NOT NULL
);


ALTER TABLE public.ass_sampling_procedure_sampling OWNER TO postgres;

--
-- Name: ass_sampling_sample; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ass_sampling_sample (
    sampling_id bigint NOT NULL,
    sample_id bigint NOT NULL
);


ALTER TABLE public.ass_sampling_sample OWNER TO postgres;

--
-- Name: deployment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deployment (
    id integer NOT NULL,
    name character varying(100),
    description character varying(100),
    metadata character varying(100),
    link character varying(100),
    reason character varying(100),
    start_time timestamp with time zone,
    end_time timestamp with time zone,
    observer integer NOT NULL,
    host integer NOT NULL
);


ALTER TABLE public.deployment OWNER TO postgres;

--
-- Name: deployment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.deployment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deployment_id_seq OWNER TO postgres;

--
-- Name: deployment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.deployment_id_seq OWNED BY public.deployment.id;


--
-- Name: foi_sample; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.foi_sample (
    id integer NOT NULL,
    name character varying(100),
    description character varying(100),
    metadata character varying(100),
    link character varying(100),
    horiz_accuracy character varying(100),
    vert_accuracy character varying(100),
    sample_type character varying(100) NOT NULL,
    shape public.geometry(Point,4326),
    parameter jsonb
);


ALTER TABLE public.foi_sample OWNER TO postgres;

--
-- Name: foi_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.foi_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.foi_id_seq OWNER TO postgres;

--
-- Name: foi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.foi_id_seq OWNED BY public.foi_sample.id;


--
-- Name: host; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.host (
    id integer NOT NULL,
    name character varying(100),
    description character varying(100),
    metadata character varying(100),
    link character varying(100),
    location public.geometry(Point,4326)
);


ALTER TABLE public.host OWNER TO postgres;

--
-- Name: host_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.host_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.host_id_seq OWNER TO postgres;

--
-- Name: host_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.host_id_seq OWNED BY public.host.id;


--
-- Name: obs_procedure; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.obs_procedure (
    id integer NOT NULL,
    name character varying(100),
    description character varying(100),
    metadata character varying(100),
    link character varying(100)
);


ALTER TABLE public.obs_procedure OWNER TO postgres;

--
-- Name: obs_procedure_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.obs_procedure_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.obs_procedure_id_seq OWNER TO postgres;

--
-- Name: obs_procedure_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.obs_procedure_id_seq OWNED BY public.obs_procedure.id;


--
-- Name: obs_prop; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.obs_prop (
    id integer NOT NULL,
    name character varying(100),
    description character varying(100),
    metadata character varying(100),
    link character varying(100)
);


ALTER TABLE public.obs_prop OWNER TO postgres;

--
-- Name: obs_prop_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.obs_prop_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.obs_prop_id_seq OWNER TO postgres;

--
-- Name: obs_prop_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.obs_prop_id_seq OWNED BY public.obs_prop.id;


--
-- Name: observation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.observation (
    id integer NOT NULL,
    name character varying(100),
    description character varying(100),
    metadata character varying(100),
    phenomenon_time_start timestamp with time zone,
    phenomenon_time_end timestamp with time zone,
    result_time timestamp with time zone,
    valid_time_start timestamp with time zone,
    valid_time_end timestamp with time zone,
    result_quality json,
    obs_prop integer NOT NULL,
    obs_procedure integer NOT NULL,
    foi integer NOT NULL,
    ufoi integer,
    pfoi integer,
    parameter jsonb
);


ALTER TABLE public.observation OWNER TO postgres;

--
-- Name: observation_collection; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.observation_collection (
    id integer NOT NULL,
    name character varying(100),
    description character varying(100),
    metadata character varying(100),
    type character varying(100),
    observing_procedure integer,
    observed_property integer NOT NULL,
    observer integer,
    ufoi integer,
    pfoi integer,
    result integer,
    host integer
);


ALTER TABLE public.observation_collection OWNER TO postgres;

--
-- Name: observation_collection_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.observation_collection_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.observation_collection_id_seq OWNER TO postgres;

--
-- Name: observation_collection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.observation_collection_id_seq OWNED BY public.observation_collection.id;


--
-- Name: observation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.observation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.observation_id_seq OWNER TO postgres;

--
-- Name: observation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.observation_id_seq OWNED BY public.observation.id;


--
-- Name: observation_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.observation_type (
    id bigint NOT NULL,
    observation_id bigint NOT NULL,
    observation_type character varying(100) NOT NULL
);


ALTER TABLE public.observation_type OWNER TO postgres;

--
-- Name: observer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.observer (
    id integer NOT NULL,
    name character varying(100),
    description character varying(100),
    metadata character varying(100),
    link character varying(100),
    location public.geometry(Point,4326)
);


ALTER TABLE public.observer OWNER TO postgres;

--
-- Name: observer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.observer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.observer_id_seq OWNER TO postgres;

--
-- Name: observer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.observer_id_seq OWNED BY public.observer.id;


--
-- Name: preparation_procedure; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.preparation_procedure (
    id integer NOT NULL,
    name character varying(100),
    description character varying(100),
    metadata character varying(100),
    link character varying(100)
);


ALTER TABLE public.preparation_procedure OWNER TO postgres;

--
-- Name: preparation_procedure_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.preparation_procedure_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.preparation_procedure_id_seq OWNER TO postgres;

--
-- Name: preparation_procedure_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.preparation_procedure_id_seq OWNED BY public.preparation_procedure.id;


--
-- Name: preparation_step; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.preparation_step (
    id integer NOT NULL,
    name character varying(100),
    description character varying(100),
    metadata character varying(100),
    link character varying(100),
    "time" timestamp with time zone,
    sample integer NOT NULL
);


ALTER TABLE public.preparation_step OWNER TO postgres;

--
-- Name: preparation_step_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.preparation_step_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.preparation_step_id_seq OWNER TO postgres;

--
-- Name: preparation_step_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.preparation_step_id_seq OWNED BY public.preparation_step.id;


--
-- Name: result_val; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.result_val (
    id integer NOT NULL,
    name character varying(100),
    description character varying(100),
    metadata character varying(100),
    result_type smallint,
    result_number double precision,
    result_string text,
    result_json text,
    result_boolean boolean,
    obs integer NOT NULL
);


ALTER TABLE public.result_val OWNER TO postgres;

--
-- Name: result_val_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.result_val_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.result_val_id_seq OWNER TO postgres;

--
-- Name: result_val_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.result_val_id_seq OWNED BY public.result_val.id;


--
-- Name: sample_collection; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sample_collection (
    id integer NOT NULL,
    name character varying(100),
    description character varying(100),
    metadata character varying(100)
);


ALTER TABLE public.sample_collection OWNER TO postgres;

--
-- Name: sample_collection_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sample_collection_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sample_collection_id_seq OWNER TO postgres;

--
-- Name: sample_collection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sample_collection_id_seq OWNED BY public.sample_collection.id;


--
-- Name: sampler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sampler (
    id integer NOT NULL,
    name character varying(100),
    description character varying(100),
    metadata character varying(100),
    sampler_type character varying(100),
    link character varying(100)
);


ALTER TABLE public.sampler OWNER TO postgres;

--
-- Name: sampler_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sampler_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sampler_id_seq OWNER TO postgres;

--
-- Name: sampler_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sampler_id_seq OWNED BY public.sampler.id;


--
-- Name: sampling; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sampling (
    id integer NOT NULL,
    name character varying(100),
    description character varying(100),
    metadata character varying(100),
    sampling_location public.geometry(Point,4326),
    time_start timestamp with time zone,
    time_end timestamp with time zone,
    link character varying(100),
    parameter jsonb
);


ALTER TABLE public.sampling OWNER TO postgres;

--
-- Name: sampling_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sampling_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sampling_id_seq OWNER TO postgres;

--
-- Name: sampling_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sampling_id_seq OWNED BY public.sampling.id;


--
-- Name: sampling_procedure; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sampling_procedure (
    id integer NOT NULL,
    name character varying(100),
    description character varying(100),
    metadata character varying(100),
    link character varying(100)
);


ALTER TABLE public.sampling_procedure OWNER TO postgres;

--
-- Name: sampling_procedure_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sampling_procedure_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sampling_procedure_id_seq OWNER TO postgres;

--
-- Name: sampling_procedure_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sampling_procedure_id_seq OWNED BY public.sampling_procedure.id;


--
-- Name: deployment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deployment ALTER COLUMN id SET DEFAULT nextval('public.deployment_id_seq'::regclass);


--
-- Name: foi_sample id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.foi_sample ALTER COLUMN id SET DEFAULT nextval('public.foi_id_seq'::regclass);


--
-- Name: host id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.host ALTER COLUMN id SET DEFAULT nextval('public.host_id_seq'::regclass);


--
-- Name: obs_procedure id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.obs_procedure ALTER COLUMN id SET DEFAULT nextval('public.obs_procedure_id_seq'::regclass);


--
-- Name: obs_prop id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.obs_prop ALTER COLUMN id SET DEFAULT nextval('public.obs_prop_id_seq'::regclass);


--
-- Name: observation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.observation ALTER COLUMN id SET DEFAULT nextval('public.observation_id_seq'::regclass);


--
-- Name: observation_collection id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.observation_collection ALTER COLUMN id SET DEFAULT nextval('public.observation_collection_id_seq'::regclass);


--
-- Name: observer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.observer ALTER COLUMN id SET DEFAULT nextval('public.observer_id_seq'::regclass);


--
-- Name: preparation_procedure id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.preparation_procedure ALTER COLUMN id SET DEFAULT nextval('public.preparation_procedure_id_seq'::regclass);


--
-- Name: preparation_step id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.preparation_step ALTER COLUMN id SET DEFAULT nextval('public.preparation_step_id_seq'::regclass);


--
-- Name: result_val id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.result_val ALTER COLUMN id SET DEFAULT nextval('public.result_val_id_seq'::regclass);


--
-- Name: sample_collection id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sample_collection ALTER COLUMN id SET DEFAULT nextval('public.sample_collection_id_seq'::regclass);


--
-- Name: sampler id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sampler ALTER COLUMN id SET DEFAULT nextval('public.sampler_id_seq'::regclass);


--
-- Name: sampling id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sampling ALTER COLUMN id SET DEFAULT nextval('public.sampling_id_seq'::regclass);


--
-- Name: sampling_procedure id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sampling_procedure ALTER COLUMN id SET DEFAULT nextval('public.sampling_procedure_id_seq'::regclass);


--
-- Name: deployment deployment_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deployment
    ADD CONSTRAINT deployment_pk PRIMARY KEY (id);


--
-- Name: foi_sample foi_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.foi_sample
    ADD CONSTRAINT foi_pk PRIMARY KEY (id);


--
-- Name: host host_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.host
    ADD CONSTRAINT host_pk PRIMARY KEY (id);


--
-- Name: obs_procedure obs_procedure_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.obs_procedure
    ADD CONSTRAINT obs_procedure_pk PRIMARY KEY (id);


--
-- Name: obs_prop obs_prop_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.obs_prop
    ADD CONSTRAINT obs_prop_pk PRIMARY KEY (id);


--
-- Name: ass_observation_collection_observation observation_collection_observation_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ass_observation_collection_observation
    ADD CONSTRAINT observation_collection_observation_pk PRIMARY KEY (observation_collection_id, observation_id);


--
-- Name: observation_collection observation_collection_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.observation_collection
    ADD CONSTRAINT observation_collection_pk PRIMARY KEY (id);


--
-- Name: ass_observation_deployment observation_deployment_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ass_observation_deployment
    ADD CONSTRAINT observation_deployment_pk PRIMARY KEY (observation_id, deployment_id);


--
-- Name: ass_observation_host observation_host_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ass_observation_host
    ADD CONSTRAINT observation_host_pk PRIMARY KEY (observation_id, host_id);


--
-- Name: ass_observation_observer observation_observer_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ass_observation_observer
    ADD CONSTRAINT observation_observer_pk PRIMARY KEY (observation_id, observer_id);


--
-- Name: observation observation_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.observation
    ADD CONSTRAINT observation_pk PRIMARY KEY (id);


--
-- Name: observation_type observation_type_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.observation_type
    ADD CONSTRAINT observation_type_pk PRIMARY KEY (id);


--
-- Name: observer observer_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.observer
    ADD CONSTRAINT observer_pk PRIMARY KEY (id);


--
-- Name: preparation_procedure preparation_procedure_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.preparation_procedure
    ADD CONSTRAINT preparation_procedure_pk PRIMARY KEY (id);


--
-- Name: ass_preparation_procedure_preparation_step preparation_procedure_preparation_step_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ass_preparation_procedure_preparation_step
    ADD CONSTRAINT preparation_procedure_preparation_step_pk PRIMARY KEY (preparation_procedure_id, preparation_step_id);


--
-- Name: preparation_step preparation_step_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.preparation_step
    ADD CONSTRAINT preparation_step_pk PRIMARY KEY (id);


--
-- Name: ass_related_observation_collection related_observation_collection_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ass_related_observation_collection
    ADD CONSTRAINT related_observation_collection_pkey PRIMARY KEY (observation_collection_id, related_observation_collection_id);


--
-- Name: ass_related_observation related_observation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ass_related_observation
    ADD CONSTRAINT related_observation_pkey PRIMARY KEY (observation_id, related_observation_id);


--
-- Name: ass_related_sample_collection related_sample_collection_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ass_related_sample_collection
    ADD CONSTRAINT related_sample_collection_pkey PRIMARY KEY (sample_collection_id, related_sample_collection_id);


--
-- Name: ass_related_sample related_sample_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ass_related_sample
    ADD CONSTRAINT related_sample_pkey PRIMARY KEY (sample_id, related_sample_id);


--
-- Name: ass_related_sampling related_sampling_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ass_related_sampling
    ADD CONSTRAINT related_sampling_pkey PRIMARY KEY (sampling_id, related_sampling_id);


--
-- Name: result_val result_val_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.result_val
    ADD CONSTRAINT result_val_pk PRIMARY KEY (id);


--
-- Name: sample_collection sample_collection_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sample_collection
    ADD CONSTRAINT sample_collection_pk PRIMARY KEY (id);


--
-- Name: ass_sample_collection_sample sample_collection_sample_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ass_sample_collection_sample
    ADD CONSTRAINT sample_collection_sample_pk PRIMARY KEY (sample_collection_id, sample_id);


--
-- Name: ass_sample_sampling sample_sampling_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ass_sample_sampling
    ADD CONSTRAINT sample_sampling_pk PRIMARY KEY (sample_id, sampling_id);


--
-- Name: sampler sampler_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sampler
    ADD CONSTRAINT sampler_pk PRIMARY KEY (id);


--
-- Name: ass_sampler_sampling sampler_sampling_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ass_sampler_sampling
    ADD CONSTRAINT sampler_sampling_pk PRIMARY KEY (sampler_id, sampling_id);


--
-- Name: sampling sampling_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sampling
    ADD CONSTRAINT sampling_pk PRIMARY KEY (id);


--
-- Name: sampling_procedure sampling_procedure_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sampling_procedure
    ADD CONSTRAINT sampling_procedure_pk PRIMARY KEY (id);


--
-- Name: ass_sampling_procedure_sampler sampling_procedure_sampler_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ass_sampling_procedure_sampler
    ADD CONSTRAINT sampling_procedure_sampler_pk PRIMARY KEY (sampling_procedure_id, sampler_id);


--
-- Name: ass_sampling_procedure_sampling sampling_procedure_sampling_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ass_sampling_procedure_sampling
    ADD CONSTRAINT sampling_procedure_sampling_pk PRIMARY KEY (sampling_procedure_id, sampling_id);


--
-- Name: ass_sampling_sample sampling_sample_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ass_sampling_sample
    ADD CONSTRAINT sampling_sample_pk PRIMARY KEY (sample_id, sampling_id);


--
-- Name: deployment deployment_host_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deployment
    ADD CONSTRAINT deployment_host_fkey FOREIGN KEY (host) REFERENCES public.host(id);


--
-- Name: deployment deployment_observer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deployment
    ADD CONSTRAINT deployment_observer_fkey FOREIGN KEY (observer) REFERENCES public.observer(id);


--
-- Name: observation_collection observation_collection_host_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.observation_collection
    ADD CONSTRAINT observation_collection_host_fkey FOREIGN KEY (host) REFERENCES public.host(id);


--
-- Name: ass_observation_collection_observation observation_collection_observation_observation_collection_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ass_observation_collection_observation
    ADD CONSTRAINT observation_collection_observation_observation_collection_id_fk FOREIGN KEY (observation_collection_id) REFERENCES public.observation_collection(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ass_observation_collection_observation observation_collection_observation_observation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ass_observation_collection_observation
    ADD CONSTRAINT observation_collection_observation_observation_id_fkey FOREIGN KEY (observation_id) REFERENCES public.observation(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: observation_collection observation_collection_observed_property_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.observation_collection
    ADD CONSTRAINT observation_collection_observed_property_fkey FOREIGN KEY (observed_property) REFERENCES public.obs_prop(id);


--
-- Name: observation_collection observation_collection_observer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.observation_collection
    ADD CONSTRAINT observation_collection_observer_fkey FOREIGN KEY (observer) REFERENCES public.observer(id);


--
-- Name: observation_collection observation_collection_observing_procedure_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.observation_collection
    ADD CONSTRAINT observation_collection_observing_procedure_fkey FOREIGN KEY (observing_procedure) REFERENCES public.obs_procedure(id);


--
-- Name: observation_collection observation_collection_pfoi_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.observation_collection
    ADD CONSTRAINT observation_collection_pfoi_fkey FOREIGN KEY (pfoi) REFERENCES public.foi_sample(id);


--
-- Name: observation_collection observation_collection_result_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.observation_collection
    ADD CONSTRAINT observation_collection_result_fkey FOREIGN KEY (result) REFERENCES public.result_val(id);


--
-- Name: observation_collection observation_collection_ufoi_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.observation_collection
    ADD CONSTRAINT observation_collection_ufoi_fkey FOREIGN KEY (ufoi) REFERENCES public.foi_sample(id);


--
-- Name: ass_observation_deployment observation_deployment_deployment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ass_observation_deployment
    ADD CONSTRAINT observation_deployment_deployment_id_fkey FOREIGN KEY (deployment_id) REFERENCES public.deployment(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ass_observation_deployment observation_deployment_observation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ass_observation_deployment
    ADD CONSTRAINT observation_deployment_observation_id_fkey FOREIGN KEY (observation_id) REFERENCES public.observation(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: observation_type observation_deployment_observation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.observation_type
    ADD CONSTRAINT observation_deployment_observation_id_fkey FOREIGN KEY (observation_id) REFERENCES public.observation(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: observation observation_foi_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.observation
    ADD CONSTRAINT observation_foi_fkey FOREIGN KEY (foi) REFERENCES public.foi_sample(id);


--
-- Name: ass_observation_host observation_host_host_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ass_observation_host
    ADD CONSTRAINT observation_host_host_id_fkey FOREIGN KEY (host_id) REFERENCES public.host(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ass_observation_host observation_host_observation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ass_observation_host
    ADD CONSTRAINT observation_host_observation_id_fkey FOREIGN KEY (observation_id) REFERENCES public.observation(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: observation observation_obs_procedure_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.observation
    ADD CONSTRAINT observation_obs_procedure_fkey FOREIGN KEY (obs_procedure) REFERENCES public.obs_procedure(id);


--
-- Name: observation observation_obs_prop_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.observation
    ADD CONSTRAINT observation_obs_prop_fkey FOREIGN KEY (obs_prop) REFERENCES public.obs_prop(id);


--
-- Name: ass_observation_observer observation_observer_observation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ass_observation_observer
    ADD CONSTRAINT observation_observer_observation_id_fkey FOREIGN KEY (observation_id) REFERENCES public.observation(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ass_observation_observer observation_observer_observer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ass_observation_observer
    ADD CONSTRAINT observation_observer_observer_id_fkey FOREIGN KEY (observer_id) REFERENCES public.observer(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: observation observation_pfoi_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.observation
    ADD CONSTRAINT observation_pfoi_fk FOREIGN KEY (pfoi) REFERENCES public.foi_sample(id);


--
-- Name: observation observation_ufoi_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.observation
    ADD CONSTRAINT observation_ufoi_fk FOREIGN KEY (ufoi) REFERENCES public.foi_sample(id);


--
-- Name: ass_preparation_procedure_preparation_step preparation_procedure_preparation_step_preparation_procedure_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ass_preparation_procedure_preparation_step
    ADD CONSTRAINT preparation_procedure_preparation_step_preparation_procedure_id FOREIGN KEY (preparation_procedure_id) REFERENCES public.preparation_procedure(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ass_preparation_procedure_preparation_step preparation_procedure_preparation_step_preparation_step_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ass_preparation_procedure_preparation_step
    ADD CONSTRAINT preparation_procedure_preparation_step_preparation_step_id_fkey FOREIGN KEY (preparation_step_id) REFERENCES public.preparation_step(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: preparation_step preparation_step_sample_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.preparation_step
    ADD CONSTRAINT preparation_step_sample_fkey FOREIGN KEY (sample) REFERENCES public.foi_sample(id);


--
-- Name: ass_related_observation_collection related_observation_observation_collection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ass_related_observation_collection
    ADD CONSTRAINT related_observation_observation_collection_id_fkey FOREIGN KEY (observation_collection_id) REFERENCES public.observation_collection(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ass_related_observation related_observation_observation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ass_related_observation
    ADD CONSTRAINT related_observation_observation_id_fkey FOREIGN KEY (observation_id) REFERENCES public.observation(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ass_related_observation_collection related_observation_related_observation_collection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ass_related_observation_collection
    ADD CONSTRAINT related_observation_related_observation_collection_id_fkey FOREIGN KEY (related_observation_collection_id) REFERENCES public.observation_collection(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ass_related_observation related_observation_related_observation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ass_related_observation
    ADD CONSTRAINT related_observation_related_observation_id_fkey FOREIGN KEY (related_observation_id) REFERENCES public.observation(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ass_related_sample_collection related_sample_related_sample_collection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ass_related_sample_collection
    ADD CONSTRAINT related_sample_related_sample_collection_id_fkey FOREIGN KEY (related_sample_collection_id) REFERENCES public.sample_collection(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ass_related_sample related_sample_related_sampling_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ass_related_sample
    ADD CONSTRAINT related_sample_related_sampling_id_fkey FOREIGN KEY (related_sample_id) REFERENCES public.foi_sample(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ass_related_sample_collection related_sample_sample_collection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ass_related_sample_collection
    ADD CONSTRAINT related_sample_sample_collection_id_fkey FOREIGN KEY (sample_collection_id) REFERENCES public.sample_collection(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ass_related_sample related_sample_sampling_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ass_related_sample
    ADD CONSTRAINT related_sample_sampling_id_fkey FOREIGN KEY (sample_id) REFERENCES public.foi_sample(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ass_related_sampling related_sampling_related_sampling_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ass_related_sampling
    ADD CONSTRAINT related_sampling_related_sampling_id_fkey FOREIGN KEY (related_sampling_id) REFERENCES public.sampling(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ass_related_sampling related_sampling_sampling_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ass_related_sampling
    ADD CONSTRAINT related_sampling_sampling_id_fkey FOREIGN KEY (sampling_id) REFERENCES public.sampling(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: result_val result_val_obs_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.result_val
    ADD CONSTRAINT result_val_obs_fkey FOREIGN KEY (obs) REFERENCES public.observation(id);


--
-- Name: ass_sample_collection_sample sample_collection_sample_sample_collection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ass_sample_collection_sample
    ADD CONSTRAINT sample_collection_sample_sample_collection_id_fkey FOREIGN KEY (sample_collection_id) REFERENCES public.sample_collection(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ass_sample_collection_sample sample_collection_sample_sample_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ass_sample_collection_sample
    ADD CONSTRAINT sample_collection_sample_sample_id_fkey FOREIGN KEY (sample_id) REFERENCES public.foi_sample(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ass_sample_sampling sample_sampling_sample_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ass_sample_sampling
    ADD CONSTRAINT sample_sampling_sample_id_fkey FOREIGN KEY (sample_id) REFERENCES public.foi_sample(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ass_sample_sampling sample_sampling_sampling_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ass_sample_sampling
    ADD CONSTRAINT sample_sampling_sampling_id_fkey FOREIGN KEY (sampling_id) REFERENCES public.sampling(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ass_sampler_sampling sampler_sampling_sample_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ass_sampler_sampling
    ADD CONSTRAINT sampler_sampling_sample_id_fkey FOREIGN KEY (sampler_id) REFERENCES public.sampler(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ass_sampler_sampling sampler_sampling_sampling_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ass_sampler_sampling
    ADD CONSTRAINT sampler_sampling_sampling_id_fkey FOREIGN KEY (sampling_id) REFERENCES public.sampling(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ass_sampling_procedure_sampler sampling_procedure_sampler_sampler_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ass_sampling_procedure_sampler
    ADD CONSTRAINT sampling_procedure_sampler_sampler_id_fkey FOREIGN KEY (sampler_id) REFERENCES public.sampler(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ass_sampling_procedure_sampler sampling_procedure_sampler_sampling_procedure_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ass_sampling_procedure_sampler
    ADD CONSTRAINT sampling_procedure_sampler_sampling_procedure_id_fkey FOREIGN KEY (sampling_procedure_id) REFERENCES public.sampling_procedure(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ass_sampling_procedure_sampling sampling_procedure_sampling_sampling_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ass_sampling_procedure_sampling
    ADD CONSTRAINT sampling_procedure_sampling_sampling_id_fkey FOREIGN KEY (sampling_id) REFERENCES public.sampling(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ass_sampling_procedure_sampling sampling_procedure_sampling_sampling_procedure_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ass_sampling_procedure_sampling
    ADD CONSTRAINT sampling_procedure_sampling_sampling_procedure_id_fkey FOREIGN KEY (sampling_procedure_id) REFERENCES public.sampling_procedure(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ass_sampling_sample sampling_sample_sample_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ass_sampling_sample
    ADD CONSTRAINT sampling_sample_sample_id_fkey FOREIGN KEY (sample_id) REFERENCES public.foi_sample(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ass_sampling_sample sampling_sample_sampling_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ass_sampling_sample
    ADD CONSTRAINT sampling_sample_sampling_id_fkey FOREIGN KEY (sampling_id) REFERENCES public.sampling(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

