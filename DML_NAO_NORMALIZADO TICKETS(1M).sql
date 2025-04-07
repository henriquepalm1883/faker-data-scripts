TRUNCATE ticket RESTART IDENTITY;

INSERT INTO ticket (data, tipo_veiculo_idvalores, valor_ocorrencia, praca_id_praca)
SELECT
    NOW() - (random() * INTERVAL '365 days'),
    tv.idvalores,
    tv.valor,
    p.id_praca
FROM (
    SELECT
        (floor(random() * 5) + 1)::int AS tipo_id,
        (floor(random() * 5) + 1)::int AS praca_id
    FROM generate_series(1, 1000000)
) AS dados
JOIN tipo_veiculo tv ON tv.idvalores = dados.tipo_id
JOIN praca p ON p.id_praca = dados.praca_id;
