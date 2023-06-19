---Banco de Dados II
---Desenvolvimento IV
--- Função com a linguagem  PL/SQL. Linguagem PL/SQL é uma extensão da linguagem SQL.

---Instruções do projeto
---Uma loja tem um banco de dados que contém todo o controle de vendas de produtos e de cadastro de clientes. Pensando nisso, crie uma função para somar todos os clientes que foram cadastrados na loja durante um dia.

-- Criação da tabela de produtos
CREATE TABLE produtos (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  quantidade INT NOT NULL,
  data_venda VARCHAR NOT NULL
);

-- Criação da tabela de clientes
CREATE TABLE clientes (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  data_cadastro VARCHAR NOT NULL
);

-- Inserção de dados na tabela "produtos"
INSERT INTO produtos 
(nome, quantidade, data_venda)
VALUES
  ('Produto A', 10, '19-06-2023'),
  ('Produto B', 5, '19-06-2023'),
  ('Produto C', 8, '18-06-2023'),
  ('Produto D', 15, '18-06-2023'),
  ('Produto E', 20, '17-06-2023');

-- Inserção de dados na tabela "clientes"
INSERT INTO clientes 
(nome,data_cadastro)
VALUES
  ('Cliente 1', '19-06-2023'),
  ('Cliente 2', '19-06-2023'),
  ('Cliente 3', '18-06-2023'),
  ('Cliente 4', '18-06-2023'),
  ('Cliente 5', '17-06-2023');


-- Função para somar clientes cadastrados em um dia específico.
CREATE OR REPLACE FUNCTION somar_clientes_por_dia(data_pesquisa VARCHAR)
RETURNS INTEGER 
AS
$$
DECLARE
    total_clientes INTEGER;
BEGIN
    SELECT COUNT(*) INTO total_clientes
    FROM clientes
    WHERE data_cadastro = data_pesquisa;

    RETURN total_clientes;
END;
$$
LANGUAGE plpgsql;

SELECT somar_clientes_por_dia('19-06-2023');
---Substitua a data '19-06-2023' pela data desejada. 
---A função retornará o número de clientes cadastrados no dia específico.
