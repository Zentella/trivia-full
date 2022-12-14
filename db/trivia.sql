-- This script was generated by a beta version of the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public.games
(
    id integer NOT NULL DEFAULT nextval('games_id_seq'::regclass),
    score integer NOT NULL,
    percentage double precision NOT NULL,
    user_id integer NOT NULL,
    date timestamp without time zone DEFAULT now(),
    CONSTRAINT games_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.questions
(
    id integer NOT NULL DEFAULT nextval('questions_id_seq'::regclass),
    question character varying(255) COLLATE pg_catalog."default" NOT NULL,
    answer_true character varying(255) COLLATE pg_catalog."default" NOT NULL,
    answer_false1 character varying(255) COLLATE pg_catalog."default" NOT NULL,
    answer_false2 character varying(255) COLLATE pg_catalog."default" NOT NULL,
    answer_false3 character varying(255) COLLATE pg_catalog."default",
    answer_false4 character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT questions_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.session
(
    sid character varying COLLATE pg_catalog."default" NOT NULL,
    sess json NOT NULL,
    expire timestamp(6) without time zone NOT NULL,
    CONSTRAINT session_pkey PRIMARY KEY (sid)
);

CREATE TABLE IF NOT EXISTS public.users
(
    id integer NOT NULL DEFAULT nextval('users_id_seq'::regclass),
    name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    email character varying(255) COLLATE pg_catalog."default" NOT NULL,
    password character varying(255) COLLATE pg_catalog."default" NOT NULL,
    is_admin boolean NOT NULL DEFAULT false,
    CONSTRAINT users_pkey PRIMARY KEY (id),
    CONSTRAINT users_email_key UNIQUE (email)
);

ALTER TABLE IF EXISTS public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id)
    REFERENCES public.users (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

END;