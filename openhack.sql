--
-- PostgreSQL database dump
--

-- Dumped from database version 11.2
-- Dumped by pg_dump version 11.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: api_bookmark; Type: TABLE; Schema: public; Owner: openhackuser
--

CREATE TABLE public.api_bookmark (
    id integer NOT NULL,
    post_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.api_bookmark OWNER TO openhackuser;

--
-- Name: api_bookmark_id_seq; Type: SEQUENCE; Schema: public; Owner: openhackuser
--

CREATE SEQUENCE public.api_bookmark_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_bookmark_id_seq OWNER TO openhackuser;

--
-- Name: api_bookmark_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: openhackuser
--

ALTER SEQUENCE public.api_bookmark_id_seq OWNED BY public.api_bookmark.id;


--
-- Name: api_comment; Type: TABLE; Schema: public; Owner: openhackuser
--

CREATE TABLE public.api_comment (
    id integer NOT NULL,
    content text NOT NULL,
    post_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.api_comment OWNER TO openhackuser;

--
-- Name: api_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: openhackuser
--

CREATE SEQUENCE public.api_comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_comment_id_seq OWNER TO openhackuser;

--
-- Name: api_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: openhackuser
--

ALTER SEQUENCE public.api_comment_id_seq OWNED BY public.api_comment.id;


--
-- Name: api_enrollment; Type: TABLE; Schema: public; Owner: openhackuser
--

CREATE TABLE public.api_enrollment (
    id integer NOT NULL,
    university_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.api_enrollment OWNER TO openhackuser;

--
-- Name: api_enrollment_id_seq; Type: SEQUENCE; Schema: public; Owner: openhackuser
--

CREATE SEQUENCE public.api_enrollment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_enrollment_id_seq OWNER TO openhackuser;

--
-- Name: api_enrollment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: openhackuser
--

ALTER SEQUENCE public.api_enrollment_id_seq OWNED BY public.api_enrollment.id;


--
-- Name: api_post; Type: TABLE; Schema: public; Owner: openhackuser
--

CREATE TABLE public.api_post (
    id integer NOT NULL,
    subject character varying(50) NOT NULL,
    professor character varying(50) NOT NULL,
    year integer NOT NULL,
    semester integer NOT NULL,
    category character varying(50) NOT NULL,
    file character varying(100) NOT NULL,
    university_id integer NOT NULL,
    explain text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.api_post OWNER TO openhackuser;

--
-- Name: api_post_id_seq; Type: SEQUENCE; Schema: public; Owner: openhackuser
--

CREATE SEQUENCE public.api_post_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_post_id_seq OWNER TO openhackuser;

--
-- Name: api_post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: openhackuser
--

ALTER SEQUENCE public.api_post_id_seq OWNED BY public.api_post.id;


--
-- Name: api_university; Type: TABLE; Schema: public; Owner: openhackuser
--

CREATE TABLE public.api_university (
    id integer NOT NULL,
    title character varying(50) NOT NULL
);


ALTER TABLE public.api_university OWNER TO openhackuser;

--
-- Name: api_university_id_seq; Type: SEQUENCE; Schema: public; Owner: openhackuser
--

CREATE SEQUENCE public.api_university_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_university_id_seq OWNER TO openhackuser;

--
-- Name: api_university_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: openhackuser
--

ALTER SEQUENCE public.api_university_id_seq OWNED BY public.api_university.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: openhackuser
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO openhackuser;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: openhackuser
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO openhackuser;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: openhackuser
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: openhackuser
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO openhackuser;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: openhackuser
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO openhackuser;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: openhackuser
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: openhackuser
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO openhackuser;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: openhackuser
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO openhackuser;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: openhackuser
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: openhackuser
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO openhackuser;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: openhackuser
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO openhackuser;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: openhackuser
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO openhackuser;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: openhackuser
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: openhackuser
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO openhackuser;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: openhackuser
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: openhackuser
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO openhackuser;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: openhackuser
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO openhackuser;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: openhackuser
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: openhackuser
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO openhackuser;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: openhackuser
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO openhackuser;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: openhackuser
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: openhackuser
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO openhackuser;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: openhackuser
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO openhackuser;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: openhackuser
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: openhackuser
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO openhackuser;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: openhackuser
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO openhackuser;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: openhackuser
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: openhackuser
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO openhackuser;

--
-- Name: api_bookmark id; Type: DEFAULT; Schema: public; Owner: openhackuser
--

ALTER TABLE ONLY public.api_bookmark ALTER COLUMN id SET DEFAULT nextval('public.api_bookmark_id_seq'::regclass);


--
-- Name: api_comment id; Type: DEFAULT; Schema: public; Owner: openhackuser
--

ALTER TABLE ONLY public.api_comment ALTER COLUMN id SET DEFAULT nextval('public.api_comment_id_seq'::regclass);


--
-- Name: api_enrollment id; Type: DEFAULT; Schema: public; Owner: openhackuser
--

ALTER TABLE ONLY public.api_enrollment ALTER COLUMN id SET DEFAULT nextval('public.api_enrollment_id_seq'::regclass);


--
-- Name: api_post id; Type: DEFAULT; Schema: public; Owner: openhackuser
--

ALTER TABLE ONLY public.api_post ALTER COLUMN id SET DEFAULT nextval('public.api_post_id_seq'::regclass);


--
-- Name: api_university id; Type: DEFAULT; Schema: public; Owner: openhackuser
--

ALTER TABLE ONLY public.api_university ALTER COLUMN id SET DEFAULT nextval('public.api_university_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: openhackuser
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: openhackuser
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: openhackuser
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: openhackuser
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: openhackuser
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: openhackuser
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: openhackuser
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: openhackuser
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: openhackuser
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: api_bookmark; Type: TABLE DATA; Schema: public; Owner: openhackuser
--

COPY public.api_bookmark (id, post_id, user_id) FROM stdin;
2	5	3
1	2	3
4	9	3
\.


--
-- Data for Name: api_comment; Type: TABLE DATA; Schema: public; Owner: openhackuser
--

COPY public.api_comment (id, content, post_id, user_id) FROM stdin;
1	hahaha	2	1
2	hahaha	2	1
\.


--
-- Data for Name: api_enrollment; Type: TABLE DATA; Schema: public; Owner: openhackuser
--

COPY public.api_enrollment (id, university_id, user_id) FROM stdin;
1	1	2
2	2	3
\.


--
-- Data for Name: api_post; Type: TABLE DATA; Schema: public; Owner: openhackuser
--

COPY public.api_post (id, subject, professor, year, semester, category, file, university_id, explain, user_id) FROM stdin;
9	ads	adsf	2019	1	adsf		1		1
2	선형대수학	문양세	2019	1	2		1	어려워요 호호	1
3	C프로그래밍	하진영	2019	2	중간		1		1
4	컴퓨터구조	최창열	2019	1	기말	o-12-570.jpg	1		1
5	의사소통영어	제임스	2019	2	기말		1		1
6	이산수학	김윤	2018	2	기말		1		1
7	공업수학	문양세	2018	1	중간		1		1
8	최황규	자료구조	2019	2	1		1		1
10	초급중국어	시진핑	2019	2	중간	o-12-570_TsbUlKu.jpg	1		1
11	초급일본어	아베	2017	2	중간	o-12-570_aC1VnEv.jpg	1		1
12	자바프로그래밍	감스트	2019	2	기말	o-12-570_rr5cQ0Z.jpg	1	ㅁㄴㅇㄹ	1
13	시각영상디자인원론	이미진	2018	1	중간	o-12-570.jpg	1	호호 어려워요	2
\.


--
-- Data for Name: api_university; Type: TABLE DATA; Schema: public; Owner: openhackuser
--

COPY public.api_university (id, title) FROM stdin;
1	강원대학교
2	서울대학교
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: openhackuser
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: openhackuser
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: openhackuser
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add post	7	add_post
26	Can change post	7	change_post
27	Can delete post	7	delete_post
28	Can view post	7	view_post
29	Can add university	8	add_university
30	Can change university	8	change_university
31	Can delete university	8	delete_university
32	Can view university	8	view_university
33	Can add comment	9	add_comment
34	Can change comment	9	change_comment
35	Can delete comment	9	delete_comment
36	Can view comment	9	view_comment
37	Can add book mark	10	add_bookmark
38	Can change book mark	10	change_bookmark
39	Can delete book mark	10	delete_bookmark
40	Can view book mark	10	view_bookmark
41	Can add enrollment	11	add_enrollment
42	Can change enrollment	11	change_enrollment
43	Can delete enrollment	11	delete_enrollment
44	Can view enrollment	11	view_enrollment
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: openhackuser
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$150000$MQv1crR3eesc$KclxRnaN+xf/Y6+vXu7PWwu9aXdw/egFhZAC5T3w280=	2019-06-27 23:42:08.072627+09	f	rose				f	t	2019-06-27 20:18:04.463528+09
1	pbkdf2_sha256$150000$VUd0JVQxeC57$YXQw8krCq3rmLLup2yuQ+C+2j1vY7lendiTFy1CN7uA=	2019-06-28 06:46:21.18732+09	t	root				t	t	2019-06-27 20:17:32.343076+09
3	pbkdf2_sha256$150000$seBcmkO9tNK7$/hZo3YGs/982EAp2l8M4G2QEzuVyEMcZ/PPRSEu8jxg=	\N	f	rove				f	t	2019-06-28 06:47:19.087079+09
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: openhackuser
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: openhackuser
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: openhackuser
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2019-06-27 20:18:04.591958+09	2	rose	1	[{"added": {}}]	4	1
2	2019-06-27 21:35:32.736996+09	2	University object (2)	1	[{"added": {}}]	8	1
3	2019-06-27 21:35:47.694131+09	1	University object (1)	2	[{"changed": {"fields": ["title"]}}]	8	1
4	2019-06-27 21:35:59.923312+09	1	Enrollment object (1)	1	[{"added": {}}]	11	1
5	2019-06-27 21:36:13.078726+09	1	University object (1)	2	[{"changed": {"fields": ["title"]}}]	8	1
6	2019-06-27 21:36:18.462088+09	2	University object (2)	2	[{"changed": {"fields": ["title"]}}]	8	1
7	2019-06-27 21:37:09.079475+09	1	BookMark object (1)	1	[{"added": {}}]	10	1
8	2019-06-27 21:37:16.020685+09	2	BookMark object (2)	1	[{"added": {}}]	10	1
9	2019-06-27 21:37:23.185873+09	3	BookMark object (3)	1	[{"added": {}}]	10	1
10	2019-06-28 05:06:10.870676+09	2	Post object (2)	2	[{"changed": {"fields": ["subject", "professor", "explain"]}}]	7	1
11	2019-06-28 05:06:33.497812+09	3	Post object (3)	2	[{"changed": {"fields": ["subject", "professor", "semester", "category"]}}]	7	1
12	2019-06-28 05:07:15.589775+09	4	Post object (4)	2	[{"changed": {"fields": ["subject", "professor", "category"]}}]	7	1
13	2019-06-28 05:07:32.588639+09	5	Post object (5)	2	[{"changed": {"fields": ["subject", "professor", "semester"]}}]	7	1
14	2019-06-28 05:07:50.126001+09	6	Post object (6)	2	[{"changed": {"fields": ["subject", "professor", "year", "semester"]}}]	7	1
15	2019-06-28 05:08:27.517356+09	7	Post object (7)	2	[{"changed": {"fields": ["subject", "professor", "year", "category"]}}]	7	1
16	2019-06-28 05:08:31.35232+09	7	Post object (7)	2	[]	7	1
17	2019-06-28 05:09:51.533562+09	8	Post object (8)	2	[{"changed": {"fields": ["subject", "professor", "semester"]}}]	7	1
18	2019-06-28 05:10:13.407454+09	10	Post object (10)	2	[{"changed": {"fields": ["subject", "professor", "semester", "category"]}}]	7	1
19	2019-06-28 05:10:41.834271+09	11	Post object (11)	2	[{"changed": {"fields": ["subject", "professor", "year", "semester"]}}]	7	1
20	2019-06-28 05:10:45.191926+09	11	Post object (11)	2	[]	7	1
21	2019-06-28 05:11:01.854957+09	12	Post object (12)	2	[{"changed": {"fields": ["subject", "professor", "semester"]}}]	7	1
22	2019-06-28 05:13:11.442298+09	13	Post object (13)	2	[{"changed": {"fields": ["subject", "professor", "year", "semester", "category", "explain"]}}]	7	1
23	2019-06-28 05:13:16.527287+09	14	Post object (14)	3		7	1
24	2019-06-28 06:47:19.222733+09	3	rove	1	[{"added": {}}]	4	1
25	2019-06-28 06:47:39.158287+09	2	Enrollment object (2)	1	[{"added": {}}]	11	1
26	2019-06-28 06:47:50.478066+09	3	BookMark object (3)	3		10	1
27	2019-06-28 06:48:00.301471+09	2	BookMark object (2)	2	[{"changed": {"fields": ["user"]}}]	10	1
28	2019-06-28 06:48:06.854437+09	1	BookMark object (1)	2	[{"changed": {"fields": ["user"]}}]	10	1
29	2019-06-28 06:48:17.120085+09	4	BookMark object (4)	1	[{"added": {}}]	10	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: openhackuser
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	api	post
8	api	university
9	api	comment
10	api	bookmark
11	api	enrollment
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: openhackuser
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-06-26 23:56:34.979067+09
2	auth	0001_initial	2019-06-26 23:56:35.017272+09
3	admin	0001_initial	2019-06-26 23:56:35.054864+09
4	admin	0002_logentry_remove_auto_add	2019-06-26 23:56:35.071021+09
5	admin	0003_logentry_add_action_flag_choices	2019-06-26 23:56:35.079617+09
6	contenttypes	0002_remove_content_type_name	2019-06-26 23:56:35.097453+09
7	auth	0002_alter_permission_name_max_length	2019-06-26 23:56:35.102839+09
8	auth	0003_alter_user_email_max_length	2019-06-26 23:56:35.111681+09
9	auth	0004_alter_user_username_opts	2019-06-26 23:56:35.120762+09
10	auth	0005_alter_user_last_login_null	2019-06-26 23:56:35.129205+09
11	auth	0006_require_contenttypes_0002	2019-06-26 23:56:35.130722+09
12	auth	0007_alter_validators_add_error_messages	2019-06-26 23:56:35.141152+09
13	auth	0008_alter_user_username_max_length	2019-06-26 23:56:35.150697+09
14	auth	0009_alter_user_last_name_max_length	2019-06-26 23:56:35.160299+09
15	auth	0010_alter_group_name_max_length	2019-06-26 23:56:35.168213+09
16	auth	0011_update_proxy_permissions	2019-06-26 23:56:35.176865+09
17	sessions	0001_initial	2019-06-26 23:56:35.181748+09
18	api	0001_initial	2019-06-27 01:38:39.890027+09
19	api	0002_auto_20190626_1647	2019-06-27 01:47:22.346235+09
20	api	0003_auto_20190626_1654	2019-06-27 01:55:03.068302+09
21	api	0004_comment	2019-06-27 02:25:54.655963+09
22	api	0005_auto_20190627_0656	2019-06-27 15:56:23.606169+09
23	api	0006_post_explain	2019-06-27 16:32:30.801561+09
24	api	0007_auto_20190627_1119	2019-06-27 20:19:58.49722+09
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: openhackuser
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
ny8cl7q46a95b3ctomvnpxssj05wwr4r	YmZmMTFmYWQxOTJmYTcxNzhhYTE2Mjk4NGJlMTQ2MWE4MGQ3OWFjOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzZDcwZmQ3ZTk0NWQ1ZjQ3YmY4ZmY2ODgzN2RiNmJkYTcxOWYxODM0In0=	2019-07-11 20:17:53.859547+09
4rffj3bssovetfxu0cspdbvr7q6422bs	NGM1ZjI3YTEyMWQzODA2YWZlZDAzN2U1Y2NmMDdkZTc4NjkzMDYzMTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MjEzZDBlZWJhYzJlYTgwZmNiNzA3MzgzODc2MjY4ZTg1NTQ2MWZmIn0=	2019-07-11 21:30:10.304626+09
n7fg9sh1p9rhl7uvdjkl26on8juqd0s6	NGM1ZjI3YTEyMWQzODA2YWZlZDAzN2U1Y2NmMDdkZTc4NjkzMDYzMTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MjEzZDBlZWJhYzJlYTgwZmNiNzA3MzgzODc2MjY4ZTg1NTQ2MWZmIn0=	2019-07-11 21:32:22.59923+09
i440lhdkzfhnch4293cl158ho76npzkf	NGM1ZjI3YTEyMWQzODA2YWZlZDAzN2U1Y2NmMDdkZTc4NjkzMDYzMTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MjEzZDBlZWJhYzJlYTgwZmNiNzA3MzgzODc2MjY4ZTg1NTQ2MWZmIn0=	2019-07-11 21:55:57.292901+09
zpbxb3jy1nge72f70fyiifllvq27or1t	NGM1ZjI3YTEyMWQzODA2YWZlZDAzN2U1Y2NmMDdkZTc4NjkzMDYzMTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MjEzZDBlZWJhYzJlYTgwZmNiNzA3MzgzODc2MjY4ZTg1NTQ2MWZmIn0=	2019-07-11 22:07:31.299109+09
mu2e96afzeo201hkxb0yl9xbuugzi3hz	NGM1ZjI3YTEyMWQzODA2YWZlZDAzN2U1Y2NmMDdkZTc4NjkzMDYzMTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MjEzZDBlZWJhYzJlYTgwZmNiNzA3MzgzODc2MjY4ZTg1NTQ2MWZmIn0=	2019-07-11 22:34:07.464285+09
mu4r5xgx0ge24cqqajxu6bwv31zll6wa	NGM1ZjI3YTEyMWQzODA2YWZlZDAzN2U1Y2NmMDdkZTc4NjkzMDYzMTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MjEzZDBlZWJhYzJlYTgwZmNiNzA3MzgzODc2MjY4ZTg1NTQ2MWZmIn0=	2019-07-11 23:13:30.216112+09
5u78ahmz7rrod62bw9olspsddwlxffs9	NGM1ZjI3YTEyMWQzODA2YWZlZDAzN2U1Y2NmMDdkZTc4NjkzMDYzMTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MjEzZDBlZWJhYzJlYTgwZmNiNzA3MzgzODc2MjY4ZTg1NTQ2MWZmIn0=	2019-07-11 23:13:37.41714+09
zaha86he43pbi5vsvar8iapsjsxi49c3	NGM1ZjI3YTEyMWQzODA2YWZlZDAzN2U1Y2NmMDdkZTc4NjkzMDYzMTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MjEzZDBlZWJhYzJlYTgwZmNiNzA3MzgzODc2MjY4ZTg1NTQ2MWZmIn0=	2019-07-11 23:14:17.599025+09
zvvczmnggzppybc8vf1wb7lm2ypn58or	NGM1ZjI3YTEyMWQzODA2YWZlZDAzN2U1Y2NmMDdkZTc4NjkzMDYzMTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MjEzZDBlZWJhYzJlYTgwZmNiNzA3MzgzODc2MjY4ZTg1NTQ2MWZmIn0=	2019-07-11 23:15:10.857519+09
04vxm5csuudbl5nlos4i1vmrpy66qi1n	NGM1ZjI3YTEyMWQzODA2YWZlZDAzN2U1Y2NmMDdkZTc4NjkzMDYzMTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MjEzZDBlZWJhYzJlYTgwZmNiNzA3MzgzODc2MjY4ZTg1NTQ2MWZmIn0=	2019-07-11 23:18:55.880176+09
ay6bvtovo5zgkm5cxdjfbdlz03rrrmja	NGM1ZjI3YTEyMWQzODA2YWZlZDAzN2U1Y2NmMDdkZTc4NjkzMDYzMTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MjEzZDBlZWJhYzJlYTgwZmNiNzA3MzgzODc2MjY4ZTg1NTQ2MWZmIn0=	2019-07-11 23:21:01.735626+09
fi13v8jkgfx1m8j2dyl67nl02ed175j3	NGM1ZjI3YTEyMWQzODA2YWZlZDAzN2U1Y2NmMDdkZTc4NjkzMDYzMTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MjEzZDBlZWJhYzJlYTgwZmNiNzA3MzgzODc2MjY4ZTg1NTQ2MWZmIn0=	2019-07-11 23:21:42.033057+09
wtjpoxe13mtge2m6f8k2o7b5gyykp6c8	NGM1ZjI3YTEyMWQzODA2YWZlZDAzN2U1Y2NmMDdkZTc4NjkzMDYzMTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MjEzZDBlZWJhYzJlYTgwZmNiNzA3MzgzODc2MjY4ZTg1NTQ2MWZmIn0=	2019-07-11 23:23:37.754582+09
9w1mr0gdf286vfgylvw2y57muq7q09he	NGM1ZjI3YTEyMWQzODA2YWZlZDAzN2U1Y2NmMDdkZTc4NjkzMDYzMTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MjEzZDBlZWJhYzJlYTgwZmNiNzA3MzgzODc2MjY4ZTg1NTQ2MWZmIn0=	2019-07-11 23:24:14.369485+09
u216koozwrf6q0rlihrl21tj70v8r3ty	NGM1ZjI3YTEyMWQzODA2YWZlZDAzN2U1Y2NmMDdkZTc4NjkzMDYzMTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MjEzZDBlZWJhYzJlYTgwZmNiNzA3MzgzODc2MjY4ZTg1NTQ2MWZmIn0=	2019-07-11 23:24:54.800228+09
u0bgvo7xvor4xv21wez4ic7kimkabtdk	NGM1ZjI3YTEyMWQzODA2YWZlZDAzN2U1Y2NmMDdkZTc4NjkzMDYzMTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MjEzZDBlZWJhYzJlYTgwZmNiNzA3MzgzODc2MjY4ZTg1NTQ2MWZmIn0=	2019-07-11 23:26:20.693298+09
iv4pl7wqbnwawkpaer8nac7wqdzm0ugx	NGM1ZjI3YTEyMWQzODA2YWZlZDAzN2U1Y2NmMDdkZTc4NjkzMDYzMTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MjEzZDBlZWJhYzJlYTgwZmNiNzA3MzgzODc2MjY4ZTg1NTQ2MWZmIn0=	2019-07-11 23:27:13.254037+09
v53b3wmsm75wt9mclmulsceo9tgab2j5	NGM1ZjI3YTEyMWQzODA2YWZlZDAzN2U1Y2NmMDdkZTc4NjkzMDYzMTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MjEzZDBlZWJhYzJlYTgwZmNiNzA3MzgzODc2MjY4ZTg1NTQ2MWZmIn0=	2019-07-11 23:35:42.413222+09
ftced29lkg2i7mw9u1jv5pm9ygm8epbb	NGM1ZjI3YTEyMWQzODA2YWZlZDAzN2U1Y2NmMDdkZTc4NjkzMDYzMTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MjEzZDBlZWJhYzJlYTgwZmNiNzA3MzgzODc2MjY4ZTg1NTQ2MWZmIn0=	2019-07-11 23:41:11.805373+09
z865ozf972tcnldw9a0z9l5iqmgbd2k5	NGM1ZjI3YTEyMWQzODA2YWZlZDAzN2U1Y2NmMDdkZTc4NjkzMDYzMTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MjEzZDBlZWJhYzJlYTgwZmNiNzA3MzgzODc2MjY4ZTg1NTQ2MWZmIn0=	2019-07-11 23:42:01.938252+09
5zk35pztgi3f3vtqyyjra58a1wj1sgmv	NGM1ZjI3YTEyMWQzODA2YWZlZDAzN2U1Y2NmMDdkZTc4NjkzMDYzMTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MjEzZDBlZWJhYzJlYTgwZmNiNzA3MzgzODc2MjY4ZTg1NTQ2MWZmIn0=	2019-07-11 23:42:08.073895+09
\.


--
-- Name: api_bookmark_id_seq; Type: SEQUENCE SET; Schema: public; Owner: openhackuser
--

SELECT pg_catalog.setval('public.api_bookmark_id_seq', 4, true);


--
-- Name: api_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: openhackuser
--

SELECT pg_catalog.setval('public.api_comment_id_seq', 2, true);


--
-- Name: api_enrollment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: openhackuser
--

SELECT pg_catalog.setval('public.api_enrollment_id_seq', 2, true);


--
-- Name: api_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: openhackuser
--

SELECT pg_catalog.setval('public.api_post_id_seq', 14, true);


--
-- Name: api_university_id_seq; Type: SEQUENCE SET; Schema: public; Owner: openhackuser
--

SELECT pg_catalog.setval('public.api_university_id_seq', 2, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: openhackuser
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: openhackuser
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: openhackuser
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 44, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: openhackuser
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: openhackuser
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 3, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: openhackuser
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: openhackuser
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 29, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: openhackuser
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 11, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: openhackuser
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 24, true);


--
-- Name: api_bookmark api_bookmark_pkey; Type: CONSTRAINT; Schema: public; Owner: openhackuser
--

ALTER TABLE ONLY public.api_bookmark
    ADD CONSTRAINT api_bookmark_pkey PRIMARY KEY (id);


--
-- Name: api_bookmark api_bookmark_user_id_post_id_eb5b570b_uniq; Type: CONSTRAINT; Schema: public; Owner: openhackuser
--

ALTER TABLE ONLY public.api_bookmark
    ADD CONSTRAINT api_bookmark_user_id_post_id_eb5b570b_uniq UNIQUE (user_id, post_id);


--
-- Name: api_comment api_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: openhackuser
--

ALTER TABLE ONLY public.api_comment
    ADD CONSTRAINT api_comment_pkey PRIMARY KEY (id);


--
-- Name: api_enrollment api_enrollment_pkey; Type: CONSTRAINT; Schema: public; Owner: openhackuser
--

ALTER TABLE ONLY public.api_enrollment
    ADD CONSTRAINT api_enrollment_pkey PRIMARY KEY (id);


--
-- Name: api_enrollment api_enrollment_user_id_key; Type: CONSTRAINT; Schema: public; Owner: openhackuser
--

ALTER TABLE ONLY public.api_enrollment
    ADD CONSTRAINT api_enrollment_user_id_key UNIQUE (user_id);


--
-- Name: api_post api_post_pkey; Type: CONSTRAINT; Schema: public; Owner: openhackuser
--

ALTER TABLE ONLY public.api_post
    ADD CONSTRAINT api_post_pkey PRIMARY KEY (id);


--
-- Name: api_university api_university_pkey; Type: CONSTRAINT; Schema: public; Owner: openhackuser
--

ALTER TABLE ONLY public.api_university
    ADD CONSTRAINT api_university_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: openhackuser
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: openhackuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: openhackuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: openhackuser
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: openhackuser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: openhackuser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: openhackuser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: openhackuser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: openhackuser
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: openhackuser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: openhackuser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: openhackuser
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: openhackuser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: openhackuser
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: openhackuser
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: openhackuser
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: openhackuser
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: api_bookmark_post_id_a66f33a7; Type: INDEX; Schema: public; Owner: openhackuser
--

CREATE INDEX api_bookmark_post_id_a66f33a7 ON public.api_bookmark USING btree (post_id);


--
-- Name: api_bookmark_user_id_bf19af15; Type: INDEX; Schema: public; Owner: openhackuser
--

CREATE INDEX api_bookmark_user_id_bf19af15 ON public.api_bookmark USING btree (user_id);


--
-- Name: api_comment_post_id_251fc0c3; Type: INDEX; Schema: public; Owner: openhackuser
--

CREATE INDEX api_comment_post_id_251fc0c3 ON public.api_comment USING btree (post_id);


--
-- Name: api_comment_user_id_14315666; Type: INDEX; Schema: public; Owner: openhackuser
--

CREATE INDEX api_comment_user_id_14315666 ON public.api_comment USING btree (user_id);


--
-- Name: api_enrollment_university_id_67bc8a7c; Type: INDEX; Schema: public; Owner: openhackuser
--

CREATE INDEX api_enrollment_university_id_67bc8a7c ON public.api_enrollment USING btree (university_id);


--
-- Name: api_post_university_id_99f6696d; Type: INDEX; Schema: public; Owner: openhackuser
--

CREATE INDEX api_post_university_id_99f6696d ON public.api_post USING btree (university_id);


--
-- Name: api_post_user_id_580bae2a; Type: INDEX; Schema: public; Owner: openhackuser
--

CREATE INDEX api_post_user_id_580bae2a ON public.api_post USING btree (user_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: openhackuser
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: openhackuser
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: openhackuser
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: openhackuser
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: openhackuser
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: openhackuser
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: openhackuser
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: openhackuser
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: openhackuser
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: openhackuser
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: openhackuser
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: openhackuser
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: openhackuser
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: api_bookmark api_bookmark_post_id_a66f33a7_fk_api_post_id; Type: FK CONSTRAINT; Schema: public; Owner: openhackuser
--

ALTER TABLE ONLY public.api_bookmark
    ADD CONSTRAINT api_bookmark_post_id_a66f33a7_fk_api_post_id FOREIGN KEY (post_id) REFERENCES public.api_post(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_bookmark api_bookmark_user_id_bf19af15_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: openhackuser
--

ALTER TABLE ONLY public.api_bookmark
    ADD CONSTRAINT api_bookmark_user_id_bf19af15_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_comment api_comment_post_id_251fc0c3_fk_api_post_id; Type: FK CONSTRAINT; Schema: public; Owner: openhackuser
--

ALTER TABLE ONLY public.api_comment
    ADD CONSTRAINT api_comment_post_id_251fc0c3_fk_api_post_id FOREIGN KEY (post_id) REFERENCES public.api_post(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_comment api_comment_user_id_14315666_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: openhackuser
--

ALTER TABLE ONLY public.api_comment
    ADD CONSTRAINT api_comment_user_id_14315666_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_enrollment api_enrollment_university_id_67bc8a7c_fk_api_university_id; Type: FK CONSTRAINT; Schema: public; Owner: openhackuser
--

ALTER TABLE ONLY public.api_enrollment
    ADD CONSTRAINT api_enrollment_university_id_67bc8a7c_fk_api_university_id FOREIGN KEY (university_id) REFERENCES public.api_university(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_enrollment api_enrollment_user_id_03502546_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: openhackuser
--

ALTER TABLE ONLY public.api_enrollment
    ADD CONSTRAINT api_enrollment_user_id_03502546_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_post api_post_university_id_99f6696d_fk_api_university_id; Type: FK CONSTRAINT; Schema: public; Owner: openhackuser
--

ALTER TABLE ONLY public.api_post
    ADD CONSTRAINT api_post_university_id_99f6696d_fk_api_university_id FOREIGN KEY (university_id) REFERENCES public.api_university(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_post api_post_user_id_580bae2a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: openhackuser
--

ALTER TABLE ONLY public.api_post
    ADD CONSTRAINT api_post_user_id_580bae2a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: openhackuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: openhackuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: openhackuser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: openhackuser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: openhackuser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: openhackuser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: openhackuser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: openhackuser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: openhackuser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

