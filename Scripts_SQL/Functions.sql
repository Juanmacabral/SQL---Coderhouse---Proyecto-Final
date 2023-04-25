USE `books`;
DROP function IF EXISTS `calculadoraIMC`;

DELIMITER $$
USE `books`$$
CREATE FUNCTION calculadoraIMC(peso FLOAT, altura FLOAT)
RETURNS VARCHAR(255)
NO SQL
BEGIN
DECLARE imc FLOAT;
  SET imc = peso / (altura * altura);
  RETURN CONCAT('Tu índice de masa corporal es: ', imc);
END$$

DELIMITER ;

SELECT calculadoraIMC(75, 1.8);

/*Esta primera funcion hace el calculo de IMC (indice de masa corporal). Para ejecutarlo hay que declarar en el select tanto peso como altura. 
La consulta devolvera el valor final del IMC*/

DROP function IF EXISTS `promedioRating`;

DELIMITER $$
USE `books`$$
CREATE FUNCTION promedioRating(book_name VARCHAR(500))
RETURNS INTEGER
READS SQL DATA
BEGIN
    DECLARE avg_ratings INT;
    SELECT AVG(ratings.score) AS puntaje_promedio INTO avg_ratings
    FROM ratings
    JOIN books on ratings.id_book = books.id_book
    WHERE title = book_name;
    RETURN avg_ratings;
END$$

DELIMITER ;

SELECT promedioRating('The Best Short Stories of Edgar Allan Poe');



/* Esta funcion traera el promedio de votos recibido segun el libro indicado,*/
