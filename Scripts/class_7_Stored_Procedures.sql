USE curso_sql;

CREATE TABLE orders (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    description VARCHAR(100) NOT NULL,
    order_value DOUBLE NOT NULL DEFAULT '0',
    done VARCHAR(3) NOT NULL DEFAULT 'Não',
    PRIMARY KEY (id)
);

INSERT INTO orders (description, order_value) VALUES ('TV',3000);
INSERT INTO orders (description, order_value) VALUES ('Geladeira',1400);
INSERT INTO orders (description, order_value, done) VALUES ('Notebook',2500, 'Sim');

SELECT * FROM orders;

CALL clean_orders();

CREATE TABLE stock (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    description VARCHAR(50) NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TRIGGER trigger_clean_orders
BEFORE INSERT ON stock
FOR EACH ROW CALL clean_orders();

INSERT INTO stock (description, quantity) VALUES ('Fogão',5);
INSERT INTO stock (description, quantity) VALUES ('Mesa',3);

SELECT * FROM stock;

