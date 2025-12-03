CREATE DATABASE sistemaDeVendas;
USE sistemaDeVendas;

CREATE TABLE clientes (
    id_cliente INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    email TEXT,
    cidade TEXT
);

CREATE TABLE pedidos (
    id_pedido INTEGER PRIMARY KEY,
    id_cliente INTEGER,
    data_pedido DATE,
    valor REAL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

INSERT INTO clientes (id_cliente, nome, email, cidade) VALUES
(1, 'Ana Souza', 'ana@email.com', 'Rio de Janeiro'),
(2, 'Pedro Costa', 'pedro@email.com', 'São Paulo'),
(3, 'Lucas Lima', 'lucas@email.com', 'Belo Horizonte');

INSERT INTO pedidos (id_pedido, id_cliente, data_pedido, valor) VALUES
(101, 1, '2025-01-10', 250.00),
(102, 1, '2025-01-15', 320.00),
(103, 2, '2025-01-18', 150.00),
(104, 3, '2025-01-20', 450.00),
(105, 3, '2025-01-22', 80.00);

SELECT * FROM clientes;
SELECT * FROM pedidos;

SELECT c.nome, p.id_pedido, p.valor, p.data_pedido
FROM clientes c
JOIN pedidos p ON c.id_cliente = p.id_cliente;

SELECT * FROM pedidos
WHERE valor > 200;

SELECT * FROM pedidos
ORDER BY valor DESC;

SELECT c.nome, SUM(p.valor) AS total_gasto
FROM clientes c
JOIN pedidos p ON c.id_cliente = p.id_cliente
GROUP BY c.nome;

SELECT c.nome, COUNT(p.id_pedido) AS quantidade_pedidos
FROM clientes c
JOIN pedidos p ON c.id_cliente = p.id_cliente
GROUP BY c.nome
ORDER BY quantidade_pedidos DESC;
