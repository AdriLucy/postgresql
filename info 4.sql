/**********************			PLPGSQL		******************************/

CREATE OR REPLACE FUNCTION primeira_pl() RETURNS INTEGER AS $$
    DECLARE
    primeira_variavel INTEGER := 6;
	BEGIN
	    primeira_variavel := primeira_variavel * 2;
		
	    RETURN primeira_variavel;
	END
    
$$ LANGUAGE plpgsql;

SELECT primeira_pl();

/* utiliza o return ao em vez do select */

/****************************************************/
DROP FUNCTION IF EXISTS salario_ok;
CREATE FUNCTION salario_ok (instrutor instrutor) RETURNS VARCHAR AS $$
  BEGIN
    --se o salário do instrutor for maior do que 200, está ok. Senão, pode aumentar
    IF instrutor.salario > 250 THEN
       RETURN 'Salário está ok';
	ELSEIF  instrutor.salario = 250 THEN
		RETURN 'Salário pode aumentar';
    ELSE
       RETURN 'Salário está defasado';
    END IF;
  END;
$$ LANGUAGE plpgsql;

SELECT nome, salario, salario_ok(instrutor) FROM instrutor;

/************	COM CASE WHEN 	********************/
DROP FUNCTION IF EXISTS salario_ok;
CREATE FUNCTION salario_ok (instrutor instrutor) RETURNS VARCHAR AS $$
  BEGIN
    --se o salário do instrutor for maior do que 200, está ok. Senão, pode aumentar
    CASE instrutor.salario 
	WHEN 500 THEN
       RETURN 'Salário está alto';
	WHEN 250 THEN
		RETURN 'Salário está OK';
	WHEN 100 THEN
		RETURN 'Salário esta muito baixo baixo';
    ELSE
       RETURN 'Salário está defasado';
    END CASE;
  END;
$$ LANGUAGE plpgsql;

SELECT nome, salario, salario_ok(instrutor) FROM instrutor;


/********** 		OUTRA FORMA	 	***************/
DROP FUNCTION IF EXISTS salario_ok;
CREATE FUNCTION salario_ok (id_instrutor INTEGER) RETURNS VARCHAR AS $$
  DECLARE
     instrutor instrutor;
  BEGIN
      SELECT * FROM instrutor WHERE id = id_instrutor INTO instrutor;

    --se o salário do instrutor for maior do que 200, está ok. Senão, pode aumentar
    IF instrutor.salario > 200 THEN
       RETURN 'Salário está ok';
    ELSE
       RETURN 'Salário pode aumentar';
    END IF;
  END;
$$ LANGUAGE plpgsql;

SELECT nome, salario_ok(instrutor.id) from instrutor;

/****************************************************/

