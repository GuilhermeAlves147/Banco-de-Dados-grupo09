USE marketplace_db;

-- B3 - Transações e Concorrência
-- Projeto Marketplace


-- ==========================================
-- 1. TESTE DE ROLLBACK
-- ==========================================

-- Aqui começamos a transação
START TRANSACTION;

-- Tiramos 5 unidades do estoque do produto 1
UPDATE tb_product
SET quantity = quantity - 5
WHERE id_product = 1;

-- Conferimos como ficou o estoque
SELECT id_product, name, quantity
FROM tb_product
WHERE id_product = 1;

-- Aqui desfazemos a alteração que fizemos
ROLLBACK;

-- Conferimos se o estoque voltou ao normal
SELECT id_product, name, quantity
FROM tb_product
WHERE id_product = 1;


-- ==========================================
-- 2. TESTE DE COMMIT
-- ==========================================

-- Começamos outra transação
START TRANSACTION;

-- Tiramos mais 5 unidades para fazer o teste
UPDATE tb_product
SET quantity = quantity - 5
WHERE id_product = 1;

-- Aqui salvamos a alteração no banco
COMMIT;

-- Conferimos se o estoque realmente mudou
SELECT id_product, name, quantity
FROM tb_product
WHERE id_product = 1;


-- ==========================================
-- 3. RESTAURANDO O ESTOQUE
-- ==========================================

-- Agora vamos devolver as 5 unidades
-- para deixar o estoque como estava antes
START TRANSACTION;

UPDATE tb_product
SET quantity = quantity + 5
WHERE id_product = 1;

-- Salvamos o estoque corrigido
COMMIT;

-- Conferimos se voltou ao valor original
SELECT id_product, name, quantity
FROM tb_product
WHERE id_product = 1;


-- ==========================================
-- 4. TESTE DE CONCORRÊNCIA
-- ==========================================

-- Nessa parte usamos duas conexões diferentes
-- para ver o que acontece quando as duas
-- tentam acessar o mesmo produto


-- ==========================================
-- CONEXÃO 1
-- ==========================================


USE marketplace_db;
-- Primeiro executamos essa parte na conexão 1
START TRANSACTION;

-- Aqui bloqueamos o produto 1
-- para outra conexão não conseguir alterar ele
SELECT id_product, name, quantity
FROM tb_product
WHERE id_product = 1
FOR UPDATE;

ROLLBACK;