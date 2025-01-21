/**********************		FUNCTION	******************************/
CREATE FUNCTION primeira_funcao() RETURNS INTEGER AS '
	SELECT (5-3) * 2
' LANGUAGE SQL;

select primeira_funcao() as numero;

/****************************************************/

CREATE FUNCTION soma(a INTEGER,b INTEGER) RETURNS INTEGER AS '
	SELECT a+b
' LANGUAGE SQL;

select soma(5,9) as soma;

/****************************************************/

CREATE TABLE IF NOT EXISTS a (nome VARCHAR(255) NOT NULL);
CREATE OR REPLACE FUNCTION cria_a(nome VARCHAR) RETURNS VARCHAR /* void*/ AS $$
    INSERT INTO a (nome) VALUES(cria_a.nome);
    
    SELECT nome;
$$ LANGUAGE SQL;

SELECT cria_a('Lucy Adriana')

/****************************************************/
CREATE TABLE IF NOT EXISTS instrutor (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    salario DECIMAL(10, 2)
);

INSERT INTO instrutor (nome, salario) VALUES ('Lucy Adriana', 100)

CREATE FUNCTION dobro_do_salario(instrutor) RETURNS DECIMAL AS $$ 
    SELECT $1.salario * 2 AS dobro;
$$ LANGUAGE SQL;

SELECT nome, dobro_do_salario(instrutor.*) FROM instrutor;


/****************************************************/


CREATE OR REPLACE FUNCTION cria_instrutor_falso() RETURNS instrutor AS $$ 
      SELECT 22 AS id, 'Nome falso' AS nome, 500::DECIMAL AS salario; 
$$ LANGUAGE SQL;

SELECT * FROM cria_instrutor_falso(); 

/****************************************************/

INSERT INTO instrutor (nome, salario) VALUES ('Simon', 100);
INSERT INTO instrutor (nome, salario) VALUES ('Perry', 50);
INSERT INTO instrutor (nome, salario) VALUES ('Morgana Joy', 500);
INSERT INTO instrutor (nome, salario) VALUES ('Celeste', 250);



CREATE FUNCTION instrutores_bem_pagos(valor_salario DECIMAL) RETURNS SETOF instrutor AS $$ 
    SELECT * FROM instrutor WHERE salario > valor_salario; 

$$ LANGUAGE SQL;

SELECT * FROM instrutores_bem_pagos(200);

/****************************************************/

DROP FUNCTION IF EXISTS soma_e_produto;
CREATE FUNCTION soma_e_produto (numero_1 INTEGER, numero_2 INTEGER, OUT soma INTEGER, OUT produto INTEGER) AS $$ 
    SELECT numero_1 + numero_2 AS soma, numero_1 * numero_2 AS produto; 

$$ LANGUAGE SQL;

SELECT * FROM soma_e_produto(3, 3); 

/***************************/

DROP TYPE IF EXISTS dois_valores;
CREATE TYPE dois_valores AS (soma INTEGER, produto INTEGER); 

DROP FUNCTION IF EXISTS soma_e_produto;
CREATE FUNCTION soma_e_produto (IN numero_1 INTEGER, IN numero_2 INTEGER) RETURNS dois_valores AS $$ 
    SELECT numero_1 + numero_2 AS soma, numero_1 * numero_2 AS produto; 

$$ LANGUAGE SQL;

SELECT * FROM soma_e_produto(3, 3); 

/***************************/

DROP TYPE IF EXISTS dois_valores;
CREATE TYPE dois_valores AS (soma INTEGER, produto INTEGER); 

DROP FUNCTION IF EXISTS soma_e_produto;
CREATE FUNCTION soma_e_produto (IN numero_1 INTEGER, IN numero_2 INTEGER) RETURNS dois_valores AS $$ 
    SELECT numero_1 + numero_2 AS soma, numero_1 * numero_2 AS produto; 

$$ LANGUAGE SQL;

SELECT * FROM soma_e_produto(3, 3); 

/****************************************************/





