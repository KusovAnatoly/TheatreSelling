--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0 (Debian 16.0-1.pgdg120+1)
-- Dumped by pg_dump version 16.0 (Debian 16.0-1.pgdg120+1)

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
-- Name: building; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.building (
    building_id integer NOT NULL,
    title character varying(500) NOT NULL,
    address character varying(1000) NOT NULL,
    manager_id integer NOT NULL
);


ALTER TABLE public.building OWNER TO postgres;

--
-- Name: building_building_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.building ALTER COLUMN building_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.building_building_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    employee_id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    middle_name character varying(100),
    last_name character varying(100) NOT NULL,
    sex_id integer NOT NULL,
    position_id integer NOT NULL,
    email_address character varying(320),
    phone_number character(10)
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- Name: employee_employee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.employee ALTER COLUMN employee_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.employee_employee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: event; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event (
    event_id integer NOT NULL,
    date timestamp with time zone NOT NULL,
    description character varying(2000),
    house_id integer NOT NULL,
    play_id integer NOT NULL
);


ALTER TABLE public.event OWNER TO postgres;

--
-- Name: event_event_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.event ALTER COLUMN event_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.event_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: house; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.house (
    house_id integer NOT NULL,
    building_id integer NOT NULL,
    title character varying(200) NOT NULL
);


ALTER TABLE public.house OWNER TO postgres;

--
-- Name: house_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.house_details (
    house_details_id integer NOT NULL,
    house_id integer NOT NULL,
    area_title character varying(200) NOT NULL,
    number_of_rows integer NOT NULL,
    number_of_places integer NOT NULL,
    price_policy_id integer NOT NULL
);


ALTER TABLE public.house_details OWNER TO postgres;

--
-- Name: house_details_house_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.house_details ALTER COLUMN house_details_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.house_details_house_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: house_house_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.house ALTER COLUMN house_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.house_house_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment (
    payment_id integer NOT NULL,
    date timestamp with time zone DEFAULT now() NOT NULL,
    ticket_id integer NOT NULL,
    amount numeric(12,2) NOT NULL,
    payment_type_id integer NOT NULL
);


ALTER TABLE public.payment OWNER TO postgres;

