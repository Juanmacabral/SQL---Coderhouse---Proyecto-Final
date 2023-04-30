use books;

CREATE USER 'NicolasRodriguez'@'localhost' IDENTIFIED BY 'Coderhouse1234';
GRANT SELECT ON *.* TO 'NicolasRodriguez'@'localhost';

/* CREATE USER: Con esta sentencia creo el usuario (NicolasRodriguez). Uso IDENTIFIED BY para establecer una contraseña. 
GRANT le otorga permisos especificos, en este caso le permito unicamente usar la sentencia SELECT.
Por ultimo, establezco con ON *.*, que le doy permiso de ver todas las tablas que tengo creadas en el schema books
 (con previo USE antes de crear el usuario).
*/

CREATE USER 'FlorenciaMoreno'@'localhost' IDENTIFIED BY 'Coderhouse123456';
GRANT SELECT, INSERT, UPDATE ON *.* TO 'FlorenciaMoreno'@'localhost';

/* CREATE USER: Con esta sentencia creo el usuario (FlorenciaMoreno). Uso IDENTIFIED BY para establecer una contraseña. 
GRANT le otorga permisos especificos, en este caso le permito usar las sentencias SELECT, INSERT, UPDATE.alter.
Por ultimo, establezco con ON *.*, que le doy permiso de ver todas las tablas que tengo creadas en el schema books
(con previo USE antes de crear el usuario). . 
*/

REVOKE DELETE ON *.* FROM 'NicolasRodriguez'@'localhost';
REVOKE DELETE ON *.* FROM 'FlorenciaMoreno'@'localhost';

/* Si bien entiendo que no hace falta, uso la sentencia REVOKE para negar especificamente los permisos para hacer uso del DELETE,
para ambos usuarios
*/

FLUSH PRIVILEGES;

/* Entiendo que esta sentencia sirve para hacer efectivos los cambios, como si de un ACTUALIZAR se tratara*/

SHOW GRANTS FOR 'root'@'localhost';
SHOW GRANTS FOR 'NicolasRodriguez'@'localhost';
SHOW GRANTS FOR 'FlorenciaMoreno'@'localhost';

/* Por ultimo, controlo que los permisos de cada uno sean los que corresponden (el primer usuario es el mio, con el que vengo trabajando 
desde el principio de la cursada/*