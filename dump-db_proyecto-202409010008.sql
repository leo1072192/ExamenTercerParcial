PGDMP                       |            db_proyecto    16.4    16.4 2    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16456    db_proyecto    DATABASE     �   CREATE DATABASE db_proyecto WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Ecuador.1252';
    DROP DATABASE db_proyecto;
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4            �            1259    16529    Empleado    TABLE     �   CREATE TABLE public."Empleado" (
    id integer NOT NULL,
    nombre text NOT NULL,
    apellido text NOT NULL,
    "correoElectronico" text NOT NULL,
    telefono text
);
    DROP TABLE public."Empleado";
       public         heap    postgres    false    4            �            1259    16528    Empleado_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Empleado_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Empleado_id_seq";
       public          postgres    false    221    4            �           0    0    Empleado_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."Empleado_id_seq" OWNED BY public."Empleado".id;
          public          postgres    false    220            �            1259    16510    Proyecto    TABLE     �   CREATE TABLE public."Proyecto" (
    id integer NOT NULL,
    nombre text NOT NULL,
    descripcion text,
    "fechaInicio" timestamp(3) without time zone,
    "fechaFin" timestamp(3) without time zone
);
    DROP TABLE public."Proyecto";
       public         heap    postgres    false    4            �            1259    16509    Proyecto_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Proyecto_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Proyecto_id_seq";
       public          postgres    false    4    217            �           0    0    Proyecto_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."Proyecto_id_seq" OWNED BY public."Proyecto".id;
          public          postgres    false    216            �            1259    16519    Tarea    TABLE     �   CREATE TABLE public."Tarea" (
    id integer NOT NULL,
    titulo text NOT NULL,
    descripcion text,
    "fechaLimite" timestamp(3) without time zone,
    estado text DEFAULT 'pendiente'::text NOT NULL,
    "proyectoId" integer NOT NULL
);
    DROP TABLE public."Tarea";
       public         heap    postgres    false    4            �            1259    16518    Tarea_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Tarea_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Tarea_id_seq";
       public          postgres    false    4    219            �           0    0    Tarea_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public."Tarea_id_seq" OWNED BY public."Tarea".id;
          public          postgres    false    218            �            1259    16538    TareasEmpleados    TABLE     �   CREATE TABLE public."TareasEmpleados" (
    id integer NOT NULL,
    "tareaId" integer NOT NULL,
    "empleadoId" integer NOT NULL
);
 %   DROP TABLE public."TareasEmpleados";
       public         heap    postgres    false    4            �            1259    16537    TareasEmpleados_id_seq    SEQUENCE     �   CREATE SEQUENCE public."TareasEmpleados_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."TareasEmpleados_id_seq";
       public          postgres    false    4    223            �           0    0    TareasEmpleados_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."TareasEmpleados_id_seq" OWNED BY public."TareasEmpleados".id;
          public          postgres    false    222            �            1259    16769    User    TABLE     	  CREATE TABLE public."User" (
    id integer NOT NULL,
    username text NOT NULL,
    password text NOT NULL,
    email text NOT NULL,
    role text DEFAULT 'user'::text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
    DROP TABLE public."User";
       public         heap    postgres    false    4            �            1259    16768    User_id_seq    SEQUENCE     �   CREATE SEQUENCE public."User_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."User_id_seq";
       public          postgres    false    225    4            �           0    0    User_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."User_id_seq" OWNED BY public."User".id;
          public          postgres    false    224            �            1259    16498    _prisma_migrations    TABLE     �  CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);
 &   DROP TABLE public._prisma_migrations;
       public         heap    postgres    false    4            7           2604    16532    Empleado id    DEFAULT     n   ALTER TABLE ONLY public."Empleado" ALTER COLUMN id SET DEFAULT nextval('public."Empleado_id_seq"'::regclass);
 <   ALTER TABLE public."Empleado" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    221    221            4           2604    16513    Proyecto id    DEFAULT     n   ALTER TABLE ONLY public."Proyecto" ALTER COLUMN id SET DEFAULT nextval('public."Proyecto_id_seq"'::regclass);
 <   ALTER TABLE public."Proyecto" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            5           2604    16522    Tarea id    DEFAULT     h   ALTER TABLE ONLY public."Tarea" ALTER COLUMN id SET DEFAULT nextval('public."Tarea_id_seq"'::regclass);
 9   ALTER TABLE public."Tarea" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219            8           2604    16541    TareasEmpleados id    DEFAULT     |   ALTER TABLE ONLY public."TareasEmpleados" ALTER COLUMN id SET DEFAULT nextval('public."TareasEmpleados_id_seq"'::regclass);
 C   ALTER TABLE public."TareasEmpleados" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    222    223            9           2604    16772    User id    DEFAULT     f   ALTER TABLE ONLY public."User" ALTER COLUMN id SET DEFAULT nextval('public."User_id_seq"'::regclass);
 8   ALTER TABLE public."User" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    225    225            �          0    16529    Empleado 
   TABLE DATA           Y   COPY public."Empleado" (id, nombre, apellido, "correoElectronico", telefono) FROM stdin;
    public          postgres    false    221   `9       �          0    16510    Proyecto 
   TABLE DATA           X   COPY public."Proyecto" (id, nombre, descripcion, "fechaInicio", "fechaFin") FROM stdin;
    public          postgres    false    217   }9       �          0    16519    Tarea 
   TABLE DATA           _   COPY public."Tarea" (id, titulo, descripcion, "fechaLimite", estado, "proyectoId") FROM stdin;
    public          postgres    false    219   �9       �          0    16538    TareasEmpleados 
   TABLE DATA           H   COPY public."TareasEmpleados" (id, "tareaId", "empleadoId") FROM stdin;
    public          postgres    false    223   :       �          0    16769    User 
   TABLE DATA           R   COPY public."User" (id, username, password, email, role, "createdAt") FROM stdin;
    public          postgres    false    225   2:       �          0    16498    _prisma_migrations 
   TABLE DATA           �   COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
    public          postgres    false    215   �:       �           0    0    Empleado_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Empleado_id_seq"', 1, false);
          public          postgres    false    220            �           0    0    Proyecto_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."Proyecto_id_seq"', 2, true);
          public          postgres    false    216            �           0    0    Tarea_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public."Tarea_id_seq"', 1, false);
          public          postgres    false    218            �           0    0    TareasEmpleados_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."TareasEmpleados_id_seq"', 1, false);
          public          postgres    false    222            �           0    0    User_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public."User_id_seq"', 1, true);
          public          postgres    false    224            D           2606    16536    Empleado Empleado_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Empleado"
    ADD CONSTRAINT "Empleado_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Empleado" DROP CONSTRAINT "Empleado_pkey";
       public            postgres    false    221            ?           2606    16517    Proyecto Proyecto_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Proyecto"
    ADD CONSTRAINT "Proyecto_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Proyecto" DROP CONSTRAINT "Proyecto_pkey";
       public            postgres    false    217            A           2606    16527    Tarea Tarea_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Tarea"
    ADD CONSTRAINT "Tarea_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Tarea" DROP CONSTRAINT "Tarea_pkey";
       public            postgres    false    219            F           2606    16543 $   TareasEmpleados TareasEmpleados_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public."TareasEmpleados"
    ADD CONSTRAINT "TareasEmpleados_pkey" PRIMARY KEY (id);
 R   ALTER TABLE ONLY public."TareasEmpleados" DROP CONSTRAINT "TareasEmpleados_pkey";
       public            postgres    false    223            I           2606    16778    User User_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_pkey";
       public            postgres    false    225            =           2606    16506 *   _prisma_migrations _prisma_migrations_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public._prisma_migrations DROP CONSTRAINT _prisma_migrations_pkey;
       public            postgres    false    215            B           1259    16544    Empleado_correoElectronico_key    INDEX     m   CREATE UNIQUE INDEX "Empleado_correoElectronico_key" ON public."Empleado" USING btree ("correoElectronico");
 4   DROP INDEX public."Empleado_correoElectronico_key";
       public            postgres    false    221            G           1259    16780    User_email_key    INDEX     K   CREATE UNIQUE INDEX "User_email_key" ON public."User" USING btree (email);
 $   DROP INDEX public."User_email_key";
       public            postgres    false    225            J           1259    16779    User_username_key    INDEX     Q   CREATE UNIQUE INDEX "User_username_key" ON public."User" USING btree (username);
 '   DROP INDEX public."User_username_key";
       public            postgres    false    225            K           2606    16545    Tarea Tarea_proyectoId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Tarea"
    ADD CONSTRAINT "Tarea_proyectoId_fkey" FOREIGN KEY ("proyectoId") REFERENCES public."Proyecto"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 I   ALTER TABLE ONLY public."Tarea" DROP CONSTRAINT "Tarea_proyectoId_fkey";
       public          postgres    false    4671    219    217            L           2606    16555 /   TareasEmpleados TareasEmpleados_empleadoId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."TareasEmpleados"
    ADD CONSTRAINT "TareasEmpleados_empleadoId_fkey" FOREIGN KEY ("empleadoId") REFERENCES public."Empleado"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 ]   ALTER TABLE ONLY public."TareasEmpleados" DROP CONSTRAINT "TareasEmpleados_empleadoId_fkey";
       public          postgres    false    223    4676    221            M           2606    16550 ,   TareasEmpleados TareasEmpleados_tareaId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."TareasEmpleados"
    ADD CONSTRAINT "TareasEmpleados_tareaId_fkey" FOREIGN KEY ("tareaId") REFERENCES public."Tarea"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 Z   ALTER TABLE ONLY public."TareasEmpleados" DROP CONSTRAINT "TareasEmpleados_tareaId_fkey";
       public          postgres    false    223    4673    219            �      x������ � �      �   k   x�3�tI-N,*����WHIUp,��LNL�<�9�3�(�25�$_� �(Q!5(���4/Q!�4�,Q!�I�����D��R��P���
� b�F�Ɔ
F�V��@����� �&�      �      x������ � �      �      x������ � �      �   q   x�3��I��T1JR14P�7s�r	LL6L7�*s�K,/KM,uͶ�)�,r�H1�p)�7����+�(1���JPZ\�X���id`d�k`�k`�``dejiel�gl`����� �Y�      �   �   x�m�[jAE��W�T��Z:��
�zX0���tg���z�l�;��FOL�ɦ�4��C)Eci��PB��C,j}�������ѣa��%���ઠ`e! N`)�����i��@~Sp@ p���v�Z���<�I��|�p5W�$�e&v�dV,����xz�K� F��u�0��P`�|8�1��q���Pc8
�#�G�t�����g����g|��#^z�?Ed�{\�u] ��_9     