-- 01_ddl.sql
-- Projeto Final - Laboratorio de Banco de Dados (GPE17M40083) - UCB
-- Dominio: Marketplace

DROP DATABASE IF EXISTS marketplace_db;

CREATE DATABASE marketplace_db
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE marketplace_db;

DROP TABLE IF EXISTS tb_product_supplier;
DROP TABLE IF EXISTS tb_order_status;
DROP TABLE IF EXISTS tb_orderItem;
DROP TABLE IF EXISTS tb_order;
DROP TABLE IF EXISTS tb_buyItem;
DROP TABLE IF EXISTS tb_cart;
DROP TABLE IF EXISTS tb_supplier;
DROP TABLE IF EXISTS tb_product;
DROP TABLE IF EXISTS tb_category;
DROP TABLE IF EXISTS tb_client;
DROP TABLE IF EXISTS tb_seller;
DROP TABLE IF EXISTS tb_user;

CREATE TABLE tb_user (
    id_user INT AUTO_INCREMENT,
    user VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL,
    CONSTRAINT pk_user PRIMARY KEY (id_user),
    CONSTRAINT uq_user_login UNIQUE (user),
    CONSTRAINT uq_user_email UNIQUE (email)
) ENGINE=InnoDB;

CREATE TABLE tb_seller (
    id_seller INT NOT NULL,
    CNPJ CHAR(14) NOT NULL,
    CONSTRAINT pk_seller PRIMARY KEY (id_seller),
    CONSTRAINT uq_seller_cnpj UNIQUE (CNPJ),
    CONSTRAINT fk_seller_user FOREIGN KEY (id_seller)
        REFERENCES tb_user(id_user)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE tb_client (
    id_client INT NOT NULL,
    phone VARCHAR(20) NULL,
    CONSTRAINT pk_client PRIMARY KEY (id_client),
    CONSTRAINT fk_client_user FOREIGN KEY (id_client)
        REFERENCES tb_user(id_user)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE tb_category (
    id_category INT AUTO_INCREMENT,
    category VARCHAR(100) NOT NULL,
    description VARCHAR(255) NULL,
    id_category_parent INT NULL,
    CONSTRAINT pk_category PRIMARY KEY (id_category),
    CONSTRAINT fk_category_parent FOREIGN KEY (id_category_parent)
        REFERENCES tb_category(id_category)
        ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE INDEX idx_category_parent ON tb_category(id_category_parent);

CREATE TABLE tb_product (
    id_product INT AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    value DECIMAL(15,2) NOT NULL,
    quantity INT NOT NULL,
    id_seller INT NOT NULL,
    id_category INT NOT NULL,
    CONSTRAINT pk_product PRIMARY KEY (id_product),
    CONSTRAINT ck_product_value_positive CHECK (value > 0),
    CONSTRAINT ck_product_quantity_nonneg CHECK (quantity >= 0),
    CONSTRAINT fk_product_seller FOREIGN KEY (id_seller)
        REFERENCES tb_seller(id_seller)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_product_category FOREIGN KEY (id_category)
        REFERENCES tb_category(id_category)
        ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE INDEX idx_product_seller ON tb_product(id_seller);
CREATE INDEX idx_product_category ON tb_product(id_category);

CREATE TABLE tb_supplier (
    id_supplier INT AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    CNPJ CHAR(14) NOT NULL,
    phone VARCHAR(20) NULL,
    CONSTRAINT pk_supplier PRIMARY KEY (id_supplier),
    CONSTRAINT uq_supplier_cnpj UNIQUE (CNPJ)
) ENGINE=InnoDB;

CREATE TABLE tb_cart (
    id_cart INT AUTO_INCREMENT,
    totalvalue DECIMAL(15,2) NOT NULL DEFAULT 0,
    itemquantity INT NOT NULL DEFAULT 0,
    id_client INT NOT NULL,
    CONSTRAINT pk_cart PRIMARY KEY (id_cart),
    CONSTRAINT ck_cart_totalvalue_nonneg CHECK (totalvalue >= 0),
    CONSTRAINT ck_cart_itemquantity_nonneg CHECK (itemquantity >= 0),
    CONSTRAINT fk_cart_client FOREIGN KEY (id_client)
        REFERENCES tb_client(id_client)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE INDEX idx_cart_client ON tb_cart(id_client);

CREATE TABLE tb_buyItem (
    id_product INT NOT NULL,
    id_cart INT NOT NULL,
    quantity INT NOT NULL,
    unit_value DECIMAL(15,2) NOT NULL,
    CONSTRAINT pk_buyitem PRIMARY KEY (id_product, id_cart),
    CONSTRAINT ck_buyitem_quantity_positive CHECK (quantity > 0),
    CONSTRAINT ck_buyitem_unitvalue_positive CHECK (unit_value > 0),
    CONSTRAINT fk_buyitem_product FOREIGN KEY (id_product)
        REFERENCES tb_product(id_product)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_buyitem_cart FOREIGN KEY (id_cart)
        REFERENCES tb_cart(id_cart)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE tb_order (
    id_order INT AUTO_INCREMENT,
    date_order DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    totalvalue DECIMAL(15,2) NOT NULL,
    id_client INT NOT NULL,
    CONSTRAINT pk_order PRIMARY KEY (id_order),
    CONSTRAINT ck_order_totalvalue_nonneg CHECK (totalvalue >= 0),
    CONSTRAINT fk_order_client FOREIGN KEY (id_client)
        REFERENCES tb_client(id_client)
        ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE INDEX idx_order_client ON tb_order(id_client);

CREATE TABLE tb_orderItem (
    id_order INT NOT NULL,
    id_product INT NOT NULL,
    quantity INT NOT NULL,
    unit_value DECIMAL(15,2) NOT NULL,
    CONSTRAINT pk_orderitem PRIMARY KEY (id_order, id_product),
    CONSTRAINT ck_orderitem_quantity_positive CHECK (quantity > 0),
    CONSTRAINT ck_orderitem_unitvalue_positive CHECK (unit_value > 0),
    CONSTRAINT fk_orderitem_order FOREIGN KEY (id_order)
        REFERENCES tb_order(id_order)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_orderitem_product FOREIGN KEY (id_product)
        REFERENCES tb_product(id_product)
        ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE tb_order_status (
    id_order INT NOT NULL,
    date_status DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) NOT NULL,
    CONSTRAINT pk_orderstatus PRIMARY KEY (id_order, date_status),
    CONSTRAINT ck_orderstatus_domain CHECK (
        status IN ('aberto', 'pago', 'enviado', 'entregue', 'cancelado')
    ),
    CONSTRAINT fk_orderstatus_order FOREIGN KEY (id_order)
        REFERENCES tb_order(id_order)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE tb_product_supplier (
    id_product INT NOT NULL,
    id_supplier INT NOT NULL,
    delivery_time INT NOT NULL,
    CONSTRAINT pk_productsupplier PRIMARY KEY (id_product, id_supplier),
    CONSTRAINT ck_productsupplier_deliverytime_positive CHECK (delivery_time > 0),
    CONSTRAINT fk_productsupplier_product FOREIGN KEY (id_product)
        REFERENCES tb_product(id_product)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_productsupplier_supplier FOREIGN KEY (id_supplier)
        REFERENCES tb_supplier(id_supplier)
        ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;
