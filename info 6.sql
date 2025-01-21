DROP FUNCTION IF EXISTS cria_curso;
CREATE FUNCTION cria_curso(nome_curso VARCHAR, nome_categoria VARCHAR) RETURNS void AS $$ 
    DECLARE
        id_categoria INTEGER;
    BEGIN
        SELECT id INTO id_categoria FROM academico.categoria WHERE nome = nome_categoria;
        
        IF NOT FOUND THEN
            INSERT INTO academico.categoria (nome) VALUES (nome_categoria) RETURNING id INTO id_categoria;
        END IF;
        
        INSERT INTO academico.curso (nome, categoria_id) VALUES (nome_curso, id_categoria);
    END;
$$ LANGUAGE plpgsql;

SELECT cria_curso('PHP', 'Programação');

select * from academico.categoria
select * from academico.curso