-- CREATE DATABASE store
--     WITH
--     OWNER = postgres
--     ENCODING = 'UTF8'
--     LC_COLLATE = 'English_United States.1252'
--     LC_CTYPE = 'English_United States.1252'
--     LOCALE_PROVIDER = 'libc'
--     TABLESPACE = pg_default
--     CONNECTION LIMIT = -1
--     IS_TEMPLATE = False;

-- CREATE TABLE IF NOT EXISTS public.carts
-- (
--     id bigint NOT NULL DEFAULT nextval('carts_id_seq'::regclass),
--     created_at timestamp with time zone,
--     updated_at timestamp with time zone,
--     deleted_at timestamp with time zone,
--     user_id bigint,
--     product_id bigint,
--     quantity bigint,
--     CONSTRAINT carts_pkey PRIMARY KEY (id),
--     CONSTRAINT fk_carts_product FOREIGN KEY (product_id)
--         REFERENCES public.products (id) MATCH SIMPLE
--         ON UPDATE NO ACTION
--         ON DELETE NO ACTION,
--     CONSTRAINT fk_carts_user FOREIGN KEY (user_id)
--         REFERENCES public.users (id) MATCH SIMPLE
--         ON UPDATE NO ACTION
--         ON DELETE NO ACTION
-- )

-- TABLESPACE pg_default;

-- ALTER TABLE IF EXISTS public.carts
--     OWNER to postgres;
-- -- Index: idx_carts_deleted_at

-- -- DROP INDEX IF EXISTS public.idx_carts_deleted_at;

-- CREATE INDEX IF NOT EXISTS idx_carts_deleted_at
--     ON public.carts USING btree
--     (deleted_at ASC NULLS LAST)
--     TABLESPACE pg_default;

-- CREATE TABLE IF NOT EXISTS public.order_items
-- (
--     id bigint NOT NULL DEFAULT nextval('order_items_id_seq'::regclass),
--     created_at timestamp with time zone,
--     updated_at timestamp with time zone,
--     deleted_at timestamp with time zone,
--     order_id bigint,
--     product_id bigint,
--     quantity bigint NOT NULL,
--     price bigint NOT NULL,
--     CONSTRAINT order_items_pkey PRIMARY KEY (id)
-- )

-- TABLESPACE pg_default;

-- ALTER TABLE IF EXISTS public.order_items
--     OWNER to postgres;
-- -- Index: idx_order_items_deleted_at

-- -- DROP INDEX IF EXISTS public.idx_order_items_deleted_at;

-- CREATE INDEX IF NOT EXISTS idx_order_items_deleted_at
--     ON public.order_items USING btree
--     (deleted_at ASC NULLS LAST)
--     TABLESPACE pg_default;
-- -- Index: idx_order_items_order_id

-- -- DROP INDEX IF EXISTS public.idx_order_items_order_id;

-- CREATE INDEX IF NOT EXISTS idx_order_items_order_id
--     ON public.order_items USING btree
--     (order_id ASC NULLS LAST)
--     TABLESPACE pg_default;
-- -- Index: idx_order_items_product_id

-- -- DROP INDEX IF EXISTS public.idx_order_items_product_id;

-- CREATE INDEX IF NOT EXISTS idx_order_items_product_id
--     ON public.order_items USING btree
--     (product_id ASC NULLS LAST)
--     TABLESPACE pg_default;

-- CREATE TABLE IF NOT EXISTS public.orders
-- (
--     id bigint NOT NULL DEFAULT nextval('orders_id_seq'::regclass),
--     created_at timestamp with time zone,
--     updated_at timestamp with time zone,
--     deleted_at timestamp with time zone,
--     user_id bigint,
--     total_price bigint NOT NULL,
--     total_quantity bigint NOT NULL,
--     CONSTRAINT orders_pkey PRIMARY KEY (id)
-- )

-- TABLESPACE pg_default;

-- ALTER TABLE IF EXISTS public.orders
--     OWNER to postgres;
-- -- Index: idx_orders_deleted_at

-- -- DROP INDEX IF EXISTS public.idx_orders_deleted_at;

-- CREATE INDEX IF NOT EXISTS idx_orders_deleted_at
--     ON public.orders USING btree
--     (deleted_at ASC NULLS LAST)
--     TABLESPACE pg_default;
-- -- Index: idx_orders_user_id

-- -- DROP INDEX IF EXISTS public.idx_orders_user_id;

