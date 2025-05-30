PGDMP  %                    }            bd_productos    17.4    17.4 2    4           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            5           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            6           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            7           1262    16388    bd_productos    DATABASE     �   CREATE DATABASE bd_productos WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Ecuador.1252';
    DROP DATABASE bd_productos;
                     postgres    false                        2615    16552 	   auditoria    SCHEMA        CREATE SCHEMA auditoria;
    DROP SCHEMA auditoria;
                     postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                     pg_database_owner    false            8           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                        pg_database_owner    false    4            �            1255    16563    fn_log_audit()    FUNCTION     j  CREATE FUNCTION public.fn_log_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF (TG_OP = 'DELETE') THEN
    INSERT INTO "auditoria".tb_auditoria ("tabla_aud", "operacion_aud", "valoranterior_aud", "valornuevo_aud", "fecha_aud", "usuario_aud")
           VALUES (TG_TABLE_NAME, 'D', OLD, NULL, now(), USER);
    RETURN OLD;
  ELSIF (TG_OP = 'UPDATE') THEN
    INSERT INTO "auditoria".tb_auditoria ("tabla_aud", "operacion_aud", "valoranterior_aud", "valornuevo_aud", "fecha_aud", "usuario_aud")
           VALUES (TG_TABLE_NAME, 'U', OLD, NEW, now(), USER);
    RETURN NEW;
  ELSIF (TG_OP = 'INSERT') THEN
    INSERT INTO "auditoria".tb_auditoria ("tabla_aud", "operacion_aud", "valoranterior_aud", "valornuevo_aud", "fecha_aud", "usuario_aud")
           VALUES (TG_TABLE_NAME, 'I', NULL, NEW, now(), USER);
    RETURN NEW;
  END IF;
  RETURN NULL;
