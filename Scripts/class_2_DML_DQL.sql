USE curso_sql;

INSERT INTO employees (id, name_, incoming, department) VALUES (1, 'Fernando', 1400, 'TI');
INSERT INTO employees (name_, incoming, department) VALUES ('Caio', 2200, 'Desenvolvimento');
INSERT INTO employees VALUES (3,'Fábio', 800, 'Estágio');
INSERT INTO employees (name_, incoming, department) VALUES ('Samara', 5000, 'Recursos HUmanos');
INSERT INTO employees (name_, incoming, department) VALUES ('Isabela', 1100, 'Jurídico');

SELECT 
    *
FROM
    employees;
    
SELECT * FROM employees WHERE incoming > 2000;

SELECT * FROM employees WHERE name_ = 'Caio';

UPDATE employees SET incoming = incoming * 1.1 WHERE id = 1;
SELECT * FROM employees WHERE id = 1;

# Desativa o safe update do mysql
SET SQL_SAFE_UPDATES = 0;
UPDATE employees 
SET # ROUND diminui o número de casas decimais
    incoming = ROUND(incoming * 1.1, 2);
    
INSERT INTO veicles (employee_id, veicle, plate) VALUES (1, 'Corsa', 'AB-0001');
INSERT INTO veicles (employee_id, veicle, plate) VALUES (1, 'Celta', 'AB-0002');

SELECT * FROM veicles;

UPDATE veicles SET employee_id = 5 WHERE id = 2;

INSERT INTO incomings (faixa, begnning, endding) VALUES ('Analista Jr', 1000, 2000);
INSERT INTO incomings (faixa, begnning, endding) VALUES ('Desenvolvedor Pleno', 2000, 5000);

SELECT * FROM incomings;

SELECT name_, incoming FROM employees e WHERE e.incoming > 2000;

SELECT name_ as 'Funcionário', incoming as 'Salário' FROM employees WHERE incoming > 2000;
