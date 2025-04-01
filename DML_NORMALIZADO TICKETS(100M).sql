INSERT INTO ticket (data, tipo_veiculo_idvalores, valor_ocorrencia, praca_id_praca)
SELECT
    NOW() - (RANDOM() * INTERVAL '365 days'),  
    (SELECT idvalores FROM tipo_veiculo ORDER BY RANDOM() LIMIT 1),  
    ROUND((RANDOM() * (99.99 - 10.00) + 10.00)::numeric, 2),  
    (SELECT id_praca FROM praca ORDER BY RANDOM() LIMIT 1)  
FROM generate_series(1, 100000000);
