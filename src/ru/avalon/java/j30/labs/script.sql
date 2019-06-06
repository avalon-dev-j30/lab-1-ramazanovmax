/*
 * TODO(Студент): Опишите процесс создания базы данных
 * 1. Создайте все таблицы, согласно предложенной диаграмме.
 * 2. Опишите все необходимые отношения между таблицами.
 * 3. Добавьте в каждую таблицу минимум три записи.
 */

/*
DROP TABLE "order2product";
DROP TABLE "order";
DROP TABLE "user";
DROP TABLE "userinfo";
DROP TABLE "roles";
DROP TABLE "product";
DROP TABLE "supplier";
*/


CREATE TABLE "roles" (
     id integer NOT NULL UNIQUE,
     name varchar(255) PRIMARY KEY
     
);

CREATE TABLE "userinfo" (
    id integer PRIMARY KEY,
    name varchar(255),
    surname varchar(255) 
);

CREATE TABLE "user" (
      id integer NOT NULL UNIQUE,
      email varchar(255) PRIMARY KEY,
      password varchar(255),
      info integer NOT NULL UNIQUE REFERENCES "userinfo"(id),
      role integer REFERENCES "roles"(id)
);

CREATE TABLE "order"
(
      id integer PRIMARY KEY,
      customer integer references "user"(id),
      created timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE "supplier" (
      id integer NOT NULL UNIQUE,
      name varchar(255) NOT NULL PRIMARY KEY,
      address varchar(255) NOT NULL,
      phone varchar(255),
      representative varchar(255) NOT NULL
);

CREATE TABLE "product" (
      id integer NOT NULL UNIQUE,
      code varchar(255) PRIMARY KEY,
      title varchar(255) NOT NULL,
      supplier integer REFERENCES "supplier"(id),
      initial_price double NOT NULL,
      retail_value double NOT NULL
);

CREATE TABLE "order2product" (
      "order" integer REFERENCES "order"(id),
      "product" integer REFERENCES "product"(id),
      constraint pk_ord2prod PRIMARY KEY ("order", "product")
);




INSERT INTO "roles"(id, name)
VALUES  (1, 'master'),
        (2, 'manager'),
        (3, 'customer');

INSERT INTO "userinfo"(id, name, surname)
VALUES  (1, 'Ivan', 'Smirnov'),
        (2, 'Oleg', 'Boriov'),
        (3, 'Yuriy', 'Kravchuk');

INSERT INTO "user"(id, email, password, info, role)
VALUES (1, 'is@mail.ru', '12345', 1, 1),
       (2, 'ob@yandex.ru', 'qwerty', 2, 2),
       (3, 'yk@google.ru', '1qazxsw2', 3, 3);

INSERT INTO "order"(id, customer, created)
VALUES  (1, 1, CURRENT TIMESTAMP),
        (2, 2, CURRENT TIMESTAMP),
        (3, 3, CURRENT TIMESTAMP);

INSERT INTO "supplier"(id, name, address, phone, representative)
VALUES (1, 'AvtoMoyka', 'Russia, SPb, Liziukova 15', '1234567', 'Stepan'),
       (2, 'Shinomontaj', 'Russia, SPb, Main street 1', '1234567', 'Oleg'),
       (3, 'STO', 'Russia, SPb, Nevsky 43', '1234567', 'Mark');

INSERT INTO "product"(id, code, title, supplier, initial_price, retail_value)
VALUES (1, '56', 'apple', 1, 5, 15),
       (2, '43', 'barry', 2, 8, 14),
       (3, '67', 'lemon', 3, 2, 6);

INSERT INTO "order2product"("order", "product")
VALUES (1, 1),
       (2, 2),
       (3, 3);

SELECT *
FROM "order";

SELECT *
FROM "user";

SELECT *
FROM "roles";

SELECT *
FROM "userinfo";

SELECT *
FROM "order2product";

SELECT *
FROM "product";

SELECT *
FROM "supplier";
