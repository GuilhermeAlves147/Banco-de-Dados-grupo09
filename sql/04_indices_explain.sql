USE marketplace_db;

-- Consulta antes e depois da criação do índice
EXPLAIN
SELECT *
FROM tb_product
WHERE name = 'Celular Samsung Galaxy A54';

-- Criação do índice para pesquisar produtos pelo nome
CREATE INDEX idx_product_name
ON tb_product (name);

-- Verificação do plano de execução com o índice
EXPLAIN
SELECT *
FROM tb_product
WHERE name = 'Celular Samsung Galaxy A54';