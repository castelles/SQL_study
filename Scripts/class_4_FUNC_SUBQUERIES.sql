SELECT COUNT(*) FROM employees;

SELECT sum(incoming) FROM employees WHERE incoming < 2000;

SELECT avg(incoming) FROM employees;

SELECT DISTINCT(department) FROM employees;
SELECT DISTINCT(department) FROM employees LIMIT 3 OFFSET 2;

SELECT * from employees;

INSERT INTO employees (name_,incoming, department) VALUES ('Francys',2100,'TI');
INSERT INTO employees (name_,incoming, department) VALUES ('Letícia',1260,'Jurídico');

UPDATE employees SET department = 'Recursos Humanos' WHERE id = 4;

SELECT COUNT(*) FROM employees WHERE incoming > 1000 AND department = 'Jurídico';

SELECT SUM(incoming) from employees WHERE department = 'TI';
SELECT AVG(incoming) from employees WHERE department = 'TI';
SELECT MIN(incoming) from employees WHERE department = 'TI';
SELECT MAX(incoming) from employees WHERE department = 'TI';

SELECT DISTINCT(department) FROM employees;

SELECT * FROM employees ORDER BY name_;
SELECT * FROM employees ORDER BY name_ DESC;
SELECT * FROM employees ORDER BY incoming, department DESC;

SELECT * FROM employees LIMIT 2;
SELECT * FROM employees LIMIT 2,2; # = SELECT * FROM employees LIMIT 2 OFFSET 2;

SELECT department,AVG(incoming) FROM employees GROUP BY department;
SELECT department,AVG(incoming) FROM employees GROUP BY department HAVING avg(incoming) > 1500;

SELECT department,COUNT(*) FROM employees GROUP BY department;
SELECT name_ FROM employees WHERE department IN (
	SELECT department FROM employees GROUP BY department HAVING avg(incoming) > 1500
    );