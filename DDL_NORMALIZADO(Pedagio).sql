-- Criando a tabela estado
CREATE TABLE estado (
    id_estado SERIAL PRIMARY KEY,
    nome_estado VARCHAR(45) NOT NULL
);

-- Criando a tabela cidades
CREATE TABLE cidades (
    id_cidades SERIAL PRIMARY KEY,
    nome_cidades VARCHAR(45) NOT NULL,
    estado_id_estado INT NOT NULL,
    FOREIGN KEY (estado_id_estado) REFERENCES estado(id_estado)
);

-- Criando a tabela praca
CREATE TABLE praca (
    id_praca SERIAL PRIMARY KEY,
    nome_praca VARCHAR(45) NOT NULL,
    cidades_id_cidades INT NOT NULL,
    FOREIGN KEY (cidades_id_cidades) REFERENCES cidades(id_cidades)
);

-- Criando a tabela fabricante_veiculos
CREATE TABLE fabricante_veiculos (
    id_fabricantes_veiculos SERIAL PRIMARY KEY,
    descricao_veiculo VARCHAR(45) NOT NULL
);

-- Criando a tabela modelo_veiculos
CREATE TABLE modelo_veiculos (
    id_modelo SERIAL PRIMARY KEY,
    descricao_modelo VARCHAR(45) NOT NULL,
    fabricante_veiculos_id_fabricantes_veiculos INT NOT NULL,
    FOREIGN KEY (fabricante_veiculos_id_fabricantes_veiculos) REFERENCES fabricante_veiculos(id_fabricantes_veiculos)
);

-- Criando a tabela veiculos
CREATE TABLE veiculos (
    idveiculos SERIAL PRIMARY KEY,
    modelo_veiculos_id_modelo INT NOT NULL,
    FOREIGN KEY (modelo_veiculos_id_modelo) REFERENCES modelo_veiculos(id_modelo)
);

-- Criando a tabela tipo_veiculo
CREATE TABLE tipo_veiculo (
    idvalores SERIAL PRIMARY KEY,
    tipo_veiculo VARCHAR(45) NOT NULL,
    valor DECIMAL(4,2) NOT NULL,
    veiculos_idveiculos INT NOT NULL,
    FOREIGN KEY (veiculos_idveiculos) REFERENCES veiculos(idveiculos)
);

-- Criando a tabela ticket
CREATE TABLE ticket (
    id_ticket SERIAL PRIMARY KEY,
    data TIMESTAMP NOT NULL,
    tipo_veiculo_idvalores INT NOT NULL,
    valor_ocorrencia DECIMAL(4,2) NOT NULL,
    praca_id_praca INT NOT NULL,
    FOREIGN KEY (tipo_veiculo_idvalores) REFERENCES tipo_veiculo(idvalores),
    FOREIGN KEY (praca_id_praca) REFERENCES praca(id_praca)
);