END;
$$;
 %   DROP FUNCTION public.fn_log_audit();
       public               postgres    false    4            �            1259    16554    tb_auditoria    TABLE       CREATE TABLE auditoria.tb_auditoria (
    id_aud integer NOT NULL,
    tabla_aud text,
    operacion_aud text,
    valoranterior_aud text,
    valornuevo_aud text,
    fecha_aud date,
    usuario_aud text,
    esquema_aud text,
    activar_aud boolean,
    trigger_aud boolean
);
 #   DROP TABLE auditoria.tb_auditoria;
    	   auditoria         heap r       postgres    false    6            �            1259    16553    tb_auditoria_id_aud_seq    SEQUENCE     �   CREATE SEQUENCE auditoria.tb_auditoria_id_aud_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE auditoria.tb_auditoria_id_aud_seq;
    	   auditoria               postgres    false    232    6            9           0    0    tb_auditoria_id_aud_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE auditoria.tb_auditoria_id_aud_seq OWNED BY auditoria.tb_auditoria.id_aud;
       	   auditoria               postgres    false    231            �            1259    16412    tb_categoria    TABLE     \   CREATE TABLE public.tb_categoria (
    id_cat integer NOT NULL,
    descripcion_cat text
);
     DROP TABLE public.tb_categoria;
       public         heap r       postgres    false    4            �            1259    16417    tb_categoria_id_cat_seq    SEQUENCE     �   CREATE SEQUENCE public.tb_categoria_id_cat_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.tb_categoria_id_cat_seq;
       public               postgres    false    218    4            :           0    0    tb_categoria_id_cat_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.tb_categoria_id_cat_seq OWNED BY public.tb_categoria.id_cat;
          public               postgres    false    219            �            1259    16418    tb_estadocivil    TABLE     ^   CREATE TABLE public.tb_estadocivil (
    id_est integer NOT NULL,
    descripcion_est text
);
 "   DROP TABLE public.tb_estadocivil;
       public         heap r       postgres    false    4            �            1259    16423    tb_estadocivil_id_est_seq    SEQUENCE     �   CREATE SEQUENCE public.tb_estadocivil_id_est_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.tb_estadocivil_id_est_seq;
       public               postgres    false    220    4            ;           0    0    tb_estadocivil_id_est_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.tb_estadocivil_id_est_seq OWNED BY public.tb_estadocivil.id_est;
          public               postgres    false    221            �            1259    16424 	   tb_pagina    TABLE     l   CREATE TABLE public.tb_pagina (
    id_pag integer NOT NULL,
    descripcion_pag text,
    path_pag text
);
    DROP TABLE public.tb_pagina;
       public         heap r       postgres    false    4            �            1259    16429    tb_parametros    TABLE     q   CREATE TABLE public.tb_parametros (
    id_par integer NOT NULL,
    descripcion_par text,
    valor_par text
);
 !   DROP TABLE public.tb_parametros;
       public         heap r       postgres    false    4            �            1259    16434 	   tb_perfil    TABLE     Y   CREATE TABLE public.tb_perfil (
    id_per integer NOT NULL,
    descripcion_per text
);
    DROP TABLE public.tb_perfil;
       public         heap r       postgres    false    4            �            1259    16439    tb_perfilpagina    TABLE     p   CREATE TABLE public.tb_perfilpagina (
    id_perpag integer NOT NULL,
    id_per integer,
    id_pag integer
);
 #   DROP TABLE public.tb_perfilpagina;
       public         heap r       postgres    false    4            �            1259    16442    tb_perfilpagina_id_perpag_seq    SEQUENCE     �   CREATE SEQUENCE public.tb_perfilpagina_id_perpag_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.tb_perfilpagina_id_perpag_seq;
       public               postgres    false    4    225            <           0    0    tb_perfilpagina_id_perpag_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.tb_perfilpagina_id_perpag_seq OWNED BY public.tb_perfilpagina.id_perpag;
          public               postgres    false    226            �            1259    16443    tb_producto    TABLE     �   CREATE TABLE public.tb_producto (
    id_pr integer NOT NULL,
    id_cat integer,
    nombre_pr text,
    cantidad_pr integer,
    precio_pr double precision,
    foto_pr text
);
    DROP TABLE public.tb_producto;
       public         heap r       postgres    false    4            �            1259    16448    tb_producto_id_pr_seq    SEQUENCE     �   CREATE SEQUENCE public.tb_producto_id_pr_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.tb_producto_id_pr_seq;
       public               postgres    false    4    227            =           0    0    tb_producto_id_pr_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.tb_producto_id_pr_seq OWNED BY public.tb_producto.id_pr;
          public               postgres    false    228            �            1259    16486 
   tb_usuario    TABLE     �   CREATE TABLE public.tb_usuario (
    id_us integer NOT NULL,
    id_per integer,
    id_est integer,
    nombre_us text,
    cedula_us text,
    correo_us text,
    clave_us text,
    estado integer DEFAULT 1
);
    DROP TABLE public.tb_usuario;
       public         heap r       postgres    false    4            �            1259    16491    tb_usuario_id_us_seq    SEQUENCE     �   CREATE SEQUENCE public.tb_usuario_id_us_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.tb_usuario_id_us_seq;
       public               postgres    false    229    4            >           0    0    tb_usuario_id_us_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.tb_usuario_id_us_seq OWNED BY public.tb_usuario.id_us;
          public               postgres    false    230            �           2604    16557    tb_auditoria id_aud    DEFAULT     �   ALTER TABLE ONLY auditoria.tb_auditoria ALTER COLUMN id_aud SET DEFAULT nextval('auditoria.tb_auditoria_id_aud_seq'::regclass);
 E   ALTER TABLE auditoria.tb_auditoria ALTER COLUMN id_aud DROP DEFAULT;
    	   auditoria               postgres    false    231    232    232            ~           2604    16492    tb_categoria id_cat    DEFAULT     z   ALTER TABLE ONLY public.tb_categoria ALTER COLUMN id_cat SET DEFAULT nextval('public.tb_categoria_id_cat_seq'::regclass);
 B   ALTER TABLE public.tb_categoria ALTER COLUMN id_cat DROP DEFAULT;
       public               postgres    false    219    218                       2604    16493    tb_estadocivil id_est    DEFAULT     ~   ALTER TABLE ONLY public.tb_estadocivil ALTER COLUMN id_est SET DEFAULT nextval('public.tb_estadocivil_id_est_seq'::regclass);
 D   ALTER TABLE public.tb_estadocivil ALTER COLUMN id_est DROP DEFAULT;
       public               postgres    false    221    220            �           2604    16494    tb_perfilpagina id_perpag    DEFAULT     �   ALTER TABLE ONLY public.tb_perfilpagina ALTER COLUMN id_perpag SET DEFAULT nextval('public.tb_perfilpagina_id_perpag_seq'::regclass);
 H   ALTER TABLE public.tb_perfilpagina ALTER COLUMN id_perpag DROP DEFAULT;
       public               postgres    false    226    225            �           2604    16495    tb_producto id_pr    DEFAULT     v   ALTER TABLE ONLY public.tb_producto ALTER COLUMN id_pr SET DEFAULT nextval('public.tb_producto_id_pr_seq'::regclass);
 @   ALTER TABLE public.tb_producto ALTER COLUMN id_pr DROP DEFAULT;
       public               postgres    false    228    227            �           2604    16496    tb_usuario id_us    DEFAULT     t   ALTER TABLE ONLY public.tb_usuario ALTER COLUMN id_us SET DEFAULT nextval('public.tb_usuario_id_us_seq'::regclass);
 ?   ALTER TABLE public.tb_usuario ALTER COLUMN id_us DROP DEFAULT;
       public               postgres    false    230    229            1          0    16554    tb_auditoria 
   TABLE DATA              	   auditoria               postgres    false    232   K6       #          0    16412    tb_categoria 
   TABLE DATA                 public               postgres    false    218   K9       %          0    16418    tb_estadocivil 
   TABLE DATA                 public               postgres    false    220   �9       '          0    16424 	   tb_pagina 
   TABLE DATA                 public               postgres    false    222   l:       (          0    16429    tb_parametros 
   TABLE DATA                 public               postgres    false    223   _;       )          0    16434 	   tb_perfil 
   TABLE DATA                 public               postgres    false    224   y;       *          0    16439    tb_perfilpagina 
   TABLE DATA                 public               postgres    false    225   �;       ,          0    16443    tb_producto 
   TABLE DATA                 public               postgres    false    227   t<       .          0    16486 
   tb_usuario 
   TABLE DATA                 public               postgres    false    229   �=       ?           0    0    tb_auditoria_id_aud_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('auditoria.tb_auditoria_id_aud_seq', 77, true);
       	   auditoria               postgres    false    231            @           0    0    tb_categoria_id_cat_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.tb_categoria_id_cat_seq', 1, false);
          public               postgres    false    219            A           0    0    tb_estadocivil_id_est_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.tb_estadocivil_id_est_seq', 1, false);
          public               postgres    false    221            B           0    0    tb_perfilpagina_id_perpag_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.tb_perfilpagina_id_perpag_seq', 7, true);
          public               postgres    false    226            C           0    0    tb_producto_id_pr_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.tb_producto_id_pr_seq', 1, true);
          public               postgres    false    228            D           0    0    tb_usuario_id_us_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.tb_usuario_id_us_seq', 3, true);
          public               postgres    false    230            1   �  x��WYs�0~ϯ��B�Q@�-[N_J�I�cJ�kG`�8パ�L�__�#8'&A��]﷗�������\�� ���LEȻr������/F�����\����x8����$
�/r�<ʂ�ףAs�di3�$��i�F&�ZK�s>#n�k��ǁif�(]Ľ��:e���̊�ϧ25a�-M�Y�Eh�"�[5��|��Bp��s�|�r~��E�Gi&Ob�w��_�?Vo���>f�N��=F�����\i�D��<��Kv��+�$��
��NS{\<�MG ��~�?��T��Ĳ)�-��
�3�6�yuU�Gw>���:h�8h+��~�<�<��p"�Y�v����T�ºv��bI/ɣh���GZ����PW��s��C�:�q+�ۚU�A�#/ �
C�S���ކ	�p�Ō�>F-� �.��7����.�޾ȭ&ȱ~�z���f��]�zXK��,gM�opF���V�6�E2G<��dF��H..E��׈���.�־�Y#�	�vvRFշ��-H(�(Z��-am$ta��]���O��^zt���=x�v��$�ů[Ċ.���S�'޹sq�;�s��9Ԉ-L@�At�Q�XU���:�����`�T�I
�C��0����<��	�1OJ]5�tվ��z;ҭ��&���b�S]A+�DA2x
p�E���K�cq��d��Rė/0���� �?���[�6�6:��z�]����lkv���~�]�n�{�Ɂ      #   �   x���K
�0@�yV�YD�q�h@��#�$�!ҼSܾOW�[���y�yu�]�8�Ʊ�+��`%��uV�A:�I)�W�M2�2�'�"+���4Ct����9�x�@$�'xMQKT{ �Hj��f�vc��
(f�=�˷&��	�J+�k1�ɥ�h      %   d   x���v
Q���W((M��L�+I�O-.IL�O�,��Qs�	uV�0�QPON,��kZsy����8?�$��D��@�)�e�Eə$[j�[�Y
��� T�H�      '   �   x����
�0�}�"�*���誊��/���iZ�HۄI*~�}��U�w���p{���p92YF��X ����6d�a�� B-X����%�r��Tk���Lp�R��r1X��1��=�x;�*�vWN`����~�c�J����W~�V��<��K��D�[��j�5pA`�D߬2�ϖP��0Q(
��5m�J�5%�#l;��+1kH=�ĭ�y�5E$#����� o���      (   
   x���          )   ^   x���v
Q���W((M��L�+I�/H-J��Qs�	uV�0�QPOL����,.)JL�/R״��$F�PgrNfj^I*�z��z�R�RR�qq <30      *   }   x���v
Q���W((M��L�+I�/H-J��)HL��KTs�	uV�0�Q "#Mk.O�5�5�����ɔ4M&@�������D��t�.4&M�9X�6Y�5�����'s�4�uY uqq  ��      ,   =  x���Ao�@����w�6!�]D!=��ZK7��[�Qd�ԟ�Yˡ�u���|��Y��r�c���Ǧ.���q�����_lv���Al��R#���T�	2�0U��t��<>M��#Ny����R�Cl,)���OW+��>S�j�UÛ�1��R�g��ѩ���[� ���<I|g���x�q�2�fS�E�?�\i�}1�� ����q���<��&�U�г`���	�)W�d�E^-A�M��{�PS�{S��E%s����О��)vMߙט]�sT��P!Z�f������娨�e�gӝ2�P��L����;      .   8  x���[k�@���+�--����Km�x�Ѿ��]JZ�+kR���;���
ˆ3�����<��`2_-`_mv��WnޫC�*��6����Ex��KΔ�'�
�l]������I��Ǐ�]o+S�=�����M�؁�{�j�0�
O���I1�I�+)�2VrKT_\�,ϯ��:�s�U���kʝ�5Q��@�㵻~��z�G�M;���{�P�/�]@���,��?YiÚa�%�X� ݞ^t�)4ρV6T��0��XI�8���MIl���P]���䓕��z���sӄV�����[��z:�i��;#�     