
CREATE TABLE produtos (
                produto_id                  BIGINT         NOT NULL,
                nome                        VARCHAR(255)   NOT NULL,
                preco_unitario              NUMERIC(10,2),
                detalhes                    BYTEA,
                imagem                      BYTEA,
                imagem_mime_type            VARCHAR(512),
                imagem_arquivo              VARCHAR(512),
                imagem_charset              VARCHAR(512),
                imagem_ultima_atualizacao   DATE,
                CONSTRAINT pk_produtos PRIMARY KEY (produto_id)
);
COMMENT ON TABLE produtos                               IS 'Tabela contendo informa��es sobre os produtos vendidos nas lojas UVV. Primary key produto_id.';
COMMENT ON COLUMN produtos.produto_id                   IS 'Coluna contendo o identificador do produto � venda nas lojas. Primary key. Not null.';
COMMENT ON COLUMN produtos.nome                         IS 'Coluna contendo o nome do produto � venda nas lojas. Not null.';
COMMENT ON COLUMN produtos.preco_unitario               IS 'Coluna contendo o pre�o unit�rio de cada produto � venda nas lojas. Allows null.';
COMMENT ON COLUMN produtos.detalhes                     IS 'Coluna contendo detalhes sobre cada produto � venda nas lojas. Allows null.';
COMMENT ON COLUMN produtos.imagem                       IS 'Coluna contendo a imagem de cada produto � venda nas lojas. Allows null.';
COMMENT ON COLUMN produtos.imagem_mime_type             IS 'Coluna contendo o MIME type da imagem de cada produto � venda nas lojas. Indica o tipo e o formato do arquivo na internet. Allows null.';
COMMENT ON COLUMN produtos.imagem_arquivo               IS 'Coluna contendo o arquivo da imagem de cada produto � venda nas lojas. Allows null.';
COMMENT ON COLUMN produtos.imagem_charset               IS 'Coluna contendo o charset de cada imagem dos produtos � venda nas lojas. Allows null.';
COMMENT ON COLUMN produtos.imagem_ultima_atualizacao    IS 'Coluna contendo a data da �ltima atualiza��o da imagem de cada produto � venda nas lojas. Allows null.';


CREATE TABLE lojas (
                loja_id                     BIGINT        NOT NULL,
                nome                        VARCHAR(255)  NOT NULL,
                endereco_web                VARCHAR(100),
                endereco_fisico             VARCHAR(512),
                latitude                    NUMERIC(8,6),
                longitude                   NUMERIC(9,6),
                logo                        BYTEA,
                logo_mime_type              VARCHAR(512),
                logo_arquivo                VARCHAR(512),
                logo_charset                VARCHAR(512),
                logo_ultima_atualizacao     DATE,
                CONSTRAINT pk_lojas PRIMARY KEY (loja_id)
);
COMMENT ON TABLE lojas                              IS 'Tabela contendo informa��es sobre as lojas. Primary key loja_id.';
COMMENT ON COLUMN lojas.loja_id                     IS 'Coluna contendo o identificador da loja. Primary key. Not null.';
COMMENT ON COLUMN lojas.nome                        IS 'Coluna contendo o nome da loja. Not null.';
COMMENT ON COLUMN lojas.endereco_web                IS 'Coluna contendo o endere�o web da loja. Allows null.';
COMMENT ON COLUMN lojas.endereco_fisico             IS 'Coluna contendo o endere�o f�sico da loja. Allows null.';
COMMENT ON COLUMN lojas.latitude                    IS 'Coluna contendo a latitude do endere�o f�sico da loja. Allows null.';
COMMENT ON COLUMN lojas.longitude                   IS 'Coluna contendo a longitude do endere�o f�sico da loja. Allows null.';
COMMENT ON COLUMN lojas.logo                        IS 'Coluna contendo o c�digo bin�rio da logo das lojas. Allows null.';
COMMENT ON COLUMN lojas.logo_mime_type              IS 'Coluna contendo o MIME type da logo da loja. Indica o tipo e o formato do arquivo na internet. Allows null.';
COMMENT ON COLUMN lojas.logo_arquivo                IS 'Coluna contendo o arquivo da logo da loja. Allows null.';
COMMENT ON COLUMN lojas.logo_charset                IS 'Coluna contendo o charset da logo da loja. Allows null.';
COMMENT ON COLUMN lojas.logo_ultima_atualizacao     IS 'Coluna contendo a data da �ltima atualiza��o da logo da loja. Allows null.';


