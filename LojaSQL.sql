CREATE DATABASE LojaSQL;
USE LojaSQL;

CREATE TABLE clientes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR(100),
    cidade VARCHAR(50)
);

CREATE TABLE produtos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    categoria VARCHAR(50),
    preco DECIMAL(10,2)
);

CREATE TABLE vendas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    id_produto INT,
    quantidade INT,
    data_venda DATE,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id),
    FOREIGN KEY (id_produto) REFERENCES produtos(id)
);

INSERT INTO clientes (nome, email, cidade) VALUES
('Ana Silva', 'ana@gmail.com', 'Rio de Janeiro'),
('Pedro Costa', 'pedro@gmail.com', 'São Paulo'),
('Lucas Almeida', 'lucas@gmail.com', 'Belo Horizonte');

INSERT INTO produtos (nome, categoria, preco) VALUES
('Notebook', 'Eletrônicos', 3500.00),
('Mouse Gamer', 'Periféricos', 150.00),
('Cadeira Escritório', 'Móveis', 900.00);

INSERT INTO vendas (id_cliente, id_produto, quantidade, data_venda) VALUES
(1, 1, 1, '2025-01-12'),
(2, 2, 3, '2025-01-15'),
(3, 3, 1, '2025-01-20');

SELECT c.nome, SUM(p.preco * v.quantidade) AS total_gasto
FROM vendas v
JOIN clientes c ON v.id_cliente = c.id
JOIN produtos p ON v.id_produto = p.id
GROUP BY c.nome;


SELECT p.nome, SUM(v.quantidade) AS total_vendido
FROM vendas v
JOIN produtos p ON v.id_produto = p.id
GROUP BY p.nome
ORDER BY total_vendido DESC;

SELECT p.categoria, COUNT(*) AS total_vendas
FROM vendas v
JOIN produtos p ON v.id_produto = p.id
GROUP BY p.categoria;

SELECT v.id, c.nome AS cliente, p.nome AS produto, v.quantidade, v.data_venda
FROM vendas v
JOIN clientes c ON v.id_cliente = c.id
JOIN produtos p ON v.id_produto = p.id
ORDER BY v.data_venda;

