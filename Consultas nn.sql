-- 1. Listar todos os tickets cadastrados (com joins)
SELECT t.id_ticket, t.data, tv.tipo_veiculo, tv.valor, v.modelo_veiculos, v.fabricante_veiculo, p.nome_praca, p.nome_cidade, p.nome_estado
FROM ticket t
JOIN tipo_veiculo tv ON t.tipo_veiculo_idvalores = tv.idvalores
JOIN veiculos v ON tv.veiculos_idveiculos = v.idveiculos
JOIN praca p ON t.praca_id_praca = p.id_praca;

-- 2. Contar a quantidade de tickets cadastrados
SELECT COUNT(*) AS total_tickets FROM ticket;

-- 3. Tickets em intervalo de 3 meses, de dois fabricantes
SELECT t.*
FROM ticket t
JOIN tipo_veiculo tv ON t.tipo_veiculo_idvalores = tv.idvalores
JOIN veiculos v ON tv.veiculos_idveiculos = v.idveiculos
WHERE t.data >= NOW() - INTERVAL '3 months'
  AND v.fabricante_veiculo IN ('Volkswagen', 'Toyota');

-- 4. Tickets de veículos de duas cidades específicas
SELECT t.*
FROM ticket t
JOIN tipo_veiculo tv ON t.tipo_veiculo_idvalores = tv.idvalores
JOIN veiculos v ON tv.veiculos_idveiculos = v.idveiculos
JOIN praca p ON t.praca_id_praca = p.id_praca
WHERE p.nome_cidade IN ('Campinas', 'Curitiba');

-- 5. Contar tickets de veículos do estado RS
SELECT COUNT(*) AS total_tickets_rs
FROM ticket t
JOIN praca p ON t.praca_id_praca = p.id_praca
WHERE p.nome_estado = 'RS';

-- 6. Tickets por cidade do veículo (praça)
SELECT p.nome_cidade, COUNT(*) AS total_tickets
FROM ticket t
JOIN praca p ON t.praca_id_praca = p.id_praca
GROUP BY p.nome_cidade
ORDER BY total_tickets DESC;

-- 7. Tickets por modelo do veículo
SELECT v.modelo_veiculos, COUNT(*) AS total_tickets
FROM ticket t
JOIN tipo_veiculo tv ON t.tipo_veiculo_idvalores = tv.idvalores
JOIN veiculos v ON tv.veiculos_idveiculos = v.idveiculos
GROUP BY v.modelo_veiculos
ORDER BY total_tickets DESC;

-- 8. Tickets por tipo de veículo
SELECT tv.tipo_veiculo, COUNT(*) AS total_tickets
FROM ticket t
JOIN tipo_veiculo tv ON t.tipo_veiculo_idvalores = tv.idvalores
GROUP BY tv.tipo_veiculo
ORDER BY total_tickets DESC;

-- 9. Valor de tickets emitidos em 3 meses, da Praça 1, para tipo passeio e moto
SELECT SUM(t.valor_ocorrencia) AS total_valor
FROM ticket t
JOIN tipo_veiculo tv ON t.tipo_veiculo_idvalores = tv.idvalores
WHERE t.data >= NOW() - INTERVAL '3 months'
  AND t.praca_id_praca = 1
  AND tv.tipo_veiculo IN ('Carro Passeio', 'Moto');

-- 10. Valor total de tickets por praça
SELECT p.nome_praca, SUM(t.valor_ocorrencia) AS total_valor
FROM ticket t
JOIN praca p ON t.praca_id_praca = p.id_praca
GROUP BY p.nome_praca
ORDER BY total_valor DESC;