CREATE TABLE estoques (
                estoque_id      BIGINT   NOT NULL,
                loja_id         BIGINT   NOT NULL,
                produto_id      BIGINT   NOT NULL,
                quantidade      BIGINT,
                CONSTRAINT pk_estoques PRIMARY KEY (estoque_id)
);
COMMENT ON TABLE estoques               IS 'Tabela contendo informa��es sobre o estoque dos produtos das lojas. Primary key estoque_id.';
COMMENT ON COLUMN estoques.estoque_id   IS 'Coluna contendo o identificador do estoque de cada loja. Primary key. Not null.';
COMMENT ON COLUMN estoques.loja_id      IS 'Coluna contendo o identificador de cada loja. Foreign key referenciando a tabela lojas. Not null.';
COMMENT ON COLUMN estoques.produto_id   IS 'Coluna contendo o identificador de cada produto. Foreign key referenciando a tabela produtos. Not null.';
COMMENT ON COLUMN estoques.quantidade   IS 'Coluna contendo a quantidade de cada produto no estoque de cada loja. Not null.';


CREATE TABLE clientes (
                cliente_id      BIGINT          NOT NULL,
                email           VARCHAR(255)    NOT NULL,
                telefone1       VARCHAR(20),
                telefone2       VARCHAR(20),
                telefone3       VARCHAR(20),
                nome            VARCHAR(255)    NOT NULL,
                CONSTRAINT pk_clientes PRIMARY KEY (cliente_id)
);
COMMENT ON TABLE clientes               IS 'Tabela contendo informa��es sobre os clientes. Primary Key cliente_id.';
COMMENT ON COLUMN clientes.cliente_id   IS 'Coluna indetificadora do cliente. Primary Key. Not null.';
COMMENT ON COLUMN clientes.email        IS 'Coluna contendo o email do cliente. Not Null.';
COMMENT ON COLUMN clientes.telefone1    IS 'Primeira coluna contendo um n�mero de telefone do cliente. Allows null.';
COMMENT ON COLUMN clientes.telefone2    IS 'Segunda coluna contendo um n�mero de telefone do cliente. Allows null.';
COMMENT ON COLUMN clientes.telefone3    IS 'Terceira coluna contendo um n�mero de telefone do cliente. Allows null.';
COMMENT ON COLUMN clientes.nome         IS 'Coluna contendo o nome do cliente. Not null.';


CREATE TABLE envios (
                envio_id            BIGINT          NOT NULL,
                loja_id             BIGINT          NOT NULL,
                cliente_id          BIGINT          NOT NULL,
                endereco_entrega    VARCHAR(512)    NOT NULL,
                status              VARCHAR(15)     NOT NULL,
                CONSTRAINT pk_envios PRIMARY KEY (envio_id)
);
COMMENT ON TABLE envios                     IS 'Tabela contendo informa��es sobre o envio dos produtos. Primary key envio_id.';
COMMENT ON COLUMN envios.envio_id           IS 'Coluna contendo o identificador de envio de cada envio. Primary key. Not null.';
COMMENT ON COLUMN envios.loja_id            IS 'Coluna contendo o identificador de cada loja. Foreign key referenciando a tabela lojas. Not null.';
COMMENT ON COLUMN envios.cliente_id         IS 'Coluna contendo o identificador de cada cliente. Foreign key referenciando a tabela clientes. Not null.';
COMMENT ON COLUMN envios.endereco_entrega   IS 'Coluna contendo o endere�o de entrega de cada envio. Not null.';
COMMENT ON COLUMN envios.status             IS 'Coluna contendo o status do envio de cada envio. Not null.';


