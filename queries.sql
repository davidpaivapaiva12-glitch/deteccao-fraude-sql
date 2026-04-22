-- Transações suspeitas (valor alto)
SELECT *
FROM Transacoes
WHERE Valor > 10000;

-- Transações em cidades diferentes no mesmo dia
SELECT t1.Cliente, t1.Cidade, t2.Cidade, t1.DataTransacao
FROM Transacoes t1
JOIN Transacoes t2 
ON t1.Cliente = t2.Cliente 
AND CAST(t1.DataTransacao AS DATE) = CAST(t2.DataTransacao AS DATE)
AND t1.Cidade <> t2.Cidade;

-- Muitas transações em curto período
SELECT Cliente, COUNT(*) AS Quantidade
FROM Transacoes
GROUP BY Cliente
HAVING COUNT(*) > 2;
