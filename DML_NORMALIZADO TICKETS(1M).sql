TRUNCATE ticket RESTART IDENTITY;

INSERT INTO ticket (data, tipo_veiculo_idvalores, valor_ocorrencia, praca_id_praca)
SELECT
    NOW() - (random() * INTERVAL '365 days'),
    tipo,
    CASE tipo
        WHEN 1 THEN 10.00
        WHEN 2 THEN 20.00
        WHEN 3 THEN 50.00
        WHEN 4 THEN 60.00
        WHEN 5 THEN 40.00
    END,
    (floor(random() * 5) + 1)::int
FROM (
    SELECT (floor(random() * 5) + 1)::int AS tipo
    FROM generate_series(1, 1000000)
) AS dados;
