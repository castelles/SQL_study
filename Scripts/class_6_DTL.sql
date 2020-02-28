USE curso_sql;

SHOW ENGINES;

CREATE TABLE bank_accounts (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    titular VARCHAR(45) NOT NULL,
    balance DOUBLE NOT NULL,
    PRIMARY KEY (id)
)  ENGINE=INNODB;

INSERT INTO bank_accounts (titular,balance) VALUES ('Caio',1000);
INSERT INTO bank_accounts (titular,balance) VALUES ('Samara',2000);

SELECT * FROM bank_accounts;

# NOT RECOMMENDED - 
UPDATE bank_accounts SET balance = balance - 100 WHERE id = 1;
UPDATE bank_accounts SET balance = balance + 100 WHERE id = 2;

# RECOMMENDED - 
START TRANSACTION;
UPDATE bank_accounts SET balance = balance - 100 WHERE id = 1;
UPDATE bank_accounts SET balance = balance + 100 WHERE id = 2;
ROLLBACK; # rollback cancela a transação ocorrida

START TRANSACTION;
UPDATE bank_accounts SET balance = balance - 100 WHERE id = 1;
UPDATE bank_accounts SET balance = balance + 100 WHERE id = 2;
COMMIT; # commit conclui e atualiza a tabela para os outros usuários
