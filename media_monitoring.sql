CREATE TABLE the_media (
id SERIAL PRIMARY KEY,
media VARCHAR(30),
type VARCHAR(10),
category VARCHAR(40),
country VARCHAR(30)
)

CREATE TYPE type AS ENUM ('print', 'electronic', 'internet');

CREATE TYPE category AS ENUM 
('daily newspaper', 'local newspaper', 'weekly newspaper',
'magazine', 'national broadcasting TV channel', 'local broadcasting TV channel',
'cable television', 'national broadcasting radio', 'local broadcasting radio',
'internet portal', 'news agency');

CREATE TABLE employees_list (
id SERIAL PRIMARY KEY,
name VARCHAR(30),
surname VARCHAR(30),
position VARCHAR(20),
editor BOOLEAN,
media_id INTEGER REFERENCES the_media(id)
);

CREATE TABLE articles (
id SERIAL PRIMARY KEY,
media_id INTEGER REFERENCES the_media(id),
date DATE,
headline VARCHAR(200),
author_id INTEGER REFERENCES employees_list(id)
);

ALTER TABLE the_media
ALTER COLUMN country SET DEFAULT 'Serbia';

INSERT INTO the_media (media, type, category)
VALUES ('Politika', 'print', 'daily newspaper'),
('Kurir', 'print', 'daily newspaper'),
('Srpski telegraf', 'print', 'daily newspaper'),
('Vecernje novosti', 'print', 'daily newspaper'),
('Nova', 'print', 'daily newspaper'),
('Alo', 'print', 'daily newspaper'),
('Informer', 'print', 'daily newspaper'),
('RTS1', 'electronic', 'national broadcasting TV channel'),
('RTS2', 'electronic', 'national broadcasting TV channel'),
('Pink', 'electronic', 'national broadcasting TV channel'),
('Prva TV', 'electronic', 'national broadcasting TV channel'),
('Happy', 'electronic', 'national broadcasting TV channel'),
('B92', 'electronic', 'national broadcasting TV channel');

SELECT * FROM the_media;

INSERT INTO employees_list (name, surname, position, editor, media_id)
VALUES ('Dragan', 'Zoric', 'editor', TRUE,	1),
('Milica', 'Drazic', 'journalist',	FALSE, 2),
('Josip', 'Markovic', 'journalist', FALSE, 3),
('Olivera', 'Simic', 'journalist', FALSE, 4),
('Dragoslav', 'Tatic', 'journalist', FALSE, 5),
('Katarina', 'Djukic', 'journalist', FALSE, 6),
('Zorica', 'Adamovic', 'journalist', FALSE, 7),
('Zoran', 'Kaic', 'cameraman', FALSE, 8);

SELECT * FROM employees_list;

INSERT INTO articles (media_id, date, headline, author_id)
VALUES (1, '2022-01-07', 'NAŠILEKARI USPEŠNI U SVETU JELISAVETA SANjA ROLOVIĆ', 1),
(2, '2022-01-07', 'Predstavnici UN agencija posetili ukrajinske izbeglice u Centru za azil u Vranju', 2),
(3, '2023-08-31', 'ĐOKOVIĆ PRED SRPSKI DERBI: Kakve reči prvog reketa sveta!', 3);

SELECT * FROM articles;