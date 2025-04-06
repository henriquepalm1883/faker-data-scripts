TRUNCATE ticket RESTART IDENTITY;

INSERT INTO ticket (data, tipo_veiculo_idvalores, valor_ocorrencia, praca_id_praca)
SELECT
    NOW() - (random() * INTERVAL '365 days'),
    tv.idvalores,
    tv.valor,
    p.id_praca
FROM
    generate_series(1, 1000000) AS s(n)
    JOIN tipo_veiculo tv ON tv.idvalores = (floor(random() * 5) + 1)
    JOIN praca p ON p.id_praca = (floor(random() * 5) + 1);
