-- Inserir dados na tabela estado
INSERT INTO estado (id_estado, nome_estado) VALUES
(1, 'São Paulo'),
(2, 'Rio de Janeiro'),
(3, 'Minas Gerais'),
(4, 'Bahia'),
(5, 'Paraná');

-- Inserir dados na tabela cidades
INSERT INTO cidades (id_cidades, nome_cidades, estado_id_estado) VALUES
(1, 'São Paulo', 1),
(2, 'Campinas', 1),
(3, 'Rio de Janeiro', 2),
(4, 'Niterói', 2),
(5, 'Belo Horizonte', 3),
(6, 'Ouro Preto', 3),
(7, 'Salvador', 4),
(8, 'Feira de Santana', 4),
(9, 'Curitiba', 5),
(10, 'Londrina', 5);

-- Inserir dados na tabela praca
INSERT INTO praca (id_praca, nome_praca, cidades_id_cidades) VALUES
(1, 'Praça da Sé', 1),
(2, 'Praça XV', 2),
(3, 'Praça da Liberdade', 3),
(4, 'Praça Campo Grande', 4),
(5, 'Praça Tiradentes', 5);

-- Inserir dados na tabela fabricante_veiculos
INSERT INTO fabricante_veiculos (id_fabricantes_veiculos, descricao_veiculo) VALUES
(1, 'Volkswagen'),
(2, 'Fiat'),
(3, 'Chevrolet'),
(4, 'Ford'),
(5, 'Honda');

-- Inserir dados na tabela modelo_veiculos
INSERT INTO modelo_veiculos (id_modelo, descricao_modelo, fabricante_veiculos_id_fabricantes_veiculos) VALUES
(1, 'Gol', 1),
(2, 'Fusca', 1),
(3, 'Uno', 2),
(4, 'Palio', 2),
(5, 'Onix', 3),
(6, 'Civic', 4),
(7, 'Fiesta', 5);

-- Inserir dados na tabela veiculos
INSERT INTO veiculos (idveiculos, modelo_veiculos_id_modelo) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7);

-- Inserir dados na tabela tipo_veiculo
INSERT INTO tipo_veiculo (idvalores, tipo_veiculo, valor, veiculos_idveiculos) VALUES
(1, 'Moto', 10.00, 1),
(2, 'Carro', 20.00, 2),
(3, 'Caminhão 3 Eixos', 50.00, 3),
(4, 'Caminhão 4 Eixos', 60.00, 4),
(5, 'Ônibus', 40.00, 5);
