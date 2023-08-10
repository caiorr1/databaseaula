CREATE TABLE tb_cliente
(
    id_cliente INT,
    nome_cliente VARCHAR2(100),
    cpf_cliente INT,
    telefone_cliente VARCHAR2(10),
    endereco_cliente VARCHAR2(100),
    
    CONSTRAINT pk_tb_cliente PRIMARY KEY(id_cliente)
);

CREATE TABLE tb_ingrediente
(
    id_ingrediente INT,
    nome_ingrediente VARCHAR2(100),
    
    CONSTRAINT pk_tb_ingrediente PRIMARY KEY(id_ingrediente)
);

CREATE TABLE tb_pizza
(
    id_pizza INT,
    nome_pizza VARCHAR2(100),
    preco_pizza NUMBER(10,2),
    
    CONSTRAINT pk_tb_pizza PRIMARY KEY(id_pizza)
);

CREATE TABLE tb_bebida
(
    id_bebida INT,
    nome_bebida VARCHAR2(100),
    preco_bebida NUMBER(10,2),
    
    CONSTRAINT pk_tb_bebida PRIMARY KEY(id_bebida)
);

CREATE TABLE tb_pedido
(
    id_pedido INT,
    id_cliente INT,
    data_hora_pedido TIMESTAMP,
    
    CONSTRAINT pk_tb_pedido PRIMARY KEY(id_pedido),
    CONSTRAINT fk_tb_pedido_cliente FOREIGN KEY(id_cliente)
        REFERENCES tb_cliente (id_cliente)
);

CREATE TABLE tb_pedido_pizza
(
    id_pedido INT,
    id_pizza INT,
    quantidade_pizza INT,
    
    CONSTRAINT fk_tb_pedido_pizza_pedido FOREIGN KEY (id_pedido)
        REFERENCES tb_pedido(id_pedido),
    CONSTRAINT fk_tb_pedido_pizza_pizza FOREIGN KEY (id_pizza)
        REFERENCES tb_pizza(id_pizza)
);

CREATE TABLE tb_pedido_bebida
(
    id_bebida INT,
    id_pedido INT,
    quantidade_bebida INT,
    
    CONSTRAINT fk_tb_pedido_bebida_bebida FOREIGN KEY(id_bebida)
        REFERENCES tb_bebida(id_bebida),
    CONSTRAINT fk_tb_pedido_bebida_pedido FOREIGN KEY(id_pedido)
        REFERENCES tb_pedido(id_pedido)
);

CREATE TABLE tb_pizza_composicao
(
    id_pizza INT,
    id_ingrediente INT,
    
    CONSTRAINT fk_tb_pizza_composicao_pizza FOREIGN KEY (id_pizza)
        REFERENCES tb_pizza(id_pizza),
    CONSTRAINT fk_tb_pizza_composicao_ingrediente FOREIGN KEY(id_ingrediente)
        REFERENCES tb_ingrediente(id_ingrediente)
);

DESC tb_cliente
DESC tb_ingrediente
DESC tb_pizza
DESC tb_bebida
DESC tb_pedido
DESC tb_pedido_pizza
DESC tb_pedido_bebida
DESC tb_pizza_composicao

ALTER TABLE tb_pedido_pizza DROP CONSTRAINT fk_tb_pedido_pizza_pedido;
ALTER TABLE tb_pedido_pizza DROP CONSTRAINT fk_tb_pedido_pizza_pizza;

ALTER TABLE tb_pedido_bebida DROP CONSTRAINT fk_tb_pedido_bebida_bebida;
ALTER TABLE tb_pedido_bebida DROP CONSTRAINT fk_tb_pedido_bebida_pedido;

ALTER TABLE tb_pizza_composicao DROP CONSTRAINT fk_tb_pizza_composicao_pizza;
ALTER TABLE tb_pizza_composicao DROP CONSTRAINT fk_tb_pizza_composicao_ingrediente;

ALTER TABLE tb_pedido DROP CONSTRAINT fk_tb_pedido_cliente;

DROP TABLE tb_pedido_pizza;
DROP TABLE tb_pedido_bebida;
DROP TABLE tb_pizza_composicao;
DROP TABLE tb_pedido;
DROP TABLE tb_cliente;
DROP TABLE tb_ingrediente;
DROP TABLE tb_pizza;
DROP TABLE tb_bebida;