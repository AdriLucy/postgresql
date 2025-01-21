/*DROP TABLE aluno, curso, aluno_curso;*/
/*DDL - Data definition language*/
/*DML - Data manipulation language*/
/****************************************************/
CREATE SCHEMA academico;

CREATE TABLE IF NOT EXISTS academico.categoria (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);

INSERT INTO academico.categoria (nome) 
VALUES ('Front-end'), ('Programação'), ('Bancos de dados'), ('Data Science');

/****************************************************/

CREATE TABLE IF NOT EXISTS academico.curso(
	id SERIAL PRIMARY KEY, /*UNIQUE*/
	nome VARCHAR(255) NOT NULL,
	categoria_id INTEGER NOT NULL REFERENCES academico.categoria(id)
);


INSERT INTO academico.curso (nome, categoria_id) 
VALUES
	('HTML', 1),
	('CSS', 1),
	('JS', 1),
	('PHP', 2),
	('Java', 2),
	('C++', 2),
	('PostgreSQL', 3),
	('MySQL', 3),
	('Oracle', 3),
	('SQL Server', 3),
	('SQLite', 3),
	('Pandas', 4),
	('Machine Learning', 4),
	('Power BI', 4);

SELECT * FROM academico.curso;

/****************************************************/

CREATE TABLE IF NOT EXISTS academico.aluno (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL
);

INSERT  INTO academico.aluno (nome) VALUES ('Diogo');
INSERT  INTO academico.aluno (nome) VALUES ('Vinícius');
INSERT  INTO academico.aluno (nome) VALUES ('Lucy');

SELECT * FROM academico.aluno;

/****************************************************/

CREATE TABLE IF NOT EXISTS academico.aluno_curso (
	aluno_id INTEGER,
	curso_id INTEGER,
	PRIMARY KEY (aluno_id,curso_id),
	
	FOREIGN KEY (aluno_id)
     REFERENCES academico.aluno (id)
	 ON DELETE CASCADE
	 ON UPDATE CASCADE,
	
	FOREIGN KEY (curso_id)
   REFERENCES academico.curso (id)
);

INSERT  INTO academico.aluno_curso (aluno_id,curso_id) VALUES (2,1);

INSERT  INTO academico.aluno_curso (aluno_id,curso_id) VALUES (3,1);

 SELECT
 	   aluno.id   AS aluno_id,
	   aluno.nome as "Nome do aluno",
	   curso.id   AS curso_id,
	   curso.nome as "Nome do curso"
  FROM 
  	academico.aluno
  JOIN academico.aluno_curso 
  	ON aluno_curso.aluno_id = aluno.id
  JOIN 
  academico.curso		   
  	ON curso.id	= aluno_curso.curso_id;

/****************************************************/

UPDATE academico.aluno
	SET id = 10
	WHERE id = 2;
	
SELECT * FROM academico.aluno_curso;

/****************************************************/

BEGIN; /*inicia transação*/
ROLLBACK; /*cancela transação*/
COMMIT; /*salva transação*/

/****************************************************/

CREATE TYPE CLASSIFICACAO AS ENUM ('LIVRE', '12_ANOS','14_ANOS', '16_ANOS', '18_ANOS');
CREATE TEMPORARY TABLE filme (
        id SERIAL PRIMARY KEY,
        nome VARCHAR (255) NOT NULL,
        classificacao CLASSIFICACAO
);

/****************************************************/