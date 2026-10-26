use marketplace_db;
CREATE OR REPLACE VIEW vw_user_public AS
SELECT id_user, user, email
FROM tb_user;
CREATE VIEW vw_sales_by_category AS
SELECT c.id_category,
       c.category,
       COUNT(DISTINCT o.id_order)             AS orders,
       CAST(SUM(oi.quantity) AS SIGNED)       AS units,
       SUM(oi.quantity * oi.unit_value)       AS revenue
FROM tb_orderItem oi
JOIN tb_order o    ON o.id_order = oi.id_order
JOIN tb_product p  ON p.id_product = oi.id_product
JOIN tb_category c ON c.id_category = p.id_category
WHERE o.id_order NOT IN (SELECT id_order FROM tb_order_status WHERE status = 'cancelado')
GROUP BY c.id_category, c.category;

CREATE ROLE IF NOT EXISTS 'role_admin', 'role_vendedor', 'role_analista';

-- admin: dados do banco todo, sem DDL
GRANT SELECT, INSERT, UPDATE, DELETE ON marketplace_db.* TO 'role_admin';

-- vendedor: gerencia o catálogo, sem ver senhas nem pedidos
GRANT SELECT ON marketplace_db.tb_category TO 'role_vendedor';
GRANT SELECT ON marketplace_db.tb_supplier TO 'role_vendedor';
GRANT SELECT, INSERT, UPDATE, DELETE ON marketplace_db.tb_product TO 'role_vendedor';
GRANT SELECT, INSERT, UPDATE, DELETE ON marketplace_db.tb_product_supplier TO 'role_vendedor';
GRANT SELECT ON marketplace_db.vw_user_public TO 'role_vendedor';
REVOKE DELETE ON marketplace_db.tb_product FROM 'role_vendedor';

-- analista: só lê 
GRANT SELECT ON marketplace_db.vw_sales_by_category TO 'role_analista';
GRANT SELECT ON marketplace_db.vw_user_public TO 'role_analista';

CREATE USER IF NOT EXISTS 'app_admin'@'localhost'    IDENTIFIED BY 'TROQUE_SENHA_ADMIN';
CREATE USER IF NOT EXISTS 'app_vendedor'@'localhost' IDENTIFIED BY 'TROQUE_SENHA_VENDEDOR';
CREATE USER IF NOT EXISTS 'app_analista'@'localhost' IDENTIFIED BY 'TROQUE_SENHA_ANALISTA';

GRANT 'role_admin'    TO 'app_admin'@'localhost';
GRANT 'role_vendedor' TO 'app_vendedor'@'localhost';
GRANT 'role_analista' TO 'app_analista'@'localhost';

SET DEFAULT ROLE ALL TO 'app_admin'@'localhost', 'app_vendedor'@'localhost', 'app_analista'@'localhost';
