--
-- PostgreSQL database dump
--

\restrict ZrTYJeeLQwUUOz1cJOgrcehAwgRZrDa79DCkl8QyXpi1185zYB25UgCWtLw34C8

-- Dumped from database version 18.4 (Postgres.app)
-- Dumped by pg_dump version 18.4 (Postgres.app)

-- Started on 2026-05-17 18:15:31 +03

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 228 (class 1259 OID 16461)
-- Name: cuzdan_hareketleri; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cuzdan_hareketleri (
    hareket_id integer NOT NULL,
    cuzdan_id integer,
    islem_tipi character varying(50),
    tutar numeric(10,2),
    tarih timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- TOC entry 227 (class 1259 OID 16460)
-- Name: cuzdan_hareketleri_hareket_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cuzdan_hareketleri_hareket_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3943 (class 0 OID 0)
-- Dependencies: 227
-- Name: cuzdan_hareketleri_hareket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cuzdan_hareketleri_hareket_id_seq OWNED BY public.cuzdan_hareketleri.hareket_id;


--
-- TOC entry 226 (class 1259 OID 16445)
-- Name: cuzdanlar; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cuzdanlar (
    cuzdan_id integer NOT NULL,
    kullanici_id integer,
    bakiye numeric(10,2) DEFAULT 0.00
);


--
-- TOC entry 225 (class 1259 OID 16444)
-- Name: cuzdanlar_cuzdan_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cuzdanlar_cuzdan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3944 (class 0 OID 0)
-- Dependencies: 225
-- Name: cuzdanlar_cuzdan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cuzdanlar_cuzdan_id_seq OWNED BY public.cuzdanlar.cuzdan_id;


--
-- TOC entry 224 (class 1259 OID 16429)
-- Name: gelir_beyanlari; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.gelir_beyanlari (
    beyan_id integer NOT NULL,
    kullanici_id integer,
    aylik_gelir numeric(10,2) NOT NULL,
    kisi_sayisi integer NOT NULL,
    belge_url character varying(255),
    tarih timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- TOC entry 223 (class 1259 OID 16428)
-- Name: gelir_beyanlari_beyan_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.gelir_beyanlari_beyan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3945 (class 0 OID 0)
-- Dependencies: 223
-- Name: gelir_beyanlari_beyan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.gelir_beyanlari_beyan_id_seq OWNED BY public.gelir_beyanlari.beyan_id;


--
-- TOC entry 230 (class 1259 OID 16475)
-- Name: kategoriler; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.kategoriler (
    kategori_id integer NOT NULL,
    kategori_adi character varying(100) NOT NULL
);


--
-- TOC entry 229 (class 1259 OID 16474)
-- Name: kategoriler_kategori_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.kategoriler_kategori_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3946 (class 0 OID 0)
-- Dependencies: 229
-- Name: kategoriler_kategori_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.kategoriler_kategori_id_seq OWNED BY public.kategoriler.kategori_id;


--
-- TOC entry 233 (class 1259 OID 16492)
-- Name: kategoriler_urunler; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.kategoriler_urunler (
    kategori_id integer NOT NULL,
    urun_id integer NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 16408)
-- Name: kullanicilar; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.kullanicilar (
    kullanici_id integer NOT NULL,
    rol_id integer,
    ad character varying(50) NOT NULL,
    soyad character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    sifre character varying(255) NOT NULL,
    telefon character varying(15),
    kayit_tarihi timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    onay_durumu boolean DEFAULT false
);


--
-- TOC entry 221 (class 1259 OID 16407)
-- Name: kullanicilar_kullanici_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.kullanicilar_kullanici_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3947 (class 0 OID 0)
-- Dependencies: 221
-- Name: kullanicilar_kullanici_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.kullanicilar_kullanici_id_seq OWNED BY public.kullanicilar.kullanici_id;


--
-- TOC entry 220 (class 1259 OID 16399)
-- Name: roller; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.roller (
    rol_id integer NOT NULL,
    rol_adi character varying(50) NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 16398)
-- Name: roller_rol_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.roller_rol_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3948 (class 0 OID 0)
-- Dependencies: 219
-- Name: roller_rol_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.roller_rol_id_seq OWNED BY public.roller.rol_id;


--
-- TOC entry 235 (class 1259 OID 16510)
-- Name: siparis_havuzlari; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.siparis_havuzlari (
    havuz_id integer NOT NULL,
    urun_id integer,
    hedef_miktar numeric(10,2),
    toplanan_miktar numeric(10,2) DEFAULT 0,
    bitis_tarihi date,
    havuz_durumu character varying(50) DEFAULT 'Aktif'::character varying
);


--
-- TOC entry 234 (class 1259 OID 16509)
-- Name: siparis_havuzlari_havuz_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.siparis_havuzlari_havuz_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3949 (class 0 OID 0)
-- Dependencies: 234
-- Name: siparis_havuzlari_havuz_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.siparis_havuzlari_havuz_id_seq OWNED BY public.siparis_havuzlari.havuz_id;


--
-- TOC entry 237 (class 1259 OID 16525)
-- Name: siparisler; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.siparisler (
    siparis_id integer NOT NULL,
    kullanici_id integer,
    toplam_tutar numeric(10,2),
    siparis_tarihi timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- TOC entry 238 (class 1259 OID 16538)
-- Name: siparisler_siparis_havuzlari; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.siparisler_siparis_havuzlari (
    siparis_id integer NOT NULL,
    havuz_id integer NOT NULL,
    talep_edilen_miktar numeric(10,2)
);


--
-- TOC entry 236 (class 1259 OID 16524)
-- Name: siparisler_siparis_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.siparisler_siparis_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3950 (class 0 OID 0)
-- Dependencies: 236
-- Name: siparisler_siparis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.siparisler_siparis_id_seq OWNED BY public.siparisler.siparis_id;


--
-- TOC entry 232 (class 1259 OID 16484)
-- Name: urunler; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.urunler (
    urun_id integer NOT NULL,
    urun_adi character varying(100) NOT NULL,
    birim character varying(20),
    piyasa_fiyati numeric(10,2),
    toptan_fiyati numeric(10,2)
);


--
-- TOC entry 231 (class 1259 OID 16483)
-- Name: urunler_urun_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.urunler_urun_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3951 (class 0 OID 0)
-- Dependencies: 231
-- Name: urunler_urun_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.urunler_urun_id_seq OWNED BY public.urunler.urun_id;


--
-- TOC entry 3726 (class 2604 OID 16464)
-- Name: cuzdan_hareketleri hareket_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cuzdan_hareketleri ALTER COLUMN hareket_id SET DEFAULT nextval('public.cuzdan_hareketleri_hareket_id_seq'::regclass);


--
-- TOC entry 3724 (class 2604 OID 16448)
-- Name: cuzdanlar cuzdan_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cuzdanlar ALTER COLUMN cuzdan_id SET DEFAULT nextval('public.cuzdanlar_cuzdan_id_seq'::regclass);


--
-- TOC entry 3722 (class 2604 OID 16432)
-- Name: gelir_beyanlari beyan_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gelir_beyanlari ALTER COLUMN beyan_id SET DEFAULT nextval('public.gelir_beyanlari_beyan_id_seq'::regclass);


--
-- TOC entry 3728 (class 2604 OID 16478)
-- Name: kategoriler kategori_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.kategoriler ALTER COLUMN kategori_id SET DEFAULT nextval('public.kategoriler_kategori_id_seq'::regclass);


--
-- TOC entry 3719 (class 2604 OID 16411)
-- Name: kullanicilar kullanici_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.kullanicilar ALTER COLUMN kullanici_id SET DEFAULT nextval('public.kullanicilar_kullanici_id_seq'::regclass);


--
-- TOC entry 3718 (class 2604 OID 16402)
-- Name: roller rol_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roller ALTER COLUMN rol_id SET DEFAULT nextval('public.roller_rol_id_seq'::regclass);


--
-- TOC entry 3730 (class 2604 OID 16513)
-- Name: siparis_havuzlari havuz_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.siparis_havuzlari ALTER COLUMN havuz_id SET DEFAULT nextval('public.siparis_havuzlari_havuz_id_seq'::regclass);


--
-- TOC entry 3733 (class 2604 OID 16528)
-- Name: siparisler siparis_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.siparisler ALTER COLUMN siparis_id SET DEFAULT nextval('public.siparisler_siparis_id_seq'::regclass);


--
-- TOC entry 3729 (class 2604 OID 16487)
-- Name: urunler urun_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urunler ALTER COLUMN urun_id SET DEFAULT nextval('public.urunler_urun_id_seq'::regclass);


--
-- TOC entry 3927 (class 0 OID 16461)
-- Dependencies: 228
-- Data for Name: cuzdan_hareketleri; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cuzdan_hareketleri VALUES (1, 1, 'Para Yükleme', 1500.00, '2026-05-17 17:42:19.044076');
INSERT INTO public.cuzdan_hareketleri VALUES (2, 2, 'Para Yükleme', 850.00, '2026-05-17 17:42:19.044076');
INSERT INTO public.cuzdan_hareketleri VALUES (3, 3, 'Para Yükleme', 2200.00, '2026-05-17 17:42:19.044076');


--
-- TOC entry 3925 (class 0 OID 16445)
-- Dependencies: 226
-- Data for Name: cuzdanlar; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cuzdanlar VALUES (1, 2, 1500.00);
INSERT INTO public.cuzdanlar VALUES (2, 3, 850.00);
INSERT INTO public.cuzdanlar VALUES (3, 4, 2200.00);


--
-- TOC entry 3923 (class 0 OID 16429)
-- Dependencies: 224
-- Data for Name: gelir_beyanlari; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.gelir_beyanlari VALUES (1, 2, 17500.00, 4, 'www.siteniz.com/belgeler/ege_gelir.pdf', '2026-05-17 17:42:19.040813');
INSERT INTO public.gelir_beyanlari VALUES (2, 3, 15000.00, 3, 'www.siteniz.com/belgeler/batuhan_gelir.pdf', '2026-05-17 17:42:19.040813');
INSERT INTO public.gelir_beyanlari VALUES (3, 4, 19000.00, 5, 'www.siteniz.com/belgeler/serena_gelir.pdf', '2026-05-17 17:42:19.040813');


--
-- TOC entry 3929 (class 0 OID 16475)
-- Dependencies: 230
-- Data for Name: kategoriler; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.kategoriler VALUES (1, 'Temel Gıda');
INSERT INTO public.kategoriler VALUES (2, 'Kahvaltılık');
INSERT INTO public.kategoriler VALUES (3, 'Et & Tavuk');
INSERT INTO public.kategoriler VALUES (4, 'Süt Ürünleri');
INSERT INTO public.kategoriler VALUES (5, 'Meyve & Sebze');


--
-- TOC entry 3932 (class 0 OID 16492)
-- Dependencies: 233
-- Data for Name: kategoriler_urunler; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.kategoriler_urunler VALUES (1, 1);
INSERT INTO public.kategoriler_urunler VALUES (1, 2);
INSERT INTO public.kategoriler_urunler VALUES (1, 3);
INSERT INTO public.kategoriler_urunler VALUES (1, 5);
INSERT INTO public.kategoriler_urunler VALUES (2, 4);
INSERT INTO public.kategoriler_urunler VALUES (2, 6);
INSERT INTO public.kategoriler_urunler VALUES (4, 6);
INSERT INTO public.kategoriler_urunler VALUES (3, 7);
INSERT INTO public.kategoriler_urunler VALUES (5, 8);


--
-- TOC entry 3921 (class 0 OID 16408)
-- Dependencies: 222
-- Data for Name: kullanicilar; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.kullanicilar VALUES (1, 1, 'Arda', 'Uygur', 'arda@admin.com', 'sifre123', '05551112233', '2026-05-17 17:42:19.038446', true);
INSERT INTO public.kullanicilar VALUES (2, 2, 'Ege Baran', 'Şen', 'ege@musteri.com', 'sifre456', '05559998877', '2026-05-17 17:42:19.038446', true);
INSERT INTO public.kullanicilar VALUES (3, 2, 'Batuhan', 'Demirkol', 'batuhan@musteri.com', 'sifre789', '05554445566', '2026-05-17 17:42:19.038446', true);
INSERT INTO public.kullanicilar VALUES (4, 2, 'Serena', 'Üzümcü', 'serena@musteri.com', 'sifre000', '05557778899', '2026-05-17 17:42:19.038446', true);
INSERT INTO public.kullanicilar VALUES (5, 3, 'Hasan', 'Amca', 'hasan_kooperatif@uretici.com', 'hasan123', '05051234567', '2026-05-17 17:42:19.038446', true);


--
-- TOC entry 3919 (class 0 OID 16399)
-- Dependencies: 220
-- Data for Name: roller; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.roller VALUES (1, 'Admin');
INSERT INTO public.roller VALUES (2, 'Müşteri');
INSERT INTO public.roller VALUES (3, 'Yerel Üretici');
INSERT INTO public.roller VALUES (4, 'Belediye Yetkilisi');


--
-- TOC entry 3934 (class 0 OID 16510)
-- Dependencies: 235
-- Data for Name: siparis_havuzlari; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.siparis_havuzlari VALUES (1, 1, 500.00, 250.00, '2026-05-30', 'Aktif');
INSERT INTO public.siparis_havuzlari VALUES (2, 4, 200.00, 150.00, '2026-05-25', 'Aktif');
INSERT INTO public.siparis_havuzlari VALUES (3, 5, 100.00, 100.00, '2026-05-15', 'Doldu - Siparis Verildi');
INSERT INTO public.siparis_havuzlari VALUES (4, 7, 150.00, 45.00, '2026-05-20', 'Aktif');


--
-- TOC entry 3936 (class 0 OID 16525)
-- Dependencies: 237
-- Data for Name: siparisler; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.siparisler VALUES (1, 2, 460.00, '2026-05-17 17:42:19.051912');
INSERT INTO public.siparisler VALUES (2, 3, 320.00, '2026-05-17 17:42:19.051912');
INSERT INTO public.siparisler VALUES (3, 4, 850.00, '2026-05-17 17:42:19.051912');


--
-- TOC entry 3937 (class 0 OID 16538)
-- Dependencies: 238
-- Data for Name: siparisler_siparis_havuzlari; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.siparisler_siparis_havuzlari VALUES (1, 1, 2.00);
INSERT INTO public.siparisler_siparis_havuzlari VALUES (1, 2, 1.00);
INSERT INTO public.siparisler_siparis_havuzlari VALUES (2, 4, 1.00);
INSERT INTO public.siparisler_siparis_havuzlari VALUES (3, 3, 1.00);


--
-- TOC entry 3931 (class 0 OID 16484)
-- Dependencies: 232
-- Data for Name: urunler; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.urunler VALUES (1, 'Osmancık Baldo Pirinç 5kg', 'Adet', 250.00, 180.00);
INSERT INTO public.urunler VALUES (2, 'Kırmızı Mercimek 2.5kg', 'Adet', 120.00, 85.00);
INSERT INTO public.urunler VALUES (3, 'Tam Buğday Unu 5kg', 'Adet', 90.00, 65.00);
INSERT INTO public.urunler VALUES (4, 'Organik Köy Yumurtası 30lu', 'Koli', 140.00, 100.00);
INSERT INTO public.urunler VALUES (5, 'Yerli Üretim Sızma Zeytinyağı 5L', 'Teneke', 1200.00, 850.00);
INSERT INTO public.urunler VALUES (6, 'Tam Yağlı Köy Peyniri 1kg', 'Kg', 200.00, 140.00);
INSERT INTO public.urunler VALUES (7, 'Dana Kıyma (Az Yağlı) 1kg', 'Kg', 450.00, 320.00);
INSERT INTO public.urunler VALUES (8, 'Taze Köy Domatesi', 'Kg', 35.00, 20.00);


--
-- TOC entry 3952 (class 0 OID 0)
-- Dependencies: 227
-- Name: cuzdan_hareketleri_hareket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cuzdan_hareketleri_hareket_id_seq', 3, true);


--
-- TOC entry 3953 (class 0 OID 0)
-- Dependencies: 225
-- Name: cuzdanlar_cuzdan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cuzdanlar_cuzdan_id_seq', 3, true);


--
-- TOC entry 3954 (class 0 OID 0)
-- Dependencies: 223
-- Name: gelir_beyanlari_beyan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.gelir_beyanlari_beyan_id_seq', 3, true);


--
-- TOC entry 3955 (class 0 OID 0)
-- Dependencies: 229
-- Name: kategoriler_kategori_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.kategoriler_kategori_id_seq', 5, true);


--
-- TOC entry 3956 (class 0 OID 0)
-- Dependencies: 221
-- Name: kullanicilar_kullanici_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.kullanicilar_kullanici_id_seq', 5, true);


--
-- TOC entry 3957 (class 0 OID 0)
-- Dependencies: 219
-- Name: roller_rol_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.roller_rol_id_seq', 4, true);


--
-- TOC entry 3958 (class 0 OID 0)
-- Dependencies: 234
-- Name: siparis_havuzlari_havuz_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.siparis_havuzlari_havuz_id_seq', 4, true);


--
-- TOC entry 3959 (class 0 OID 0)
-- Dependencies: 236
-- Name: siparisler_siparis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.siparisler_siparis_id_seq', 3, true);


--
-- TOC entry 3960 (class 0 OID 0)
-- Dependencies: 231
-- Name: urunler_urun_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.urunler_urun_id_seq', 8, true);


--
-- TOC entry 3748 (class 2606 OID 16468)
-- Name: cuzdan_hareketleri cuzdan_hareketleri_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cuzdan_hareketleri
    ADD CONSTRAINT cuzdan_hareketleri_pkey PRIMARY KEY (hareket_id);


--
-- TOC entry 3744 (class 2606 OID 16454)
-- Name: cuzdanlar cuzdanlar_kullanici_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cuzdanlar
    ADD CONSTRAINT cuzdanlar_kullanici_id_key UNIQUE (kullanici_id);


--
-- TOC entry 3746 (class 2606 OID 16452)
-- Name: cuzdanlar cuzdanlar_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cuzdanlar
    ADD CONSTRAINT cuzdanlar_pkey PRIMARY KEY (cuzdan_id);


--
-- TOC entry 3742 (class 2606 OID 16438)
-- Name: gelir_beyanlari gelir_beyanlari_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gelir_beyanlari
    ADD CONSTRAINT gelir_beyanlari_pkey PRIMARY KEY (beyan_id);


--
-- TOC entry 3750 (class 2606 OID 16482)
-- Name: kategoriler kategoriler_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.kategoriler
    ADD CONSTRAINT kategoriler_pkey PRIMARY KEY (kategori_id);


--
-- TOC entry 3754 (class 2606 OID 16498)
-- Name: kategoriler_urunler kategoriler_urunler_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.kategoriler_urunler
    ADD CONSTRAINT kategoriler_urunler_pkey PRIMARY KEY (kategori_id, urun_id);


--
-- TOC entry 3738 (class 2606 OID 16422)
-- Name: kullanicilar kullanicilar_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.kullanicilar
    ADD CONSTRAINT kullanicilar_email_key UNIQUE (email);


--
-- TOC entry 3740 (class 2606 OID 16420)
-- Name: kullanicilar kullanicilar_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.kullanicilar
    ADD CONSTRAINT kullanicilar_pkey PRIMARY KEY (kullanici_id);


--
-- TOC entry 3736 (class 2606 OID 16406)
-- Name: roller roller_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roller
    ADD CONSTRAINT roller_pkey PRIMARY KEY (rol_id);


--
-- TOC entry 3756 (class 2606 OID 16518)
-- Name: siparis_havuzlari siparis_havuzlari_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.siparis_havuzlari
    ADD CONSTRAINT siparis_havuzlari_pkey PRIMARY KEY (havuz_id);


--
-- TOC entry 3758 (class 2606 OID 16532)
-- Name: siparisler siparisler_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.siparisler
    ADD CONSTRAINT siparisler_pkey PRIMARY KEY (siparis_id);


--
-- TOC entry 3760 (class 2606 OID 16544)
-- Name: siparisler_siparis_havuzlari siparisler_siparis_havuzlari_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.siparisler_siparis_havuzlari
    ADD CONSTRAINT siparisler_siparis_havuzlari_pkey PRIMARY KEY (siparis_id, havuz_id);


--
-- TOC entry 3752 (class 2606 OID 16491)
-- Name: urunler urunler_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urunler
    ADD CONSTRAINT urunler_pkey PRIMARY KEY (urun_id);


--
-- TOC entry 3764 (class 2606 OID 16469)
-- Name: cuzdan_hareketleri cuzdan_hareketleri_cuzdan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cuzdan_hareketleri
    ADD CONSTRAINT cuzdan_hareketleri_cuzdan_id_fkey FOREIGN KEY (cuzdan_id) REFERENCES public.cuzdanlar(cuzdan_id);


--
-- TOC entry 3763 (class 2606 OID 16455)
-- Name: cuzdanlar cuzdanlar_kullanici_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cuzdanlar
    ADD CONSTRAINT cuzdanlar_kullanici_id_fkey FOREIGN KEY (kullanici_id) REFERENCES public.kullanicilar(kullanici_id);


--
-- TOC entry 3762 (class 2606 OID 16439)
-- Name: gelir_beyanlari gelir_beyanlari_kullanici_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.gelir_beyanlari
    ADD CONSTRAINT gelir_beyanlari_kullanici_id_fkey FOREIGN KEY (kullanici_id) REFERENCES public.kullanicilar(kullanici_id);


--
-- TOC entry 3765 (class 2606 OID 16499)
-- Name: kategoriler_urunler kategoriler_urunler_kategori_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.kategoriler_urunler
    ADD CONSTRAINT kategoriler_urunler_kategori_id_fkey FOREIGN KEY (kategori_id) REFERENCES public.kategoriler(kategori_id);


--
-- TOC entry 3766 (class 2606 OID 16504)
-- Name: kategoriler_urunler kategoriler_urunler_urun_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.kategoriler_urunler
    ADD CONSTRAINT kategoriler_urunler_urun_id_fkey FOREIGN KEY (urun_id) REFERENCES public.urunler(urun_id);


--
-- TOC entry 3761 (class 2606 OID 16423)
-- Name: kullanicilar kullanicilar_rol_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.kullanicilar
    ADD CONSTRAINT kullanicilar_rol_id_fkey FOREIGN KEY (rol_id) REFERENCES public.roller(rol_id);


--
-- TOC entry 3767 (class 2606 OID 16519)
-- Name: siparis_havuzlari siparis_havuzlari_urun_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.siparis_havuzlari
    ADD CONSTRAINT siparis_havuzlari_urun_id_fkey FOREIGN KEY (urun_id) REFERENCES public.urunler(urun_id);


--
-- TOC entry 3768 (class 2606 OID 16533)
-- Name: siparisler siparisler_kullanici_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.siparisler
    ADD CONSTRAINT siparisler_kullanici_id_fkey FOREIGN KEY (kullanici_id) REFERENCES public.kullanicilar(kullanici_id);


--
-- TOC entry 3769 (class 2606 OID 16550)
-- Name: siparisler_siparis_havuzlari siparisler_siparis_havuzlari_havuz_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.siparisler_siparis_havuzlari
    ADD CONSTRAINT siparisler_siparis_havuzlari_havuz_id_fkey FOREIGN KEY (havuz_id) REFERENCES public.siparis_havuzlari(havuz_id);


--
-- TOC entry 3770 (class 2606 OID 16545)
-- Name: siparisler_siparis_havuzlari siparisler_siparis_havuzlari_siparis_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.siparisler_siparis_havuzlari
    ADD CONSTRAINT siparisler_siparis_havuzlari_siparis_id_fkey FOREIGN KEY (siparis_id) REFERENCES public.siparisler(siparis_id);


-- Completed on 2026-05-17 18:15:32 +03

--
-- PostgreSQL database dump complete
--

\unrestrict ZrTYJeeLQwUUOz1cJOgrcehAwgRZrDa79DCkl8QyXpi1185zYB25UgCWtLw34C8

