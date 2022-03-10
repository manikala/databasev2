--Пользователь
CREATE SEQUENCE user_seq START 1 INCREMENT 1;
CREATE TABLE users (
    id INT NOT NULL, primary key (id),login VARCHAR, password INT, name VARCHAR, bucket_id INT);

--Карзина
CREATE SEQUENCE bucket_seq START 1 INCREMENT 1;
CREATE TABLE buckets (id INT NOT NULL, primary key (id),user_id INT);

--Связь между пользователем и карзиной
ALTER TABLE IF EXISTS buckets
    add constraint buckets_fk_user
    foreign key (user_id) references users;

--Категория
CREATE SEQUENCE category_seq START 1 INCREMENT 1;
CREATE TABLE categories (id INT NOT NULL, primary key (id), name INT);

--Продукты
CREATE SEQUENCE products_seq START 1 INCREMENT 1;
CREATE TABLE products (id INT NOT NULL, primary key (id), name INT);

--Категория и продукты
CREATE TABLE categories (product_id INT NOT NULL, category_id INT NOT NULL);

alter table if exists products_categories
    add constraint products_categories_fk_category
    foreign key (category_id) references categories;

alter table if exists products_categories
    add constraint products_categories_fk_product
    foreign key (product_id) references products;

--Продукты в карзине
CREATE TABLE categories (bucket_id INT NOT NULL, product_id INT NOT NULL);

alter table if exists bucket_products
    add constraint bucket_products_fk_product
    foreign key (product_id) references products;

alter table if exists bucket_products
    add constraint bucket_products_fk_bucket
    foreign key (bucket_id) references buckets;

--Заказ
CREATE SEQUENCE order_seq START 1 INCREMENT 1;
CREATE TABLE orders (id INT NOT NULL, primary key (id), sum INT, user_id INT);

alter table if exists orders
    add constraint orders_fk_user
    foreign key (user_id) references users;








