CREATE DATABASE alura;

DROP DATABASE alura;

CREATE TABLE aluno
(
    id SERIAL,
    nome  VARCHAR(255),
    cpf CHAR(11),
    observacao TEXT,
    idade INTEGER,
    dinheiro NUMERIC(10,2),
    altura REAL,
    ativo BOOLEAN,
    data_nascimento DATE,
    hora_aula TIME,
    matriculado_em TIMESTAMP
);

INSERT INTO aluno(
	nome,
	cpf,
	observacao,
	idade,
	dinheiro,
	altura,
	ativo,
	data_nascimento,
	hora_aula,
	matriculado_em) 
VALUES (
	'Diogo',
	'12345678901',
	'teste',
	35,
	100.50,
	1.81,
	TRUE,
	'1984-08-27',
	'17:30:00',
	'2020-02-08 12:32:45'
);


 UPDATE aluno
 SET nome = 'Nico',
	cpf = '10987654321',
	observacao ='Teste',
	idade = 38,
	dinheiro = 15.32,
	altura = 1.90,
	ativo = FALSE,
	data_nascimento = '1980-01-15',
	hora_aula = '13:00:00',
	matriculado_em = '2020-01-02 15:00:00'
  WHERE id = 1;

  
DELETE 
   FROM aluno
  WHERE nome = 'Nico';
 