use books;

START TRANSACTION;
DELETE FROM books WHERE id_book = 33915;
SAVEPOINT eliminacionRegistro33915;
-- ROLLBACK TO eliminacionRegistro33915;
COMMIT;

START TRANSACTION;
-- Inserción de los registros en la tabla RATINGS
INSERT INTO RATINGS (id_user, id_book, score) VALUES (4, 33914, 4);
INSERT INTO RATINGS (id_user, id_book, score) VALUES (5, 33914, 4);
INSERT INTO RATINGS (id_user, id_book, score) VALUES (7, 33914, 4);
INSERT INTO RATINGS (id_user, id_book, score) VALUES (9, 33914, 5);
SAVEPOINT insercionPrimeros4Registros;
INSERT INTO RATINGS (id_user, id_book, score) VALUES (15, 33914, 5);
INSERT INTO RATINGS (id_user, id_book, score) VALUES (21, 33914, 5);
INSERT INTO RATINGS (id_user, id_book, score) VALUES (85, 33914, 5);
INSERT INTO RATINGS (id_user, id_book, score) VALUES (314, 33914, 5);
SAVEPOINT insercionUltimos4Registros;
-- ROLLBACK TO punto1;
COMMIT;
