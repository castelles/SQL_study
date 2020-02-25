CREATE DATABASE curso_sql;

USE curso_sql;

CREATE TABLE employees (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name_ VARCHAR(45) NOT NULL,
    incoming DOUBLE NOT NULL DEFAULT '1090',
    department VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE veicles (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    employee_id INT UNSIGNED DEFAULT NULL,
    veicle VARCHAR(45) NOT NULL DEFAULT '',
    plate VARCHAR(10) NOT NULL DEFAULT '',
    PRIMARY KEY (id),
    CONSTRAINT fk_veicles_employees FOREIGN KEY (employee_id)
        REFERENCES employees (id)
);

CREATE TABLE incomings (
    faixa VARCHAR(45) NOT NULL,
    begnning DOUBLE NOT NULL,
    endding DOUBLE NOT NULL,
    PRIMARY KEY (faixa)
);

ALTER TABLE employees CHANGE COLUMN name_ name_func VARCHAR(50) NOT NULL;

ALTER TABLE employees CHANGE COLUMN name_func name_ VARCHAR(50) NOT NULL;

CREATE INDEX departments ON employees (department);

CREATE INDEX names_ ON employees (name_(6));