use curso_sql;

SELECT * FROM incomings;
SELECT * FROM employees;
SELECT * FROM veicles;

INSERT INTO incomings (faixa, begnning, endding) VALUES ('Estágio',400,999);
UPDATE incomings SET endding = 3000 WHERE faixa = 'Desenvolvedor Pleno';
INSERT INTO incomings (faixa, begnning, endding) VALUES ('Diretor', 4000, 7000);

UPDATE incomings SET begnning = 2001 WHERE faixa = 'Desenvolvedor Pleno';

SELECT * FROM employees e INNER JOIN veicles v ON employee_id = e.id;
SELECT e.id,e.name_,v.veicle,v.plate FROM employees e INNER JOIN veicles v ON employee_id = e.id;

SELECT * FROM employees e LEFT JOIN veicles v ON employee_id = e.id;

INSERT INTO veicles (employee_id,veicle,plate) VALUES (null,'S-10','AB-0003');

SELECT * FROM employees e RIGHT JOIN veicles v ON employee_id = e.id
UNION
SELECT * FROM employees e LEFT JOIN veicles ON employee_id = e.id;

CREATE TABLE cpfs (
    id INT UNSIGNED NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_cpf FOREIGN KEY (id)
        REFERENCES employees (id)
);

INSERT INTO cpfs (id,cpf) VALUES (1,'111.111.111-11');
INSERT INTO cpfs (id,cpf) VALUES (2,'222.222.222-22');
INSERT INTO cpfs (id,cpf) VALUES (3,'333.333.333-33');
INSERT INTO cpfs (id,cpf) VALUES (4,'444.444.444-44');
INSERT INTO cpfs (id,cpf) VALUES (5,'555.555.555-55');

SELECT * FROM cpfs;

SELECT * FROM employees INNER JOIN cpfs USING (id);

CREATE TABLE clients 
(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    client_name VARCHAR(45) NOT NULL,
    who_indicated INT UNSIGNED,
    PRIMARY KEY (id),
    CONSTRAINT fk_who_indicated FOREIGN KEY (who_indicated) REFERENCES clients (id)
);

INSERT INTO clients (client_name,who_indicated) VALUES ('Caio',NULL);
INSERT INTO clients (client_name,who_indicated) VALUES ('Samuel',1);
INSERT INTO clients (client_name,who_indicated) VALUES ('Carlos',2);
INSERT INTO clients (client_name,who_indicated) VALUES ('Rafael',1);
INSERT INTO clients (client_name,who_indicated) VALUES ('André',NULL);

SELECT * FROM clients;

SELECT a.client_name, b.client_name FROM clients a JOIN clients b ON a.who_indicated = b.id;
SELECT a.client_name AS CLIENTE, b.client_name AS 'QUEM INDICOU' FROM clients a JOIN clients b ON a.who_indicated = b.id;

SELECT e.name_,e.incoming,i.faixa FROM employees e 
INNER JOIN incomings i ON e.incoming BETWEEN i.begnning AND i.endding;

SELECT e.id,name_,e.incoming,e.department,v.veicle,v.plate, c.cpf FROM employees e 
INNER JOIN veicles v ON v.employee_id = e.id
INNER JOIN cpfs c ON c.id = e.id;

# VIEWS
CREATE VIEW employees_a AS SELECT e.id,name_,e.incoming,e.department,v.veicle,v.plate, c.cpf FROM employees e 
INNER JOIN veicles v ON v.employee_id = e.id
INNER JOIN cpfs c ON c.id = e.id;

SELECT * FROM employees_a;
