-- Inserindo dados na tabela veiculos
INSERT INTO veiculos (modelo_veiculos, fabricante_veiculo) VALUES
('Gol', 'Volkswagen'),
('Corolla', 'Toyota'),
('Civic', 'Honda'),
('Strada', 'Fiat'),
('Ranger', 'Ford');

-- Inserindo dados na tabela tipo_veiculo
INSERT INTO tipo_veiculo (tipo_veiculo, valor, veiculos_idveiculos) VALUES
('Carro Passeio', 7.50, 1),
('Carro Passeio', 7.50, 2),
('Carro Passeio', 7.50, 3),
('Caminhonete', 12.00, 4),
('Caminhonete', 12.00, 5);

-- Inserindo dados na tabela praca
INSERT INTO praca (nome_praca, nome_cidade, nome_estado) VALUES
('Pedágio SP-330', 'Campinas', 'São Paulo'),
('Pedágio BR-101', 'Florianópolis', 'Santa Catarina'),
('Pedágio BR-116', 'Curitiba', 'Paraná'),
('Pedágio SP-280', 'Sorocaba', 'São Paulo'),
('Pedágio BR-040', 'Belo Horizonte', 'Minas Gerais');
