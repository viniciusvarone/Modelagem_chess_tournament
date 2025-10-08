CREATE DATABASE Torneio_Xadrez;
USE Torneio_Xadrez;

CREATE TABLE IF NOT EXISTS jogadores (
	jogador_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    rating INT,
    pais VARCHAR(100),
    idade INT
);

CREATE TABLE IF NOT EXISTS aberturas (
	abertura_id INT AUTO_INCREMENT PRIMARY KEY,
    nome_abertura VARCHAR (100),
    codigo_ECO CHAR(3) NOT NULL
);

CREATE TABLE IF NOT EXISTS rodada (
	rodada_id INT AUTO_INCREMENT PRIMARY KEY,
    numero_rodada INT CHECK (numero_rodada > 0),
    data_rodada DATE
);

CREATE TABLE IF NOT EXISTS partidas (
	id_partida INT AUTO_INCREMENT PRIMARY KEY,
    jogador_brancas_id INT, 
    jogador_negras_id INT, 
    abertura_id INT, 
    rodada_id INT, 
    resultado VARCHAR(5) CHECK (resultado IN ('1-0', '0-1', '½-½')),
    duracao_minutos INT,
    FOREIGN KEY (jogador_brancas_id) REFERENCES jogadores(jogador_id),
    FOREIGN KEY (jogador_negras_id) REFERENCES jogadores(jogador_id),
    FOREIGN KEY (abertura_id) REFERENCES aberturas(abertura_id),
    FOREIGN KEY (rodada_id) REFERENCES rodada(rodada_id)
);
