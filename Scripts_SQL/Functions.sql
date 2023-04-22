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

DROP function IF EXISTS `cantidadLibrosPorAutor`;

DELIMITER $$
USE `books`$$
CREATE FUNCTION cantidadLibrosPorAutor(author_name VARCHAR(1000))
RETURNS INTEGER
READS SQL DATA
BEGIN
    DECLARE cant_libros INT;
    SELECT COUNT(title) INTO cant_libros
    FROM books
    WHERE authors LIKE CONCAT('%', author_name, '%');
    RETURN cant_libros;
END$$

DELIMITER ;

SELECT cantidadLibrosPorAutor('Shakespeare');

/* Esta funcion traera la cantidad de libros escritos por autor, segun los valores que encuentre en la tabla.
Lo unico que necesitamos poner es una parte del nombre o apellido del autor a la hora de llamar a la funcion*/