CREATE TABLE pedidos (
                pedido_id       BIGINT          NOT NULL,
                data_hora       TIMESTAMP       NOT NULL,
                cliente_id      BIGINT          NOT NULL,
                status          VARCHAR(15)     NOT NULL,
                loja_id         BIGINT          NOT NULL,
                CONSTRAINT pk_pedidos PRIMARY KEY (pedido_id)
);
COMMENT ON TABLE pedidos                IS 'Tabela contendo informa��es sobre os pedidos realizados pelos clientes nas lojas UVV. Primary key pedido_id.';
COMMENT ON COLUMN pedidos.pedido_id     IS 'Coluna contendo o indetificador dos pedidos. Primary Key. Not null.';
COMMENT ON COLUMN pedidos.data_hora     IS 'Coluna contendo a data e a hora da realiza��o do pedido. Not null.';
COMMENT ON COLUMN pedidos.cliente_id    IS 'Coluna contendo o identificador do cliente na tabela pedidos. Foreign Key referenciando tabela clientes. Not null.';
COMMENT ON COLUMN pedidos.status        IS 'Coluna contendo o status dos pedidos realizados pelos clientes. Not null.';
COMMENT ON COLUMN pedidos.loja_id       IS 'Coluna contendo o identificador da loja na tabela pedidos. Foreign key referenciando tabela lojas. Not null.';


CREATE TABLE pedidos_itens (
                pedido_id           BIGINT          NOT NULL,
                produto_id          BIGINT          NOT NULL,
                quantidade          BIGINT          NOT NULL,
                envio_id            BIGINT,
                numero_da_linha     BIGINT          NOT NULL,
                preco_unitario      NUMERIC(10,2)   NOT NULL,
                CONSTRAINT pk_pedidos_itens PRIMARY KEY (pedido_id, produto_id)
);
COMMENT ON TABLE pedidos_itens                      IS 'Tabela contendo informa��es sobre cada pedido de cada produto. Primary key composta pedido_id e produto_id.';
COMMENT ON COLUMN pedidos_itens.pedido_id           IS 'Coluna contendo o identificador de cada pedido. Primary key composta. Foreign key referenciando a tabela pedidos. Not null.';
COMMENT ON COLUMN pedidos_itens.produto_id          IS 'Coluna contendo o identificador de cada produto. Primary key composta. Foreign key referenciando a tabela produtos. Not null.';
COMMENT ON COLUMN pedidos_itens.quantidade          IS 'Coluna contendo a quantidade de cada produto. Not null.';
COMMENT ON COLUMN pedidos_itens.envio_id            IS 'Coluna contendo o identificador de envio de cada envio. Allows null.';
COMMENT ON COLUMN pedidos_itens.numero_da_linha     IS 'Coluna contendo o n�mero da linha de cada linha que cont�m informa��es sobre a tabela pedidos_itens. Not null.';
COMMENT ON COLUMN pedidos_itens.preco_unitario      IS 'Coluna contendo o pre�o unit�rio de cada produto. Not null.';


ALTER TABLE estoques ADD CONSTRAINT fk_produtos_estoques
FOREIGN KEY (produto_id)
REFERENCES produtos (produto_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE pedidos_itens ADD CONSTRAINT fk_produtos_pedidos_itens
FOREIGN KEY (produto_id)
REFERENCES produtos (produto_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE pedidos ADD CONSTRAINT fk_lojas_pedidos
FOREIGN KEY (loja_id)
REFERENCES lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE estoques ADD CONSTRAINT fk_lojas_estoques
FOREIGN KEY (loja_id)
REFERENCES lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE envios ADD CONSTRAINT fk_lojas_envios
FOREIGN KEY (loja_id)
REFERENCES lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE pedidos ADD CONSTRAINT fk_clientes_pedidos
FOREIGN KEY (cliente_id)
REFERENCES clientes (cliente_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE envios ADD CONSTRAINT fk_clientes_envios
FOREIGN KEY (cliente_id)
REFERENCES clientes (cliente_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE pedidos_itens ADD CONSTRAINT fk_envios_pedidos_itens
FOREIGN KEY (envio_id)
REFERENCES envios (envio_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE pedidos_itens ADD CONSTRAINT fk_pedidos_pedidos_itens
FOREIGN KEY (pedido_id)
REFERENCES pedidos (pedido_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
