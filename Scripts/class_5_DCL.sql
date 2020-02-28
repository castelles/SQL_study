# CREATE USER 'caio'@'200.151.0.12' IDENTIFIED BY 'qwe123';
# CREATE USER 'caio'@'%' IDENTIFIED BY 'qwe123';

CREATE USER 'caio'@'localhost' IDENTIFIED BY 'qWeR123!@#';
GRANT ALL ON curso_sql.* TO 'caio'@'localhost';

CREATE USER 'caio'@'%' IDENTIFIED BY 'andreV!@g3m';
GRANT SELECT ON curso_sql.* TO 'caio'@'%';

GRANT INSERT ON curso_sql.employees TO 'caio'@'%';

REVOKE INSERT ON curso_sql.employees FROM 'caio'@'%';
REVOKE SELECT ON curso_sql.* FROM 'caio'@'%';

GRANT SELECT ON curso_sql.employees TO 'caio'@'%';
GRANT SELECT ON curso_sql.veicles TO 'caio'@'%';

REVOKE SELECT ON curso_sql.employees FROM 'caio'@'%';
REVOKE SELECT ON curso_sql.veicles FROM 'caio'@'%';

REVOKE ALL ON curso_sql.* FROM 'caio'@'localhost';

DROP USER 'caio'@'%';
DROP USER 'caio'@'localhost';

CREATE USER 'caio'@'%' IDENTIFIED BY 'andreV!@g3m';
GRANT SELECT ON curso_sql.* TO 'caio'@'%';
GRANT INSERT ON curso_sql.employees TO 'caio'@'%';

SELECT User FROM mysql.user;
SHOW GRANTS FOR 'caio'@'%';