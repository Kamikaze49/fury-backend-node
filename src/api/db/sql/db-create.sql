-- SQL DDL statements go here

-- This is an internal table for migration
CREATE TABLE public.DB_VERSION (
    VERSION numeric NOT NULL,
    ID smallint NOT NULL
);

ALTER TABLE public.DB_VERSION OWNER TO postgres;

CREATE SEQUENCE public.DB_VERSION_ID_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.DB_VERSION_ID_seq OWNER TO postgres;

ALTER SEQUENCE public.DB_VERSION_ID_seq OWNED BY public.DB_VERSION.ID;

ALTER TABLE ONLY public.DB_VERSION ALTER COLUMN ID SET DEFAULT nextval('public.DB_VERSION_ID_seq'::regclass);

ALTER TABLE ONLY public.DB_VERSION
    ADD CONSTRAINT DB_VERSION_pkey PRIMARY KEY (ID);
