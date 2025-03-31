DO $$ 
DECLARE
    i INT := 0;
BEGIN
    FOR i IN 1..100 LOOP  -- 100 * 10.000 = 1 milhão de registros
        INSERT INTO ticket (data, tipo_veiculo_idvalores, valor_ocorrencia, praca_id_praca)
        SELECT
            NOW() - (RANDOM() * INTERVAL '450 days'),  -- Data aleatória nos últimos 450 dias
            (FLOOR(RANDOM() * 5) + 1),  -- Random entre 1 e 5 para tipo_veiculo_idvalores
            ROUND((RANDOM() * (20.00 - 5.00) + 5.00)::numeric, 2),  -- Valor entre 5.00 e 20.00
            (FLOOR(RANDOM() * 5) + 1)  -- Random entre 1 e 5 para praca_id_praca
        FROM generate_series(1, 10000);  -- Insere 10.000 registros por iteração
    END LOOP;
END $$;
