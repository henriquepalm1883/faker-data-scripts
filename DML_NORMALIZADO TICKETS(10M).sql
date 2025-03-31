DO $$ 
DECLARE
    i INT := 0;
BEGIN
    FOR i IN 1..1000 LOOP  -- 1000 * 10.000 = 10 milhões de registros
        INSERT INTO ticket (data, tipo_veiculo_idvalores, valor_ocorrencia, praca_id_praca)
        SELECT
            NOW() - (RANDOM() * INTERVAL '365 days'),  -- Data aleatória dentro do último ano
            (FLOOR(RANDOM() * 5) + 1),  -- Random para tipo_veiculo_idvalores (1-5) com 5 valores válidos
            ROUND((RANDOM() * (99.99 - 10.00) + 10.00)::numeric, 2),  -- Random valor_ocorrencia entre 10.00 e 99.99
            (FLOOR(RANDOM() * 5) + 1)  -- Random para praca_id_praca (1-5)
        FROM generate_series(1, 10000)  -- Insere 10.000 registros por vez
        WHERE (FLOOR(RANDOM() * 5) + 1) IN (SELECT idvalores FROM tipo_veiculo);  -- Garante que o tipo_veiculo_idvalores seja válido
    END LOOP;
END $$;
