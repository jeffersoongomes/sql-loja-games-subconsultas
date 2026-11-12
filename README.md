# 🎮 Gestão de Catálogo e Promoções — Loja de Games (SQL)

Projeto prático desenvolvido em **MySQL** focado na modelagem relacional, manipulação de dados (DML) e utilização de **subconsultas aninhadas** e **junções (`JOIN`)** para gerenciar o catálogo de títulos e campanhas promocionais de uma loja de jogos.

## 🎯 Objetivos do Projeto
* **Modelagem Relacional:** Criação de tabelas com chaves primárias (`PRIMARY KEY`) e estrangeiras (`FOREIGN KEY`) garantindo a integridade referencial entre jogos, seções e promoções.
* **Atualização em Lote:** Aplicação de regras de negócio para descontos promocionais de 50% utilizando `UPDATE` e operador `IN`.
* **Subconsultas Aninhadas:** Inserção dinâmica de registros e filtragem avançada de itens em promoção (`IN`) e fora de promoção (`NOT IN`).
* **Cruzamento de Dados:** Uso de `INNER JOIN` para consolidar informações de múltiplas tabelas em relatórios claros.

## 🛠️ Tecnologias Utilizadas
* **SGBD:** MySQL 8.0
* **Ambiente de Desenvolvimento:** MySQL Workbench

## 📂 Estrutura do Repositório
* `script_loja_games.sql`: Script SQL completo contendo a criação do banco de dados, inserção de dados iniciais, alterações e consultas analíticas.

## 🚀 Como Executar
1. Abra o **MySQL Workbench** e conecte-se à sua instância local.
2. Abra o ficheiro `script_loja_games.sql`.
3. Execute o script completo para criar a base `loja_games` e visualizar os resultados das consultas.
