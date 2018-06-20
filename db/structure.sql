SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: carts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.carts (
    id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    line_item_id bigint,
    order_item_id bigint,
    order_id bigint,
    user_id bigint,
    total numeric,
    total_with_tax numeric,
    tax numeric
);


--
-- Name: carts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.carts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: carts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.carts_id_seq OWNED BY public.carts.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    categorization_id bigint
);


--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: categorizations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.categorizations (
    id bigint NOT NULL,
    category_id integer,
    item_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: categorizations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.categorizations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: categorizations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.categorizations_id_seq OWNED BY public.categorizations.id;


--
-- Name: employee_carts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.employee_carts (
    id bigint NOT NULL,
    employee_line_item_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    order_item_id bigint
);


--
-- Name: employee_carts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.employee_carts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: employee_carts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.employee_carts_id_seq OWNED BY public.employee_carts.id;


--
-- Name: employee_line_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.employee_line_items (
    id bigint NOT NULL,
    item_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    employee_cart_id bigint
);


--
-- Name: employee_line_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.employee_line_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: employee_line_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.employee_line_items_id_seq OWNED BY public.employee_line_items.id;


--
-- Name: employees; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.employees (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: employees_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.employees_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: employees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.employees_id_seq OWNED BY public.employees.id;


--
-- Name: items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.items (
    id bigint NOT NULL,
    name character varying,
    item_type character varying,
    price numeric,
    description text,
    image character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    active boolean,
    employee_cart_id bigint,
    categorization_id bigint
);


--
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.items_id_seq OWNED BY public.items.id;


--
-- Name: line_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.line_items (
    id bigint NOT NULL,
    item_id bigint,
    cart_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    quantity integer DEFAULT 1,
    user_id bigint,
    price numeric,
    name character varying,
    item_type character varying
);


--
-- Name: line_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.line_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: line_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.line_items_id_seq OWNED BY public.line_items.id;


--
-- Name: order_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_items (
    id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    order_id bigint,
    cart_id bigint,
    subtotal numeric,
    total numeric,
    tax numeric,
    user_id bigint
);


--
-- Name: order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.order_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: order_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.order_items_id_seq OWNED BY public.order_items.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orders (
    id bigint NOT NULL,
    user_id bigint,
    subtotal numeric,
    tax numeric,
    total numeric,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    order_item_id bigint,
    name character varying,
    status character varying DEFAULT 'pending'::character varying
);


--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    first_name character varying,
    last_name character varying,
    stripe_id character varying,
    orders_id bigint
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: carts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carts ALTER COLUMN id SET DEFAULT nextval('public.carts_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: categorizations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categorizations ALTER COLUMN id SET DEFAULT nextval('public.categorizations_id_seq'::regclass);


--
-- Name: employee_carts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.employee_carts ALTER COLUMN id SET DEFAULT nextval('public.employee_carts_id_seq'::regclass);


--
-- Name: employee_line_items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.employee_line_items ALTER COLUMN id SET DEFAULT nextval('public.employee_line_items_id_seq'::regclass);


--
-- Name: employees id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.employees ALTER COLUMN id SET DEFAULT nextval('public.employees_id_seq'::regclass);


--
-- Name: items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.items ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- Name: line_items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.line_items ALTER COLUMN id SET DEFAULT nextval('public.line_items_id_seq'::regclass);


--
-- Name: order_items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_items ALTER COLUMN id SET DEFAULT nextval('public.order_items_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: carts carts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: categorizations categorizations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categorizations
    ADD CONSTRAINT categorizations_pkey PRIMARY KEY (id);


--
-- Name: employee_carts employee_carts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.employee_carts
    ADD CONSTRAINT employee_carts_pkey PRIMARY KEY (id);


--
-- Name: employee_line_items employee_line_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.employee_line_items
    ADD CONSTRAINT employee_line_items_pkey PRIMARY KEY (id);


--
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);


--
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- Name: line_items line_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.line_items
    ADD CONSTRAINT line_items_pkey PRIMARY KEY (id);


--
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_carts_on_line_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_carts_on_line_item_id ON public.carts USING btree (line_item_id);


--
-- Name: index_carts_on_order_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_carts_on_order_id ON public.carts USING btree (order_id);


--
-- Name: index_carts_on_order_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_carts_on_order_item_id ON public.carts USING btree (order_item_id);


--
-- Name: index_carts_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_carts_on_user_id ON public.carts USING btree (user_id);


--
-- Name: index_categories_on_categorization_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_categories_on_categorization_id ON public.categories USING btree (categorization_id);


--
-- Name: index_categories_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_categories_on_name ON public.categories USING btree (name);


--
-- Name: index_employee_carts_on_employee_line_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_employee_carts_on_employee_line_item_id ON public.employee_carts USING btree (employee_line_item_id);


--
-- Name: index_employee_carts_on_order_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_employee_carts_on_order_item_id ON public.employee_carts USING btree (order_item_id);


--
-- Name: index_employee_line_items_on_employee_cart_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_employee_line_items_on_employee_cart_id ON public.employee_line_items USING btree (employee_cart_id);


--
-- Name: index_employee_line_items_on_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_employee_line_items_on_item_id ON public.employee_line_items USING btree (item_id);


--
-- Name: index_employees_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_employees_on_email ON public.employees USING btree (email);


--
-- Name: index_employees_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_employees_on_reset_password_token ON public.employees USING btree (reset_password_token);


--
-- Name: index_items_on_categorization_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_items_on_categorization_id ON public.items USING btree (categorization_id);


--
-- Name: index_items_on_employee_cart_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_items_on_employee_cart_id ON public.items USING btree (employee_cart_id);


--
-- Name: index_items_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_items_on_name ON public.items USING btree (name);


--
-- Name: index_line_items_on_cart_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_line_items_on_cart_id ON public.line_items USING btree (cart_id);


--
-- Name: index_line_items_on_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_line_items_on_item_id ON public.line_items USING btree (item_id);


--
-- Name: index_line_items_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_line_items_on_user_id ON public.line_items USING btree (user_id);


--
-- Name: index_order_items_on_cart_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_order_items_on_cart_id ON public.order_items USING btree (cart_id);


--
-- Name: index_order_items_on_order_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_order_items_on_order_id ON public.order_items USING btree (order_id);


--
-- Name: index_order_items_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_order_items_on_user_id ON public.order_items USING btree (user_id);


--
-- Name: index_orders_on_order_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_orders_on_order_item_id ON public.orders USING btree (order_item_id);


--
-- Name: index_orders_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_orders_on_user_id ON public.orders USING btree (user_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_first_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_first_name ON public.users USING btree (first_name);


--
-- Name: index_users_on_last_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_last_name ON public.users USING btree (last_name);


--
-- Name: index_users_on_orders_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_orders_id ON public.users USING btree (orders_id);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: carts fk_rails_00582d5eae; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT fk_rails_00582d5eae FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: order_items fk_rails_0779e952fa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT fk_rails_0779e952fa FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: items fk_rails_14c67fb60a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_14c67fb60a FOREIGN KEY (categorization_id) REFERENCES public.categorizations(id);


--
-- Name: items fk_rails_1933548d40; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_1933548d40 FOREIGN KEY (employee_cart_id) REFERENCES public.employee_carts(id);


--
-- Name: orders fk_rails_32b6c24fdd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_rails_32b6c24fdd FOREIGN KEY (order_item_id) REFERENCES public.order_items(id);


--
-- Name: order_items fk_rails_59f7f23852; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT fk_rails_59f7f23852 FOREIGN KEY (cart_id) REFERENCES public.carts(id);


--
-- Name: employee_line_items fk_rails_618a66c975; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.employee_line_items
    ADD CONSTRAINT fk_rails_618a66c975 FOREIGN KEY (item_id) REFERENCES public.items(id);


--
-- Name: employee_line_items fk_rails_63baccd0cc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.employee_line_items
    ADD CONSTRAINT fk_rails_63baccd0cc FOREIGN KEY (employee_cart_id) REFERENCES public.employee_carts(id);


--
-- Name: employee_carts fk_rails_6ad92970a3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.employee_carts
    ADD CONSTRAINT fk_rails_6ad92970a3 FOREIGN KEY (employee_line_item_id) REFERENCES public.employee_line_items(id);


--
-- Name: line_items fk_rails_af645e8e5f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.line_items
    ADD CONSTRAINT fk_rails_af645e8e5f FOREIGN KEY (cart_id) REFERENCES public.carts(id);


--
-- Name: line_items fk_rails_d159f7f5fb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.line_items
    ADD CONSTRAINT fk_rails_d159f7f5fb FOREIGN KEY (item_id) REFERENCES public.items(id);


--
-- Name: users fk_rails_e0253ed9a4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_rails_e0253ed9a4 FOREIGN KEY (orders_id) REFERENCES public.orders(id);


--
-- Name: carts fk_rails_e0a1b303e5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT fk_rails_e0a1b303e5 FOREIGN KEY (line_item_id) REFERENCES public.line_items(id);


--
-- Name: order_items fk_rails_e3cb28f071; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT fk_rails_e3cb28f071 FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: carts fk_rails_e480a7424f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT fk_rails_e480a7424f FOREIGN KEY (order_item_id) REFERENCES public.order_items(id);


--
-- Name: carts fk_rails_ea59a35211; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT fk_rails_ea59a35211 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: employee_carts fk_rails_f3f782e7c9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.employee_carts
    ADD CONSTRAINT fk_rails_f3f782e7c9 FOREIGN KEY (order_item_id) REFERENCES public.order_items(id);


--
-- Name: categories fk_rails_f5d2cbbb12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT fk_rails_f5d2cbbb12 FOREIGN KEY (categorization_id) REFERENCES public.categorizations(id);


--
-- Name: orders fk_rails_f868b47f6a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_rails_f868b47f6a FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: line_items fk_rails_fbbbfefd83; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.line_items
    ADD CONSTRAINT fk_rails_fbbbfefd83 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20180518043816'),
('20180519001626'),
('20180520155012'),
('20180520155614'),
('20180521011925'),
('20180521055034'),
('20180521055227'),
('20180521060236'),
('20180522230918'),
('20180523191429'),
('20180524013337'),
('20180524045833'),
('20180524053758'),
('20180524205637'),
('20180525020421'),
('20180525230355'),
('20180527190631'),
('20180527201255'),
('20180527201324'),
('20180527201504'),
('20180527222038'),
('20180529021005'),
('20180529021032'),
('20180529021053'),
('20180529021859'),
('20180529024708'),
('20180529173909'),
('20180529201248'),
('20180529201706'),
('20180529203109'),
('20180529214258'),
('20180529214605'),
('20180530041044'),
('20180530160151'),
('20180530170625'),
('20180530175933'),
('20180530181352'),
('20180530184334'),
('20180530194406'),
('20180530221512'),
('20180531182522'),
('20180531182531'),
('20180531182550'),
('20180531182744'),
('20180531202844'),
('20180603001400'),
('20180603001434'),
('20180620184247'),
('20180620184316'),
('20180620191747'),
('20180620191814');


