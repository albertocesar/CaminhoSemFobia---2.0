
-- TABLEs

CREATE TABLE usuario (
    nome_completo character varying(100),
    senha character varying(50),
    email character varying(100),
    cod_usuario  INT NOT NULL
);

CREATE TABLE atendimento (
    cod_atendimento INT NOT NULL,
    relato character varying(100),
    cod_usuario  INT,
    cod_estabelecimento INT
);

CREATE TABLE endereco (
    nome_rua character varying(50),
    bairro character varying(50),
    cidade character varying(50),
    estado character varying(50),
    cod_endereco INT NOT NULL
);

CREATE TABLE estabelecimento (
    cod_estabelecimento INT NOT NULL,
    nome_estabelecimento character varying(50),
    rua character varying(100),
    numero INT,
    estado character varying(50),
    cidade character varying(100),
    cod_endereco INT,
    cod_localizacao INT
);

CREATE TABLE localizacao (
    ns numeric,
    lat numeric,
    eo numeric,
    cod_localizacao INT NOT NULL,
    longi numeric
);

CREATE TABLE violencia (
    relato character varying(1000),
    cod_violencia INT NOT NULL,
    cod_usuario INT,
    cod_localizacao INT,
    cod_endereco INT,
    cod_estabelecimento INT
);

-- PKs

ALTER TABLE atendimento
    ADD CONSTRAINT pk_atendimento PRIMARY KEY (cod_atendimento);

ALTER TABLE usuario
    ADD CONSTRAINT pk_usuario PRIMARY KEY (cod_usuario);

ALTER TABLE endereco
    ADD CONSTRAINT pk_endereco PRIMARY KEY (cod_endereco);

ALTER TABLE estabelecimento
    ADD CONSTRAINT pk_estabelecimento PRIMARY KEY (cod_estabelecimento);

ALTER TABLE localizacao
    ADD CONSTRAINT pk_localizacao PRIMARY KEY (cod_localizacao);

-- FKs

ALTER TABLE atendimento
    ADD CONSTRAINT fk_atendimento_estabelecimento FOREIGN KEY (cod_estabelecimento) REFERENCES estabelecimento(cod_estabelecimento);

ALTER TABLE atendimento
    ADD CONSTRAINT fk_atendimento_usuario FOREIGN KEY (cod_usuario) REFERENCES usuario(cod_usuario);

ALTER TABLE estabelecimento
    ADD CONSTRAINT fk_estabelecimento_endereco FOREIGN KEY (cod_endereco) REFERENCES endereco(cod_endereco);

ALTER TABLE   estabelecimento
    ADD CONSTRAINT fk_estabelecimento_localizacao FOREIGN KEY (cod_localizacao) REFERENCES localizacao(cod_localizacao);

ALTER TABLE violencia
    ADD CONSTRAINT fk_violencia_endereco FOREIGN KEY (cod_endereco) REFERENCES endereco(cod_endereco);
    
ALTER TABLE violencia
    ADD CONSTRAINT fk_violencia_usuario FOREIGN KEY (cod_usuario) REFERENCES usuario(cod_usuario);

ALTER TABLE violencia
    ADD CONSTRAINT fk_violencia_estabelecimento FOREIGN KEY (cod_estabelecimento) REFERENCES estabelecimento(cod_estabelecimento);

ALTER TABLE violencia
    ADD CONSTRAINT fk_violencia_localizacao FOREIGN KEY (cod_localizacao) REFERENCES localizacao(cod_localizacao);