--
-- PostgreSQL database dump
--

-- Dumped from database version 13.14
-- Dumped by pg_dump version 13.14

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
-- Name: pharmaceuticaldb_schema; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA pharmaceuticaldb_schema;


ALTER SCHEMA pharmaceuticaldb_schema OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: climatedimension; Type: TABLE; Schema: pharmaceuticaldb_schema; Owner: postgres
--

CREATE TABLE pharmaceuticaldb_schema.climatedimension (
    climateid integer NOT NULL,
    tg integer,
    rr integer,
    cc integer,
    weather character varying(55)
);


ALTER TABLE pharmaceuticaldb_schema.climatedimension OWNER TO postgres;

--
-- Name: dailypharmaceuticalsalesfact; Type: TABLE; Schema: pharmaceuticaldb_schema; Owner: postgres
--

CREATE TABLE pharmaceuticaldb_schema.dailypharmaceuticalsalesfact (
    climateid integer NOT NULL,
    date date NOT NULL,
    drugcategoryid integer NOT NULL,
    quantitysold double precision
);


ALTER TABLE pharmaceuticaldb_schema.dailypharmaceuticalsalesfact OWNER TO postgres;

--
-- Name: datedimension; Type: TABLE; Schema: pharmaceuticaldb_schema; Owner: postgres
--

CREATE TABLE pharmaceuticaldb_schema.datedimension (
    date date NOT NULL,
    season character varying(50),
    year integer,
    day integer,
    month integer,
    monthshortname character varying(3),
    monthfullname character varying(50),
    CONSTRAINT datedimension_day_check CHECK (((day >= 1) AND (day <= 31))),
    CONSTRAINT datedimension_month_check CHECK (((month >= 1) AND (month <= 12)))
);


ALTER TABLE pharmaceuticaldb_schema.datedimension OWNER TO postgres;

--
-- Name: drugcategorydimension; Type: TABLE; Schema: pharmaceuticaldb_schema; Owner: postgres
--

CREATE TABLE pharmaceuticaldb_schema.drugcategorydimension (
    drugcategoryid integer NOT NULL,
    drugcategory character varying(50),
    description character varying(255),
    exampledrus character varying(255),
    use character varying(255)
);


ALTER TABLE pharmaceuticaldb_schema.drugcategorydimension OWNER TO postgres;

--
-- Name: climatedimension climatedimension_pkey; Type: CONSTRAINT; Schema: pharmaceuticaldb_schema; Owner: postgres
--

ALTER TABLE ONLY pharmaceuticaldb_schema.climatedimension
    ADD CONSTRAINT climatedimension_pkey PRIMARY KEY (climateid);


--
-- Name: dailypharmaceuticalsalesfact dailypharmaceuticalsalesfact_pkey; Type: CONSTRAINT; Schema: pharmaceuticaldb_schema; Owner: postgres
--

ALTER TABLE ONLY pharmaceuticaldb_schema.dailypharmaceuticalsalesfact
    ADD CONSTRAINT dailypharmaceuticalsalesfact_pkey PRIMARY KEY (climateid, date, drugcategoryid);


--
-- Name: datedimension datedimension_pkey; Type: CONSTRAINT; Schema: pharmaceuticaldb_schema; Owner: postgres
--

ALTER TABLE ONLY pharmaceuticaldb_schema.datedimension
    ADD CONSTRAINT datedimension_pkey PRIMARY KEY (date);


--
-- Name: drugcategorydimension drugcategorydimension_pkey; Type: CONSTRAINT; Schema: pharmaceuticaldb_schema; Owner: postgres
--

ALTER TABLE ONLY pharmaceuticaldb_schema.drugcategorydimension
    ADD CONSTRAINT drugcategorydimension_pkey PRIMARY KEY (drugcategoryid);


--
-- Name: dailypharmaceuticalsalesfact dailypharmaceuticalsalesfact_date_fkey; Type: FK CONSTRAINT; Schema: pharmaceuticaldb_schema; Owner: postgres
--

ALTER TABLE ONLY pharmaceuticaldb_schema.dailypharmaceuticalsalesfact
    ADD CONSTRAINT dailypharmaceuticalsalesfact_date_fkey FOREIGN KEY (date) REFERENCES pharmaceuticaldb_schema.datedimension(date);


--
-- PostgreSQL database dump complete
--

