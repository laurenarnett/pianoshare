

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

INSERT INTO public.users (id, username, city, created_at, email, password_hash, locked_at, failed_login_attempts) VALUES ('0ebbe04f-359b-4c58-8a57-8391016df3c0', 'another', 'blah', '2021-03-01 22:07:29.173564-05', 'blah@blah.com', 'sha256|17|rvwnRwIV2UbUH1MdWa9dyQ==|Rq6FXd1qCaPaYhN9UKHZJ3jk3hP82F/dKtpQwazaqcA=', NULL, 0);
INSERT INTO public.users (id, username, city, created_at, email, password_hash, locked_at, failed_login_attempts) VALUES ('e064a8a3-cb63-4847-85d4-c7b7354872d2', 'a', 'a', '2021-03-01 22:10:01.612417-05', 'a@a.com', 'sha256|17|rdW3BazJAqPeVspmwtYoxg==|aUOijU89jAUv6PzXZcZK77HD1vTN/ISMdfqYnWa9ivc=', NULL, 0);
INSERT INTO public.users (id, username, city, created_at, email, password_hash, locked_at, failed_login_attempts) VALUES ('d24d8266-2314-4d1a-a332-bbb7693d6d0c', 'b', 'b', '2021-03-01 22:10:20.839384-05', 'b@b.com', 'sha256|17|mbnDhA9tSsBXZFxGKcbDUQ==|91+F4A3r5vSWvvhx4fuYGNy2u1C/bIh2f+tWj+gajsk=', NULL, 0);
INSERT INTO public.users (id, username, city, created_at, email, password_hash, locked_at, failed_login_attempts) VALUES ('ec690ba8-42ff-4580-b4f7-348a83bb69ec', 'c', 'c', '2021-03-01 23:22:41.867815-05', 'c@c.com', 'sha256|17|lODMf9WKkOq300e4Bb+8Ug==|nQaxTIdAZfoyEdnYqROXU4pWb777NNI2tV/I5/PHoVI=', NULL, 0);
INSERT INTO public.users (id, username, city, created_at, email, password_hash, locked_at, failed_login_attempts) VALUES ('6e7d50b7-1d15-4e7d-bcd5-bb9c6fe04d01', 'larnett', 'New York', '2021-03-01 22:02:37.921374-05', 'lauren.arnett1@gmail.com', 'sha256|17|OY0cfMGSgJsdzr898eHLBA==|qs0TF3yx4hRK1Ge7a4qqaf50q+WdnOxf3cp6KuzAurA=', NULL, 0);


ALTER TABLE public.users ENABLE TRIGGER ALL;


ALTER TABLE public.spaces DISABLE TRIGGER ALL;



ALTER TABLE public.spaces ENABLE TRIGGER ALL;


ALTER TABLE public.reservations DISABLE TRIGGER ALL;



ALTER TABLE public.reservations ENABLE TRIGGER ALL;


ALTER TABLE public.reviews DISABLE TRIGGER ALL;



ALTER TABLE public.reviews ENABLE TRIGGER ALL;


