use books;

DELIMITER $$
CREATE TRIGGER validar_categoria
BEFORE INSERT ON books
FOR EACH ROW
BEGIN
    DECLARE categoria_valida INT;
    SELECT id_categories INTO categoria_valida FROM categories WHERE id_categories = NEW.id_categories;
    IF categoria_valida IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La categoría especificada no existe.';
    END IF;
END$$    

DELIMITER ;

CALL spInsertarLibro(33915, 'El Cementerio de Praga', 'Umberto Eco', 'Lumen', 2010, 2000);
CALL spInsertarLibro(33915, 'El Cementerio de Praga', 'Umberto Eco', 'Lumen', 2010, 1);
