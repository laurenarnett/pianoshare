

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


SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE public.users DISABLE TRIGGER ALL;

INSERT INTO public.users (id, username, city, created_at, email, password_hash, locked_at, failed_login_attempts) VALUES ('0d754cbc-0912-4df0-ad39-87b4486e67cb', 'larnett', 'nyc', '2021-02-22 12:07:05.474543-05', 'lauren.arnett1@gmail.com', 'sha256|17|maT2ZFjdBCYaCdDu+hrv0A==|CmLpWOfqgv2mQfxNauWOkQWVuw70WfpgGgoJzf9KLMs=', NULL, 0);


ALTER TABLE public.users ENABLE TRIGGER ALL;


ALTER TABLE public.spaces DISABLE TRIGGER ALL;



ALTER TABLE public.spaces ENABLE TRIGGER ALL;


ALTER TABLE public.reservations DISABLE TRIGGER ALL;



ALTER TABLE public.reservations ENABLE TRIGGER ALL;


