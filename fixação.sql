CREATE DATABASE atvdefixacao;
USE atvdefixacao;

--1
--A
CREATE TABLE nomes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100)
);
INSERT INTO nomes (nome) VALUES
    ('Roberta'),
    ('Roberto'),
    ('Maria Clara'),
    ('João');

--B
SELECT UPPER(nome) AS nome_maiusculo FROM nomes;

--C
SELECT nome, LENGTH(nome) AS tamanho_nome FROM nomes;

--D
SELECT 
    CASE 
        WHEN nome LIKE '%Roberto%' OR nome LIKE '%João%' THEN CONCAT('Sr. ', nome)
        WHEN nome LIKE '%Roberta%' OR nome LIKE '%Maria Clara%' THEN CONCAT('Sra. ', nome)
        ELSE nome
    END AS nome_com_tratamento
FROM nomes;