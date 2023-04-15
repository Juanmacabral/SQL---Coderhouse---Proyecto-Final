CREATE SCHEMA IF NOT EXISTS books;

USE books;

CREATE TABLE IF NOT EXISTS categories (
id_categories INT NOT NULL PRIMARY KEY,
categories VARCHAR (255)
);

CREATE TABLE IF NOT EXISTS books (
id_book INT NOT NULL PRIMARY KEY,
title VARCHAR (500),
authors VARCHAR (500),
publisher VARCHAR (500),
published_year INT NOT NULL,
id_categories INT NOT NULL, FOREIGN KEY (id_categories) REFERENCES categories (id_categories)
);


CREATE TABLE IF NOT EXISTS prices (
id_book INT NOT NULL,
FOREIGN KEY (id_book) REFERENCES books (id_book),
price FLOAT NOT NULL
);

CREATE TABLE IF NOT EXISTS users (
id_user INT NOT NULL PRIMARY KEY,
profile_name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS ratings (
id_user INT NOT NULL,
FOREIGN KEY (id_user) REFERENCES users (id_user),
id_book INT NOT NULL,
FOREIGN KEY (id_book) REFERENCES books (id_book),
score INT NOT NULL
)






