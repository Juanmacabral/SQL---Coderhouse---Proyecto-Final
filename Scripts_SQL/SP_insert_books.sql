USE `books`;
DROP procedure IF EXISTS `InsertarLibro`;

DELIMITER $$
USE `books`$$
CREATE PROCEDURE InsertarLibro(
    IN p_id_book INT,
    IN p_title VARCHAR(1000),
    IN p_authors VARCHAR(1000),
    IN p_publisher VARCHAR(1000),
    IN p_published_year INT,
    IN p_id_categories INT
)
BEGIN
    DECLARE v_id_book INT;

    SELECT id_book INTO v_id_book FROM books WHERE title = p_title;

    IF v_id_book IS NOT NULL THEN
        SELECT 'El libro ya existe en la tabla' AS mensaje;
    ELSE
        INSERT INTO books(id_book, title, authors, publisher, published_year, id_categories)
        VALUES(p_id_book, p_title, p_authors, p_publisher, p_published_year, p_id_categories);
        SELECT 'Libro insertado correctamente' AS mensaje;
    END IF;
END;$$

DELIMITER ;

CALL spInsertarLibro(33914, 'El nombre de la rosa', 'Umberto Eco', 'Lumen', 1980, 140);


SELECT 
		id_book,
        title,
        authors,
        publisher,
        published_year,
        categories
FROM books
JOIN categories ON books.id_categories = categories.id_categories
ORDER BY id_book DESC;

/* Este SP sirve para insertar nuevos libros en la tabla books, sin necesitar usar las sentencias INSERT INTO.
Temas a mejorar:
 Deberia hacer un SP que me ingrese valores en las demas tablas. O, ver de crear un nuevo SP donde pueda ingresar todo junto.
Osea, en un mismo SP, ingresar los datos de tabla books + precios + ratings.
Por otro lado, deberia hacer que id_book se ingrese de forma incremental automatica. Ese tema me esta fallando */

