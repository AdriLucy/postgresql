/**************			EXECUTA FUNÇÃO FORA DA QUERY		***********************/


CREATE OR REPLACE FUNCTION valor_aleatorio_entre (lim_inferior INT, lim_superior
INT) RETURNS INT AS
$$
BEGIN
RETURN FLOOR(RANDOM() * (lim_superior - lim_inferior + 1) + lim_inferior)::INT;
END;
$$ LANGUAGE plpgsql;
SELECT valor_aleatorio_entre (2, 10);

DO $$
DECLARE
valor INT := valor_aleatorio_entre(1, 100);
BEGIN
RAISE NOTICE 'O valor gerado é: %', valor;
IF valor % 2 = 0 THEN
RAISE NOTICE '% é par', valor;
ELSE
RAISE NOTICE '% é ímpar', valor;
END IF;
END;
$$
