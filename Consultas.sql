-- 1. Listar todos os tickets cadastrados com joins
SELECT
    t.id_ticket,
    t.data,
    tv.tipo_veiculo,
    tv.valor AS valor_tipo,
    t.valor_ocorrencia,
    p.nome_praca,
    c.nome_cidades,
    e.nome_estado,
    mv.descricao_modelo,
    fv.descricao_veiculo AS fabricante
FROM ticket t
JOIN tipo_veiculo tv ON t.tipo_veiculo_idvalores = tv.idvalores
JOIN veiculos v ON tv.veiculos_idveiculos = v.idveiculos
JOIN modelo_veiculos mv ON v.modelo_veiculos_id_modelo = mv.id_modelo
JOIN fabricante_veiculos fv ON mv.fabricante_veiculos_id_fabricantes_veiculos = fv.id_fabricantes_veiculos
JOIN praca p ON t.praca_id_praca = p.id_praca
JOIN cidades c ON p.cidades_id_cidades = c.id_cidades
JOIN estado e ON c.estado_id_estado = e.id_estado;

-- 2. Contar a quantidade de tickets
SELECT COUNT(*) AS total_tickets FROM ticket;

-- 3. Tickets no intervalo de 3 meses de dois fabricantes
SELECT *
FROM ticket t
JOIN tipo_veiculo tv ON t.tipo_veiculo_idvalores = tv.idvalores
JOIN veiculos v ON tv.veiculos_idveiculos = v.idveiculos
JOIN modelo_veiculos mv ON v.modelo_veiculos_id_modelo = mv.id_modelo
JOIN fabricante_veiculos fv ON mv.fabricante_veiculos_id_fabricantes_veiculos = fv.id_fabricantes_veiculos
WHERE t.data BETWEEN NOW() - INTERVAL '3 months' AND NOW()
  AND fv.descricao_veiculo IN ('Volkswagen', 'Fiat');

-- 4. Tickets de duas cidades específicas
SELECT *
FROM ticket t
JOIN praca p ON t.praca_id_praca = p.id_praca
JOIN cidades c ON p.cidades_id_cidades = c.id_cidades
WHERE c.nome_cidades IN ('São Paulo', 'Campinas');

-- 5. Quantidade de tickets de veículos do estado RS
SELECT COUNT(*) AS total_rs
FROM ticket t
JOIN praca p ON t.praca_id_praca = p.id_praca
JOIN cidades c ON p.cidades_id_cidades = c.id_cidades
JOIN estado e ON c.estado_id_estado = e.id_estado
WHERE e.nome_estado = 'Rio Grande do Sul';

-- 6. Tickets agrupados por cidade
SELECT c.nome_cidades, COUNT(*) AS total_tickets
FROM ticket t
JOIN praca p ON t.praca_id_praca = p.id_praca
JOIN cidades c ON p.cidades_id_cidades = c.id_cidades
GROUP BY c.nome_cidades
ORDER BY total_tickets DESC;

-- 7. Tickets agrupados por modelo de veículo
SELECT mv.descricao_modelo, COUNT(*) AS total
FROM ticket t
JOIN tipo_veiculo tv ON t.tipo_veiculo_idvalores = tv.idvalores
JOIN veiculos v ON tv.veiculos_idveiculos = v.idveiculos
JOIN modelo_veiculos mv ON v.modelo_veiculos_id_modelo = mv.id_modelo
GROUP BY mv.descricao_modelo
ORDER BY total DESC;

-- 8. Tickets agrupados por tipo de veículo
SELECT tv.tipo_veiculo, COUNT(*) AS total
FROM ticket t
JOIN tipo_veiculo tv ON t.tipo_veiculo_idvalores = tv.idvalores
GROUP BY tv.tipo_veiculo
ORDER BY total DESC;

-- 9. Valor dos tickets (3 meses), da praça 1, tipo passeio e moto
SELECT SUM(t.valor_ocorrencia) AS total
FROM ticket t
JOIN tipo_veiculo tv ON t.tipo_veiculo_idvalores = tv.idvalores
WHERE t.data BETWEEN NOW() - INTERVAL '3 months' AND NOW()
  AND t.praca_id_praca = 1
  AND tv.tipo_veiculo IN ('Carro', 'Moto');

-- 10. Valor dos tickets por praça
SELECT p.nome_praca, SUM(t.valor_ocorrencia) AS total
FROM ticket t
JOIN praca p ON t.praca_id_praca = p.id_praca
GROUP BY p.nome_praca
ORDER BY total DESC;
