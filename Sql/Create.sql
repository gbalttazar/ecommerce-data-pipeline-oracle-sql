
CREATE SEQUENCE sq_t_categoria ;

CREATE SEQUENCE sq_t_cliente ;

CREATE SEQUENCE sq_t_item_pedido ;

CREATE SEQUENCE sq_t_pedido ;

CREATE SEQUENCE sq_t_produto ;

CREATE SEQUENCE sq_t_subcategoria ;

CREATE SEQUENCE sq_stg_orders ;

CREATE SEQUENCE sq_stg_customers ;

CREATE SEQUENCE sq_stg_order_items ;

CREATE SEQUENCE sq_stg_products ;

CREATE SEQUENCE sq_category_translation ;

CREATE TABLE t_categoria (
    id_categoria NUMBER(12) NOT NULL,
    nm_categoria VARCHAR2(150) NOT NULL
);

ALTER TABLE t_categoria ADD CONSTRAINT t_categoria_pk PRIMARY KEY ( id_categoria );

CREATE TABLE t_cliente (
    id_cliente       NUMBER(12) NOT NULL,
    nm_cliente       VARCHAR2(100) NOT NULL,
    segmento_cliente VARCHAR2(30) NOT NULL,
    email_cliente    VARCHAR2(150) NOT NULL,
    cidade_cliente   VARCHAR2(50) NOT NULL,
    estado_cliente   VARCHAR2(2) NOT NULL,
    pais_cliente     VARCHAR2(15) NOT NULL,
    dt_cadastro      DATE NOT NULL
);

ALTER TABLE t_cliente ADD CONSTRAINT t_cliente_pk PRIMARY KEY ( id_cliente );

CREATE TABLE t_item_pedido (
    id_item_pedido             NUMBER(12) NOT NULL,
    qntd_item_pedido           NUMBER(5) NOT NULL,
    preco_unitario_item_pedido NUMBER(12, 2) NOT NULL,
    desconto_item_pedido       NUMBER(12, 2) NOT NULL,
    lucro_item_pedido          NUMBER(12, 2) NOT NULL,
    valor_total_item_pedido    NUMBER(12, 2) NOT NULL,
    id_pedido                  NUMBER(12) NOT NULL,
    id_produto                 NUMBER(12) NOT NULL
);

ALTER TABLE t_item_pedido ADD CONSTRAINT t_item_pedido_pk PRIMARY KEY ( id_item_pedido );

CREATE TABLE t_pedido (
    id_pedido             NUMBER(12) NOT NULL,
    dt_pedido             DATE NOT NULL,
    dt_envio              DATE NOT NULL,
    st_pedido             VARCHAR2(20) NOT NULL,
    prioridade_pedido     VARCHAR2(15) NOT NULL,
    valor_total_pedido    NUMBER(12, 2) NOT NULL,
    desconto_total_pedido NUMBER(12, 2) NOT NULL,
    id_cliente            NUMBER(12) NOT NULL
);

ALTER TABLE t_pedido ADD CONSTRAINT t_pedido_pk PRIMARY KEY ( id_pedido );

CREATE TABLE t_produto (
    id_produto         NUMBER(12) NOT NULL,
    nm_produto         VARCHAR2(150) NOT NULL,
    preco_base_produto NUMBER(12, 2) NOT NULL,
    id_subcategoria    NUMBER(12) NOT NULL
);

ALTER TABLE t_produto ADD CONSTRAINT t_produto_pk PRIMARY KEY ( id_produto );

CREATE TABLE t_subcategoria (
    id_subcategoria NUMBER(12) NOT NULL,
    nm_subcategoria VARCHAR2(150) NOT NULL,
    id_categoria    NUMBER(12) NOT NULL
);

ALTER TABLE t_subcategoria ADD CONSTRAINT t_subcategoria_pk PRIMARY KEY ( id_subcategoria );

CREATE TABLE stg_orders (
    order_id VARCHAR2(50),
    customer_id VARCHAR2(50),
    order_status VARCHAR2(20),
    order_purchase_timestamp TIMESTAMP,
    order_approved_at TIMESTAMP,
    order_delivered_carrier_date TIMESTAMP,
    order_delivered_customer_date TIMESTAMP,
    order_estimated_delivery_date TIMESTAMP
);

CREATE TABLE stg_customers (
    customer_id VARCHAR2(50),
    customer_unique_id VARCHAR2(50),
    customer_zip_code_prefix NUMBER,
    customer_city VARCHAR2(100),
    customer_state VARCHAR2(5)
);

CREATE TABLE stg_order_items (
    order_id VARCHAR2(50),
    order_item_id NUMBER,
    product_id VARCHAR2(50),
    seller_id VARCHAR2(50),
    shipping_limit_date DATE,
    price NUMBER(10,2),
    freight_value NUMBER(10,2)
);

CREATE TABLE stg_products (
    product_id VARCHAR2(50),
    product_category_name VARCHAR2(100),
    product_name_lenght NUMBER,
    product_description_lenght NUMBER,
    product_photos_qty NUMBER,
    product_weight_g NUMBER,
    product_length_cm NUMBER,
    product_height_cm NUMBER,
    product_width_cm NUMBER
);

CREATE TABLE stg_category_translation (
    product_category_name VARCHAR2(100),
    product_category_name_english VARCHAR2(100)
);


ALTER TABLE t_pedido
    ADD CONSTRAINT relation_1 FOREIGN KEY ( id_cliente )
        REFERENCES t_cliente ( id_cliente );

ALTER TABLE t_item_pedido
    ADD CONSTRAINT relation_2 FOREIGN KEY ( id_pedido )
        REFERENCES t_pedido ( id_pedido );

ALTER TABLE t_produto
    ADD CONSTRAINT relation_4 FOREIGN KEY ( id_subcategoria )
        REFERENCES t_subcategoria ( id_subcategoria );

ALTER TABLE t_subcategoria
    ADD CONSTRAINT relation_5 FOREIGN KEY ( id_categoria )
        REFERENCES t_categoria ( id_categoria );

ALTER TABLE t_item_pedido
    ADD CONSTRAINT relation_6 FOREIGN KEY ( id_produto )
        REFERENCES t_produto ( id_produto );

