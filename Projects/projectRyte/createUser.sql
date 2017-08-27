SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ANSI';
USE euphonyadmin ;
DROP PROCEDURE IF EXISTS euphonyadmin.drop_user_if_exists ;
DELIMITER $$
CREATE PROCEDURE euphonyadmin.drop_user_if_exists()
BEGIN
  DECLARE foo BIGINT DEFAULT 0 ;
  SELECT COUNT(*)
  INTO foo
    FROM mysql.user
      WHERE User = 'tester' and  Host = 'localhost';
   IF foo > 0 THEN
         DROP USER 'tester'@'localhost' ;
  END IF;
END ;$$
DELIMITER ;
CALL euphonyadmin.drop_user_if_exists() ;
DROP PROCEDURE IF EXISTS euphonyadmin.drop_users_if_exists ;
SET SQL_MODE=@OLD_SQL_MODE ;

CREATE USER 'tester'@'localhost' IDENTIFIED BY 'tester';
GRANT ALL PRIVILEGES  ON euphonyadmin.* TO 'tester'@'localhost'
 WITH GRANT OPTION