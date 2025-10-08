-- ANÁLISE DE DADOS (exemplos de consulta)

-- Os cinco jogadores com mais vitórias 
SELECT 
	j.jogador_id,
	j.nome,
    SUM(CASE WHEN j.jogador_id = p.jogador_brancas_id AND p.resultado = '1-0' THEN 1
			 WHEN j.jogador_id = p.jogador_negras_id AND p.resultado = '0-1' THEN 1
             ELSE 0 END
		) AS total_vitorias
FROM jogadores j
LEFT JOIN partidas p 
	ON j.jogador_id IN (p.jogador_brancas_id, p.jogador_negras_id)
GROUP BY j.jogador_id, j.nome
ORDER BY total_vitorias DESC
LIMIT 5;


-- As cinco aberturas mais utilizadas
SELECT 
	a.abertura_id,
    a.nome_abertura,
    COUNT(p.id_partida) AS qnt_vezes_usada
FROM aberturas a
LEFT JOIN partidas p 
	ON a.abertura_id = p.abertura_id
GROUP BY a.abertura_id, a.nome_abertura
ORDER BY qnt_vezes_usada DESC
LIMIT 5;
    
    
-- Média de duração de partida por abertura
SELECT a.nome_abertura, ROUND(AVG(p.duracao_minutos), 0) AS media_de_tempo_minutos
FROM aberturas a
LEFT JOIN partidas p
	ON a.abertura_id = p.abertura_id
GROUP BY a.nome_abertura
ORDER BY media_de_tempo_minutos DESC;


-- Número de jogadores por país
SELECT pais, COUNT(jogador_id) AS jogadores_por_país
FROM jogadores
GROUP BY pais
ORDER BY jogadores_por_país DESC;

-- Os cinco jogadores mais jovens
SELECT nome, idade 
FROM jogadores
ORDER BY idade ASC
LIMIT 5;


-- Número de vitórias para as brancas por abertura
SELECT a.nome_abertura, COUNT(p.resultado) AS vitorias_para_brancas
FROM aberturas a 
LEFT JOIN partidas p 
	ON a.abertura_id = p.abertura_id
WHERE p.resultado = '1-0'
GROUP BY a.nome_abertura
ORDER BY vitorias_para_brancas DESC;






