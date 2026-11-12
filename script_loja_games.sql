-- Criação do Banco de Dados e Estrutura Base
DROP DATABASE IF EXISTS loja_games;
CREATE DATABASE loja_games;
USE loja_games;

CREATE TABLE localizacao (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Secao VARCHAR(50)
);

INSERT INTO localizacao (Id, Secao) VALUES
(1, 'Aventura'), (2, 'Corrida'), (3, 'RPG'),
(4, 'Esportes'), (5, 'Luta'), (6, 'Estratégia'), (7, 'Plataforma');

CREATE TABLE jogo (
    Cod INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100),
    Valor DECIMAL(10, 2),
    Localizacao_Id INT,
    FOREIGN KEY (Localizacao_Id) REFERENCES localizacao(Id)
);

INSERT INTO jogo (Nome, Valor, Localizacao_Id) VALUES
('Mario Carro 8', 125.00, 2),
('A Lenda do Zeldo: Chorinho do Reino', 299.00, 1),
('Chrono Break', 205.00, 3),
('Fakemon Lápis/Caneta: Double Pack', 589.00, 3),
('Super Mério Broca', 349.00, 7),
('A Sombra do Colosso', 200.00, 1),
('NFS U2 Remake', 150.00, 2);

-- 1. Inserção de novos títulos
INSERT INTO jogo (Nome, Valor, Localizacao_Id) VALUES
('CTR', 250.00, 1),
('Donkey Monkey Country 4', 300.00, 7),
('Horizonte Esquecido Oeste', 150.00, 3),
('Final Costume XX', 299.00, 6);

-- 2. Aplicação de 50% de desconto nos jogos selecionados
UPDATE jogo 
SET Valor = Valor * 0.5 
WHERE Nome IN ('A Sombra do Colosso', 'NFS U2 Remake');

-- 3. Criação da tabela promocao com chave estrangeira
CREATE TABLE promocao (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Jogo_Cod INT,
    FOREIGN KEY (Jogo_Cod) REFERENCES jogo(Cod)
);

-- 4. Inserção na tabela promocao usando subconsultas aninhadas
INSERT INTO promocao (Jogo_Cod) VALUES 
((SELECT Cod FROM jogo WHERE Nome = 'A Sombra do Colosso')),
((SELECT Cod FROM jogo WHERE Nome = 'NFS U2 Remake'));

-- 5. Consulta de jogos em promoção (JOIN + Subconsulta IN)
SELECT jogo.Nome, jogo.Valor, localizacao.Secao
FROM jogo
JOIN localizacao ON jogo.Localizacao_Id = localizacao.Id
WHERE jogo.Cod IN (SELECT Jogo_Cod FROM promocao);

-- 6. Consulta de jogos fora da promoção (Subconsulta NOT IN + ORDER BY)
SELECT jogo.Nome, jogo.Valor
FROM jogo
WHERE jogo.Cod NOT IN (SELECT Jogo_Cod FROM promocao)
ORDER BY jogo.Cod DESC;
