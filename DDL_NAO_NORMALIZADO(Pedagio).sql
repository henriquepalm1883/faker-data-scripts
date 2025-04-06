CREATE TABLE veiculos (
    idveiculos SERIAL PRIMARY KEY,
    modelo_veiculos VARCHAR(45) NOT NULL,
    fabricante_veiculo VARCHAR(45) NOT NULL
);

CREATE TABLE tipo_veiculo (
    idvalores SERIAL PRIMARY KEY,
    tipo_veiculo VARCHAR(45) NOT NULL,
    valor DECIMAL(4,2) NOT NULL,
    veiculos_idveiculos INT NOT NULL,
    FOREIGN KEY (veiculos_idveiculos) REFERENCES veiculos(idveiculos)
);

CREATE TABLE praca (
    id_praca SERIAL PRIMARY KEY,
    nome_praca VARCHAR(45) NOT NULL,
    nome_cidade VARCHAR(45) NOT NULL,
    nome_estado VARCHAR(45) NOT NULL
);

CREATE TABLE ticket (
    id_ticket SERIAL PRIMARY KEY,
    data TIMESTAMP NOT NULL,
    tipo_veiculo_idvalores INT NOT NULL,
    valor_ocorrencia DECIMAL(4,2) NOT NULL,
    praca_id_praca INT NOT NULL,
    FOREIGN KEY (tipo_veiculo_idvalores) REFERENCES tipo_veiculo(idvalores),
    FOREIGN KEY (praca_id_praca) REFERENCES praca(id_praca)
);
