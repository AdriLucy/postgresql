/**********************			REPETIÇÕES		******************************/

DROP FUNCTION IF EXISTS tabuada;
CREATE OR REPLACE FUNCTION tabuada(numero INTEGER) RETURNS SETOF INTEGER AS $$
    DECLARE
            multiplicador INTEGER DEFAULT 1;
    BEGIN
            -- multiplicador que começa com 1, e vai até < 10 
            -- numero * multiplicador multiplicador 
            -- multiplicador := multiplicador + 1
        
            LOOP
                RETURN NEXT numero * multiplicador;
                
                multiplicador := multiplicador +1;
                
                EXIT WHEN multiplicador = 11;
            END LOOP;
    END;
$$ LANGUAGE plpgsql;

SELECT tabuada(9);

/**********************			WHILE		******************************/

DROP FUNCTION IF EXISTS tabuada;
CREATE OR REPLACE FUNCTION tabuada(numero INTEGER) RETURNS SETOF INTEGER AS $$
    DECLARE
            multiplicador INTEGER DEFAULT 1;
    BEGIN
           	WHILE multiplicador < 11 LOOP
                RETURN NEXT numero * multiplicador;
                
                multiplicador := multiplicador +1;
                            END LOOP;
    END;
$$ LANGUAGE plpgsql;

SELECT tabuada(8);

/**********************			FOR		******************************/

DROP FUNCTION IF EXISTS tabuada;
CREATE OR REPLACE FUNCTION tabuada(numero INTEGER) RETURNS SETOF INTEGER AS $$
    DECLARE
            multiplicador INTEGER DEFAULT 1;
    BEGIN
           	FOR multiplicador IN 1..10 LOOP
                RETURN NEXT numero * multiplicador;
                
                            END LOOP;
    END;
$$ LANGUAGE plpgsql;

SELECT tabuada(8);

/**************			FOR PARA INSTRUTOR		***********************/


DROP FUNCTION IF EXISTS instrutor_com_salario;
CREATE FUNCTION instrutor_com_salario(OUT nome VARCHAR, OUT salario_ok VARCHAR) RETURNS SETOF record AS $$
    DECLARE
        instrutor instrutor;
    BEGIN
        FOR instrutor IN SELECT * FROM instrutor LOOP
            nome := instrutor.nome;
            salario_ok = salario_ok(instrutor.id);
            
            RETURN NEXT;
        END LOOP;
    END;
$$ LANGUAGE plpgsql;

SELECT * FROM instrutor_com_salario();