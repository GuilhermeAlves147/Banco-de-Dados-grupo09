USE marketplace_db;

-- ==========================================
-- B6 - TABELA DE AUDITORIA
-- ==========================================

-- cria a tabela que guarda as alterações dos produtos
CREATE TABLE IF NOT EXISTS tb_audit_product (

    -- cria um id para cada registro
    id_audit INT AUTO_INCREMENT PRIMARY KEY,

    -- guarda o id do produto
    id_product INT NOT NULL,

    -- guarda o usuário conectado ao banco
    usuario VARCHAR(100) NOT NULL,

    -- guarda a data e a hora da alteração
    data_alteracao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    -- mostra qual operação foi realizada
    operacao VARCHAR(10) NOT NULL,

    -- guarda o preço antigo
    valor_antigo DECIMAL(15,2),

    -- guarda o preço novo
    valor_novo DECIMAL(15,2)
);


-- ==========================================
-- PRIMEIRA TRIGGER - ALTERAÇÃO DE PREÇO
-- ==========================================

-- remove a trigger antiga se ela já existir
DROP TRIGGER IF EXISTS trg_audit_product_update;

-- muda o delimitador para criar a trigger
DELIMITER $$

-- cria uma trigger que funciona depois de atualizar um produto
CREATE TRIGGER trg_audit_product_update
AFTER UPDATE ON tb_product
FOR EACH ROW
BEGIN

    -- verifica se o preço do produto mudou
    IF OLD.value <> NEW.value THEN

        -- salva a alteração na tabela de auditoria
        INSERT INTO tb_audit_product (
            id_product,
            usuario,
            operacao,
            valor_antigo,
            valor_novo
        )
        VALUES (
            NEW.id_product,
            USER(),
            'UPDATE',
            OLD.value,
            NEW.value
        );

    END IF;

END$$

-- volta o delimitador ao normal
DELIMITER ;


-- ==========================================
-- SEGUNDA TRIGGER - CADASTRO DE PRODUTO
-- ==========================================

-- remove a trigger antiga se ela já existir
DROP TRIGGER IF EXISTS trg_audit_product_insert;

-- muda o delimitador para criar a trigger
DELIMITER $$

-- cria uma trigger que funciona depois de cadastrar um produto
CREATE TRIGGER trg_audit_product_insert
AFTER INSERT ON tb_product
FOR EACH ROW
BEGIN

    -- salva o cadastro na tabela de auditoria
    INSERT INTO tb_audit_product (
        id_product,
        usuario,
        operacao,
        valor_antigo,
        valor_novo
    )
    VALUES (
        NEW.id_product,
        USER(),
        'INSERT',
        NULL,
        NEW.value
    );

END$$

-- volta o delimitador ao normal
DELIMITER ;
