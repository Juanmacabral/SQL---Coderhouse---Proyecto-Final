use books;

CREATE VIEW año_2001 AS
select * FROM books
WHERE published_year = 2001;

CREATE VIEW libros_muy_caros AS
SELECT 
		title,
        prices.price
FROM books
JOIN prices ON books.id_book = prices.id_book
WHERE price > 500;

CREATE VIEW Libros_tecnologia AS
SELECT 
		title,
        authors,
        published_year
FROM books
JOIN categories ON books.id_categories = categories.id_categories
WHERE categories = 'Technology & Engineering' AND published_year >= 2010
ORDER BY published_year DESC;

CREATE VIEW libros_mas_votados AS
SELECT
		books.title,
        books.authors,
        COUNT(ratings.id_book) AS cantidad_de_votos
FROM books
JOIN ratings ON books.id_book = ratings.id_book
GROUP BY title, authors
ORDER BY cantidad_de_votos DESC
LIMIT 100;

CREATE VIEW TOP_25_USUARIOS AS
SELECT
		users.profile_name AS usuario,
        COUNT(ratings.id_user) AS cantidad_puntuaciones
FROM users
JOIN ratings ON users.id_user = ratings.id_user
GROUP BY profile_name
ORDER BY cantidad_puntuaciones DESC
LIMIT 25;