-- CREATE INDEX IF NOT EXISTS idx_orders_user_id
--     ON public.orders USING btree
--     (user_id ASC NULLS LAST)
--     TABLESPACE pg_default;

-- CREATE TABLE IF NOT EXISTS public.products
-- (
--     id bigint NOT NULL DEFAULT nextval('products_id_seq'::regclass),
--     created_at timestamp with time zone,
--     updated_at timestamp with time zone,
--     deleted_at timestamp with time zone,
--     name text COLLATE pg_catalog."default",
--     description text COLLATE pg_catalog."default",
--     price bigint,
--     category text COLLATE pg_catalog."default",
--     stock bigint,
--     CONSTRAINT products_pkey PRIMARY KEY (id)
-- )

-- TABLESPACE pg_default;

-- ALTER TABLE IF EXISTS public.products
--     OWNER to postgres;
-- -- Index: idx_products_deleted_at

-- -- DROP INDEX IF EXISTS public.idx_products_deleted_at;

-- CREATE INDEX IF NOT EXISTS idx_products_deleted_at
--     ON public.products USING btree
--     (deleted_at ASC NULLS LAST)
--     TABLESPACE pg_default;

-- CREATE TABLE IF NOT EXISTS public.users
-- (
--     id bigint NOT NULL DEFAULT nextval('users_id_seq'::regclass),
--     created_at timestamp with time zone,
--     updated_at timestamp with time zone,
--     deleted_at timestamp with time zone,
--     name text COLLATE pg_catalog."default",
--     email text COLLATE pg_catalog."default",
--     username text COLLATE pg_catalog."default" NOT NULL,
--     password text COLLATE pg_catalog."default",
--     CONSTRAINT users_pkey PRIMARY KEY (id),
--     CONSTRAINT uni_users_username UNIQUE (username)
-- )

-- TABLESPACE pg_default;

-- ALTER TABLE IF EXISTS public.users
--     OWNER to postgres;
-- -- Index: idx_users_deleted_at

-- -- DROP INDEX IF EXISTS public.idx_users_deleted_at;

-- CREATE INDEX IF NOT EXISTS idx_users_deleted_at
--     ON public.users USING btree
--     (deleted_at ASC NULLS LAST)
--     TABLESPACE pg_default;

INSERT INTO products (name, description, price, category, stock)
VALUES('Beng-Beng', 'A chocolate-combo snack, combines multi layers of tasty element beyond just luscious real chocolate snack. Only Beng Beng holds the key to the exciting combinations, more than just chocolate or wafer.', 2500, 'food', 999999);

INSERT INTO products (name, description, price, category, stock)
VALUES('Onigiri Tuna Mayo', 'Nasi kepal dengan filling tuna mayonaise yang dapat dimakan langsung tanpa dipanaskan.', 13000, 'food', 999999);

INSERT INTO products (name, description, price, category, stock)
VALUES('Le Minerale Air Mineral 600ml', 'Le minerale air minum dalam kemasan. Air mineral pegunungan, dibotolkan langsung di sumbernya.', 3500, 'beverage', 999999);

INSERT INTO products (name, description, price, category, stock)
VALUES('Ultra Susu Uht Steril Slim Strawberry 250Ml', 'Susu cair segar berkualitas dengan rasa yang lezat dan istimewa serta mengandung kalsium susu dan fosfor.', 7500, 'beverage', 999999);

INSERT INTO products (name, description, price, category, stock)
VALUES('Faber Castell Pensil 2B', 'Pensil 2B Faber Castell yang dapat digunakan untuk ujian.', 3000, 'stationery', 999999);

INSERT INTO products (name, description, price, category, stock)
VALUES('Joyko Twist Crayon 12 Warna TWCR-12S', 'Crayon Favourit Yang Banyak Digunakan Oleh Anak-Anak Dan Bahkan Orang Dewasa. Pilihan Warna Yang Menarik, Aman Digunakan Bagi Balita Maupun Anak-Anak Karena Tidak Mengandung Toxic/Racun Yang Sangat Berbahaya Menjadikan Crayon Joyko Oil Pastel Menjadi Produk Pilihan Yang Sangat Berkualitas. Crayon Joyko Oil Pastel Adalah Pilihan Yang Terbaik Bagi Anak-Anak Bahkan Balita Yang Baru Saja Akan Belajar Mewarnai Dan Menggambar.', 50000, 'stationery', 999999);