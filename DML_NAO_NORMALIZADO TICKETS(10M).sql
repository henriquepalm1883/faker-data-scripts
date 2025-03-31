DO $$ 
DECLARE
    i INT := 0;
BEGIN
    FOR i IN 1..1000 LOOP  -- 1000 * 10.000 = 10 milhões de registros
        INSERT INTO ticket (data, tipo_veiculo_idvalores, valor_ocorrencia, praca_id_praca)
        SELECT
            NOW() - (RANDOM() * INTERVAL '450 days'),  
            (FLOOR(RANDOM() * 5) + 1),  
            ROUND((RANDOM() * (20.00 - 5.00) + 5.00)::numeric, 2),  
            (FLOOR(RANDOM() * 5) + 1)  
        FROM generate_series(1, 10000);
    END LOOP;
END $$;
