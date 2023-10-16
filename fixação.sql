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

--2
--A
CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    produto VARCHAR(255) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    quantidade INT NOT NULL
);

--B
SELECT produto, ROUND(preco, 2) AS arredondar_preco, quantidade
FROM produtos;

--C
SELECT produto, preco, ABS(quantidade) AS quantidade_absoluta
FROM produtos;

--D
SELECT AVG(preco) AS precos_media
FROM produtos;

--3
--A
CREATE TABLE eventos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_evento DATETIME
);

INSERT INTO eventos (data_evento) VALUES
('2023-03-23 10:25:48'),
('2010-06-25 11:30:00'),
('2009-03-15 18:25:59'),
('2008-10-12 02:45:52'),
('2025-12-29 00:00:00'),
('1976-03-23 22:02:24'),
('2036-02-30 23:55:40'),
('2012-04-25 15:25:36'),
('2053-05-20 12:25:13'),
('2018-09-30 19:26:10'),
('2028-05-25 18:36:10'),
('2000-06-02 19:05:32');

--B
INSERT INTO eventos (evento_data)
SELECT NOW() as DatAtual;

--C
SELECT evento_data, evento_data AS data_atual, DATEDIFF(NOW(), evento_data) AS Comparação_total
FROM eventos;

--D
SELECT DAYNAME(evento_data) AS nome_dia_semana
FROM eventos;

--4
--A
INSERT INTO produtos(produto, preco, quantidade) VALUES
('Spacefox', '05.00', 10),
('Corsa', '02.00', 0),
('Onix', '08.50', 5);

SELECT produto, preco, quantidade,
       IF(quantidade > 0, 'Em estoque', 'Fora de estoque') AS status_estoque
FROM produtos;

--B
SELECT produto, preco, quantidade,
    CASE
        WHEN preco <= 3.00 THEN 'Barato'
        WHEN preco <= 6.00 THEN 'Médio'
        ELSE 'Caro'
    END AS categoria_preco
FROM produtos;

