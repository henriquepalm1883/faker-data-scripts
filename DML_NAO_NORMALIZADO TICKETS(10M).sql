INSERT INTO ticket (data, tipo_veiculo_idvalores, valor_ocorrencia, praca_id_praca)
SELECT
    NOW() - (RANDOM() * INTERVAL '450 days'),  
    (SELECT idvalores FROM tipo_veiculo ORDER BY RANDOM() LIMIT 1),  
    ROUND((RANDOM() * (20.00 - 5.00) + 5.00)::numeric, 2),  
    (SELECT id_praca FROM praca ORDER BY RANDOM() LIMIT 1)  
FROM generate_series(1, 10000000);
