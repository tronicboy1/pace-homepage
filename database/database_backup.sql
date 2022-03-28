PGDMP      "                    z            postgres    14.2 (Debian 14.2-1.pgdg110+1)    14.2     	           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            
           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    13757    postgres    DATABASE     \   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';
    DROP DATABASE postgres;
                postgres    false                       0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    3340            �            1259    16406 	   inquiries    TABLE     T  CREATE TABLE public.inquiries (
    inquiry_id integer NOT NULL,
    body character varying(1000),
    email character varying(255) NOT NULL,
    phone character varying(255),
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.inquiries;
       public         heap    postgres    false            �            1259    16405    inquiries_inquiry_id_seq    SEQUENCE     �   CREATE SEQUENCE public.inquiries_inquiry_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.inquiries_inquiry_id_seq;
       public          postgres    false    214                       0    0    inquiries_inquiry_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.inquiries_inquiry_id_seq OWNED BY public.inquiries.inquiry_id;
          public          postgres    false    213            �            1259    16385    posts    TABLE     �   CREATE TABLE public.posts (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    body character varying,
    picture character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
    DROP TABLE public.posts;
       public         heap    postgres    false            �            1259    16384    posts_id_seq    SEQUENCE     �   CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.posts_id_seq;
       public          postgres    false    210                       0    0    posts_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;
          public          postgres    false    209            �            1259    16394    users    TABLE     \  CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(55),
    pass_hash character varying(255),
    created_at timestamp without time zone DEFAULT now(),
    token character varying,
    instagram_pass character varying,
    instagram_user character varying,
    email character varying,
    is_admin boolean
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    16393    users_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_user_id_seq;
       public          postgres    false    212                       0    0    users_user_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;
          public          postgres    false    211            l           2604    16409    inquiries inquiry_id    DEFAULT     |   ALTER TABLE ONLY public.inquiries ALTER COLUMN inquiry_id SET DEFAULT nextval('public.inquiries_inquiry_id_seq'::regclass);
 C   ALTER TABLE public.inquiries ALTER COLUMN inquiry_id DROP DEFAULT;
       public          postgres    false    214    213    214            i           2604    16388    posts id    DEFAULT     d   ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);
 7   ALTER TABLE public.posts ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    210    210            j           2604    16397    users user_id    DEFAULT     n   ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    212    211    212                      0    16406 	   inquiries 
   TABLE DATA           f   COPY public.inquiries (inquiry_id, body, email, phone, first_name, last_name, created_at) FROM stdin;
    public          postgres    false    214   �                 0    16385    posts 
   TABLE DATA           Q   COPY public.posts (id, title, body, picture, created_at, updated_at) FROM stdin;
    public          postgres    false    210   g                 0    16394    users 
   TABLE DATA           �   COPY public.users (user_id, username, pass_hash, created_at, token, instagram_pass, instagram_user, email, is_admin) FROM stdin;
    public          postgres    false    212   �%                  0    0    inquiries_inquiry_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.inquiries_inquiry_id_seq', 2, true);
          public          postgres    false    213                       0    0    posts_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.posts_id_seq', 24, true);
          public          postgres    false    209                       0    0    users_user_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.users_user_id_seq', 1, true);
          public          postgres    false    211            u           2606    16414    inquiries inquiries_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.inquiries
    ADD CONSTRAINT inquiries_pkey PRIMARY KEY (inquiry_id);
 B   ALTER TABLE ONLY public.inquiries DROP CONSTRAINT inquiries_pkey;
       public            postgres    false    214            o           2606    16392    posts posts_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.posts DROP CONSTRAINT posts_pkey;
       public            postgres    false    210            q           2606    16404    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    212            s           2606    16400    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    212               ^   x^3��T(O�+Qp�OKKM�,I-.�`Vr~.'�obNr~N.g��������������Y����qQ`������������%W� !n)2         .  x^�Z�n$�=����jDDƒ�7�0_d��K�Bip�{�"gdv��#��t+Xۋ�Y�w8�8?>�������=���������<�k���wB"�S�^�D�b�B�,Ja���6����Zs��?���4��ww=�r����??<������%�Y�2���ע-�������[}8�Oϟ�=Nm>?ϧ���1O�V����/�"|IqV�"z��Z����ӏ�Ͽ̗���r5���Y\�]m���;y�8�L�ƶ}�Ϣ�|�j��s� �Η]ފ6�o[�/g�B_goD��S}������%Y�L�*�Lvx<<χ�Ӈ�4oC�B"�����f_�6�=Xۜ�8{����'�Sr�W���7�V\�C78kr�Bٳ}]@�#�����w��z9����"V�����C��̷�m�o�x��z����o3���NT�R��׀AY���WοfD��5)"��IBIE�)J��':§��� ��J�׻�U��c�X+}�Q�-�Z��Q�!n��K&p0�E�=M�+�͙:��_/��*�Ҭ�.���X��J�5\�|Y7���R������.�E��y�x׊��Ds�AZCd��B�h�X�U�PT�+4�Hp�PMjyA�U�S��kYL��:9��c��(�E�b�B�w�hq�pD[���cFkMś��A�
o� ��>��5s��6�|z^2͚��Tk�Z�;�W��[]<fA�S�2���.��=��s�����6��������VH*�j#K3_�wq*��.Q�Xgh�M�H��(�3f�g��r�Yp�u� ���ކ/�*l,�R�j���j�d�p�9{E�\rMQ�T��U�ME@��ܺ-nQq�F*}y���,YD��p�s�i�='fw��D Jk<jV2�>��F���ǌ� 4d��8�|.E��p�J\��̭v$��l*����J�savws5rBu �itN����gWZM�^�dD���<9��{b+�xs� B�~���5�i��޺&��<f�)���i�:pudh��zM(���`��ꔁH5��pv�Z[����C뒊4�(Q-��Z Y�@:�4G��ʠ�*�h�;��2�����$�P��1���<�������*��jGa �)�W�5��<��Vܤ:+jʣ���Z����U�1�>�
�P2Q��2&�GH)׋�Ĥ ���BA��҉��#4-������T6��i0
�'�7��Vg�f��n6]�$P�E0��gd��,�X�2�W�6L���'B0h��Tz3�!�Z�TkB��tQrT�u��Ԁ����p��Ebr���x�*p k���c¯���ݐ���>A�fh�+�z�!��3�;u���Ԓ.^��6�z�$X�$�;��;I�i�A���O�hh�m�5��/h
*��:"�dW�,��=
��Z����@�b	�����h��ޜP���zbP�^p�}uG1'�cG��d���=��#@=�AQ1�O�Л��w��)_�0�s��`C����������B��%�h�_ۿ�[f;�,n�oE����]3�h������W��c_q�+�}ű�8��f_���d�� �J���9�x�Հ�*��|s\q������h�G�?�����M�/�I��q�,���Z�������":=�B܋�<�9����v������h���狕3K��N��ݿmr;��gℳ|)�������~��������G�O�����bT��8���h�8���&F�C,�ۧ��~LS��T�1xLS��t*�|zz�qS���|�}��*�~:o��_U�         "  x^5�ˎ�0 E���p���΀8-P�JL`e
 |�������I.T���2@� ���=.|�����,4��(�]yR�|�"���\�]C��<t�4��� ��hCd| c����A���'^&b%(��d�<H�ŉIt�Wߤ�Q/��m,�g�끴�8���hD؀d�e�1������Io�k.V�1+^G��PP�8�sy�x�Uu�t�B'(ɭ�Z]k�	��n��~ij��o�f�6��p�w�v��N\���xA�n�;�C�QD�xFʉ�SO#UU� �Yd�     