--
-- Name: payment_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.payment ALTER COLUMN payment_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.payment_payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: payment_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_type (
    payment_type_id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.payment_type OWNER TO postgres;

--
-- Name: payment_type_payment_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.payment_type ALTER COLUMN payment_type_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.payment_type_payment_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: play; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.play (
    play_id integer NOT NULL,
    director_id integer NOT NULL,
    manager_id integer NOT NULL,
    writer_id integer NOT NULL,
    author character varying(500) NOT NULL,
    "cast" json NOT NULL,
    title character varying(1000) NOT NULL
);


ALTER TABLE public.play OWNER TO postgres;

--
-- Name: play_play_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.play ALTER COLUMN play_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.play_play_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: position; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."position" (
    position_id integer NOT NULL,
    title character varying(150) NOT NULL
);


ALTER TABLE public."position" OWNER TO postgres;

--
-- Name: position_position_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."position" ALTER COLUMN position_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.position_position_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: price_policy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.price_policy (
    price_policy_id integer NOT NULL,
    title character varying(100) NOT NULL,
    price numeric(12,2) NOT NULL
);


ALTER TABLE public.price_policy OWNER TO postgres;

--
-- Name: price_policy_price_policy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.price_policy ALTER COLUMN price_policy_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.price_policy_price_policy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: sex; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sex (
    sex_id integer NOT NULL,
    name character varying(15) NOT NULL
);


ALTER TABLE public.sex OWNER TO postgres;

--
-- Name: sex_sex_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.sex ALTER COLUMN sex_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.sex_sex_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: ticket; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ticket (
    ticket_id integer NOT NULL,
    event_id integer NOT NULL,
    cashier_id integer NOT NULL,
    customer_name character varying(500) NOT NULL,
    customer_email character varying(320) NOT NULL,
    customer_phone character(10)
);


ALTER TABLE public.ticket OWNER TO postgres;

--
-- Name: ticket_ticket_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.ticket ALTER COLUMN ticket_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.ticket_ticket_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: building; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.building OVERRIDING SYSTEM VALUE VALUES (1, 'Речной театр', 'г. Красногорск, улица Речная, дом 5', 2);
INSERT INTO public.building OVERRIDING SYSTEM VALUE VALUES (2, 'Ильинский театр', 'г. Красногорск, Ильинское шоссе, дом 3', 13);


--
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.employee OVERRIDING SYSTEM VALUE VALUES (1, 'Malynda', 'Lorens', 'McDermid', 2, 5, 'lmcdermid0@surveymonkey.com', '6199929046');
INSERT INTO public.employee OVERRIDING SYSTEM VALUE VALUES (3, 'Carey', 'Osbert', 'Alpin', 2, 5, 'oalpin2@reference.com', '5416999614');
INSERT INTO public.employee OVERRIDING SYSTEM VALUE VALUES (4, 'Windham', 'Brendan', 'Papachristophorou', 1, 2, 'bpapachristophorou3@list-manage.com', '1721669453');
INSERT INTO public.employee OVERRIDING SYSTEM VALUE VALUES (5, 'Holly-anne', 'Rafe', 'Deyenhardt', 2, 5, 'rdeyenhardt4@ucoz.com', '4002906822');
INSERT INTO public.employee OVERRIDING SYSTEM VALUE VALUES (6, 'Andras', 'Werner', 'Janatka', 1, 4, 'wjanatka5@yahoo.com', '5796275340');
INSERT INTO public.employee OVERRIDING SYSTEM VALUE VALUES (7, 'Pate', 'Adolphe', 'Vescovini', 2, 1, 'avescovini6@mlb.com', '3333548604');
INSERT INTO public.employee OVERRIDING SYSTEM VALUE VALUES (8, 'Shandeigh', 'Alvin', 'Oxford', 1, 1, 'aoxford7@ebay.com', '2427354744');
INSERT INTO public.employee OVERRIDING SYSTEM VALUE VALUES (9, 'Consuelo', 'Chase', 'Dumbell', 2, 1, 'cdumbell8@qq.com', '3686312494');
INSERT INTO public.employee OVERRIDING SYSTEM VALUE VALUES (10, 'Freddy', 'Tadd', 'Banker', 1, 4, 'tbanker9@elegantthemes.com', '6823248297');
INSERT INTO public.employee OVERRIDING SYSTEM VALUE VALUES (11, 'Janina', 'Tab', 'Verheijden', 2, 5, 'tverheijdena@alexa.com', '9488439413');
INSERT INTO public.employee OVERRIDING SYSTEM VALUE VALUES (12, 'Jacquetta', 'Orion', 'Bazoche', 1, 1, 'obazocheb@webs.com', '2551387331');
INSERT INTO public.employee OVERRIDING SYSTEM VALUE VALUES (13, 'Wayland', 'Patton', 'Fearnley', 1, 3, 'pfearnleyc@craigslist.org', '3979906024');
INSERT INTO public.employee OVERRIDING SYSTEM VALUE VALUES (14, 'Ethelbert', 'Erl', 'Casolla', 1, 1, 'ecasollad@dell.com', '9962363781');
INSERT INTO public.employee OVERRIDING SYSTEM VALUE VALUES (15, 'Rochester', 'Barrett', 'De Francisci', 2, 3, 'bdefranciscie@oaic.gov.au', '9131018189');
INSERT INTO public.employee OVERRIDING SYSTEM VALUE VALUES (2, 'Anstice', 'Brandyn', 'Chaplin', 1, 3, 'bchaplin1@jigsy.com', '2065911408');


--
-- Data for Name: event; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.event OVERRIDING SYSTEM VALUE VALUES (1, '2024-03-25 20:00:00.73+00', 'Harry Potter and the Cursed Child is a play written by Jack Thorne from an original story written by J. K. Rowling, Thorne and John Tiffany. The story is set nineteen years after the events of the 2007 novel Harry Potter and the Deathly Hallows by Rowling', 1, 1);


--
-- Data for Name: house; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.house OVERRIDING SYSTEM VALUE VALUES (1, 1, 'Большой зал');
INSERT INTO public.house OVERRIDING SYSTEM VALUE VALUES (2, 1, 'Средний зал');
INSERT INTO public.house OVERRIDING SYSTEM VALUE VALUES (3, 1, 'Малый зал');
INSERT INTO public.house OVERRIDING SYSTEM VALUE VALUES (4, 2, 'Зал имени Элины Быстрицкой');


--
-- Data for Name: house_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.house_details OVERRIDING SYSTEM VALUE VALUES (1, 1, 'Зона 1', 50, 250, 1);
INSERT INTO public.house_details OVERRIDING SYSTEM VALUE VALUES (2, 1, 'Зона 2', 40, 200, 2);
INSERT INTO public.house_details OVERRIDING SYSTEM VALUE VALUES (3, 1, 'Зона 3', 30, 150, 3);
INSERT INTO public.house_details OVERRIDING SYSTEM VALUE VALUES (4, 1, 'Зона 4', 20, 100, 4);


--
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: payment_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.payment_type OVERRIDING SYSTEM VALUE VALUES (1, 'Банковская карта');
INSERT INTO public.payment_type OVERRIDING SYSTEM VALUE VALUES (4, 'Наличными в кассе');
INSERT INTO public.payment_type OVERRIDING SYSTEM VALUE VALUES (3, 'Электронный кошелек');
INSERT INTO public.payment_type OVERRIDING SYSTEM VALUE VALUES (2, 'Система быстрых платежей');


--
-- Data for Name: play; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.play OVERRIDING SYSTEM VALUE VALUES (1, 1, 2, 6, 'J. K, Rowling', '{
  "Harry Potter": "David Ricardo-Pearce",
  "Ginny Weasley": "Polly Frame",
  "Albus Potter": "Ellis Rae",
  "Ronald Weasley": "Thomas Aldridge",
  "Hermione Granger": "Jade Ogugua"
}', 'Harry Potter And The Cursed Child');


--
-- Data for Name: position; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."position" OVERRIDING SYSTEM VALUE VALUES (1, 'Администратор');
INSERT INTO public."position" OVERRIDING SYSTEM VALUE VALUES (2, 'Директор');
INSERT INTO public."position" OVERRIDING SYSTEM VALUE VALUES (3, 'Менеджер');
INSERT INTO public."position" OVERRIDING SYSTEM VALUE VALUES (4, 'Сценарист');
INSERT INTO public."position" OVERRIDING SYSTEM VALUE VALUES (5, 'Кассир');


--
-- Data for Name: price_policy; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.price_policy OVERRIDING SYSTEM VALUE VALUES (1, 'Красная зона', 8000.00);
INSERT INTO public.price_policy OVERRIDING SYSTEM VALUE VALUES (2, 'Оранжевая зона', 7000.00);
INSERT INTO public.price_policy OVERRIDING SYSTEM VALUE VALUES (3, 'Желтая зона', 3000.00);
INSERT INTO public.price_policy OVERRIDING SYSTEM VALUE VALUES (4, 'Зеленая зона', 500.00);


--
-- Data for Name: sex; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sex OVERRIDING SYSTEM VALUE VALUES (1, 'Женский');
INSERT INTO public.sex OVERRIDING SYSTEM VALUE VALUES (2, 'Мужской');


--
-- Data for Name: ticket; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: building_building_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.building_building_id_seq', 2, true);


--
-- Name: employee_employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_employee_id_seq', 15, true);


--
-- Name: event_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.event_event_id_seq', 1, true);


--
-- Name: house_details_house_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.house_details_house_details_id_seq', 4, true);


--
-- Name: house_house_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.house_house_id_seq', 4, true);


--
-- Name: payment_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_payment_id_seq', 1, false);


--
-- Name: payment_type_payment_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_type_payment_type_id_seq', 4, true);


--
-- Name: play_play_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.play_play_id_seq', 1, true);


--
-- Name: position_position_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.position_position_id_seq', 5, true);


--
-- Name: price_policy_price_policy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.price_policy_price_policy_id_seq', 4, true);


--
-- Name: sex_sex_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sex_sex_id_seq', 2, true);


--
-- Name: ticket_ticket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ticket_ticket_id_seq', 1, false);


--
-- Name: building building_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.building
    ADD CONSTRAINT building_pk PRIMARY KEY (building_id);


--
-- Name: employee employee_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pk PRIMARY KEY (employee_id);


--
-- Name: event event_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_pk PRIMARY KEY (event_id);


--
-- Name: house_details house_details_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.house_details
    ADD CONSTRAINT house_details_pk PRIMARY KEY (house_details_id);


--
-- Name: house house_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.house
    ADD CONSTRAINT house_pk PRIMARY KEY (house_id);


--
-- Name: payment payment_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pk PRIMARY KEY (payment_id);


--
-- Name: payment_type payment_type_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_type
    ADD CONSTRAINT payment_type_pk PRIMARY KEY (payment_type_id);


--
-- Name: play play_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.play
    ADD CONSTRAINT play_pk PRIMARY KEY (play_id);


--
-- Name: position position_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."position"
    ADD CONSTRAINT position_pk PRIMARY KEY (position_id);


--
-- Name: price_policy price_policy_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price_policy
    ADD CONSTRAINT price_policy_pk PRIMARY KEY (price_policy_id);


--
-- Name: sex sex_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sex
    ADD CONSTRAINT sex_pk PRIMARY KEY (sex_id);


--
-- Name: ticket ticket_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_pk PRIMARY KEY (ticket_id);


--
-- Name: building building_employee_employee_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.building
    ADD CONSTRAINT building_employee_employee_id_fk FOREIGN KEY (manager_id) REFERENCES public.employee(employee_id);


--
-- Name: employee employee_position_position_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_position_position_id_fk FOREIGN KEY (position_id) REFERENCES public."position"(position_id);


--
-- Name: employee employee_sex_sex_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_sex_sex_id_fk FOREIGN KEY (sex_id) REFERENCES public.sex(sex_id);


--
-- Name: event event_house_house_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_house_house_id_fk FOREIGN KEY (house_id) REFERENCES public.house(house_id);


--
-- Name: event event_play_play_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_play_play_id_fk FOREIGN KEY (play_id) REFERENCES public.play(play_id);


--
-- Name: house house_building_building_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.house
    ADD CONSTRAINT house_building_building_id_fk FOREIGN KEY (building_id) REFERENCES public.building(building_id);


--
-- Name: house_details house_details_house_house_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.house_details
    ADD CONSTRAINT house_details_house_house_id_fk FOREIGN KEY (house_id) REFERENCES public.house(house_id);


--
-- Name: house_details house_details_price_policy_price_policy_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.house_details
    ADD CONSTRAINT house_details_price_policy_price_policy_id_fk FOREIGN KEY (price_policy_id) REFERENCES public.price_policy(price_policy_id);


--
-- Name: payment payment_payment_type_payment_type_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_payment_type_payment_type_id_fk FOREIGN KEY (payment_type_id) REFERENCES public.payment_type(payment_type_id);


--
-- Name: payment payment_ticket_ticket_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_ticket_ticket_id_fk FOREIGN KEY (ticket_id) REFERENCES public.ticket(ticket_id);


--
-- Name: play play_employee_employee_id_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.play
    ADD CONSTRAINT play_employee_employee_id_fk_1 FOREIGN KEY (director_id) REFERENCES public.employee(employee_id);


--
-- Name: play play_employee_employee_id_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.play
    ADD CONSTRAINT play_employee_employee_id_fk_2 FOREIGN KEY (manager_id) REFERENCES public.employee(employee_id);


--
-- Name: play play_employee_employee_id_fk_3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.play
    ADD CONSTRAINT play_employee_employee_id_fk_3 FOREIGN KEY (writer_id) REFERENCES public.employee(employee_id);


--
-- Name: ticket ticket_employee_employee_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_employee_employee_id_fk FOREIGN KEY (cashier_id) REFERENCES public.employee(employee_id);


--
-- Name: ticket ticket_event_event_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_event_event_id_fk FOREIGN KEY (event_id) REFERENCES public.event(event_id);


--
-- PostgreSQL database dump complete
--

