---------------------------------------
-- INTRANET CELU
-- \App_Data\Procedures\Biblioteca\TBL_OBRA.SQL
-- # 2010-10-02 - Criação
-- Matheus Araújo
-- Valquire Jesus
---------------------------------------

------------------------------
-- PROCEDURE LOAD_LIST_OBRA --
------------------------------

CREATE PROCEDURE LOAD_LIST_OBRA
(
    @P_COD_TIPO_OBRA INT,
    @P_CHR_BUSCA VARCHAR(32)
)
AS
BEGIN
    SELECT
        TBL_OBRA.COD_OBRA,
        TBL_OBRA.CHR_CHAMADA,
        TBL_OBRA.CHR_TITULO,
        TBL_AUTOR_OBRA.CHR_NOME_AUTOR_OBRA
    FROM
        TBL_OBRA
        INNER JOIN TBL_AUTOR_OBRA
            ON TBL_OBRA.COD_AUTOR_OBRA = TBL_AUTOR_OBRA.COD_AUTOR_OBRA
    WHERE
        TBL_OBRA.COD_TIPO_OBRA = @P_COD_TIPO_OBRA AND
        TBL_OBRA.CHR_TITULO LIKE '%' + @P_CHR_BUSCA + '%'
    ORDER BY
        TBL_OBRA.CHR_TITULO,
        TBL_OBRA.CHR_CHAMADA
END

---------------------------------------
-- PROCEDURE LOAD_LIST_OBRA_CONSULTA --
---------------------------------------

CREATE PROCEDURE LOAD_LIST_OBRA_CONSULTA
(
    @P_TIPO_CONSULTA INT,
    @P_CHR_BUSCA VARCHAR(32)
)
AS
BEGIN

    IF @P_TIPO_CONSULTA <> 1
    BEGIN
        SELECT
            TBL_OBRA.COD_OBRA,
            (
                CASE TBL_STATUS_OBRA.CHR_DESC_STATUS_OBRA
                    WHEN 'Disponível' THEN '<div style="width:10px;height:5px;background-color:Green;"></div>'
                    WHEN 'Reservado' THEN '<div style="width:10px;height:5px;background-color:Blue;"></div>'
                    WHEN 'Emprestado' THEN '<div style="width:10px;height:5px;background-color:Red;"></div>'                    
                    WHEN 'Emprestado com reserva' THEN '<div style="width:10px;height:5px;background-color:Yellow;"></div>'
                    ELSE ''
                END
            ) AS CHR_STATUS,
            TBL_OBRA.CHR_CHAMADA,
            TBL_OBRA.CHR_TITULO,
            TBL_AUTOR_OBRA.CHR_NOME_AUTOR_OBRA
        FROM
            TBL_OBRA
            INNER JOIN TBL_AUTOR_OBRA
                ON TBL_OBRA.COD_AUTOR_OBRA = TBL_AUTOR_OBRA.COD_AUTOR_OBRA
            INNER JOIN TBL_ASSUNTO_OBRA
                ON TBL_OBRA.COD_ASSUNTO_OBRA = TBL_ASSUNTO_OBRA.COD_ASSUNTO_OBRA
            INNER JOIN TBL_STATUS_OBRA
                ON TBL_OBRA.COD_STATUS_OBRA = TBL_STATUS_OBRA.COD_STATUS_OBRA
        WHERE
            (
		        (
			        (TBL_OBRA.CHR_TITULO LIKE '%' + @P_CHR_BUSCA + '%' AND @P_TIPO_CONSULTA = 2) 
			        OR @P_TIPO_CONSULTA = 3 OR @P_TIPO_CONSULTA = 4
		        ) 
		        AND
		        (
			        (TBL_AUTOR_OBRA.CHR_NOME_AUTOR_OBRA LIKE '%' + @P_CHR_BUSCA + '%' AND @P_TIPO_CONSULTA = 3) 
			        OR @P_TIPO_CONSULTA = 2 OR @P_TIPO_CONSULTA = 4
		        ) 
		        AND
		        (
			        (TBL_ASSUNTO_OBRA.CHR_DESC_ASSUNTO_OBRA LIKE '%' + @P_CHR_BUSCA + '%' AND @P_TIPO_CONSULTA = 4)
			        OR @P_TIPO_CONSULTA = 3 OR @P_TIPO_CONSULTA = 2
		        )
	        )
        ORDER BY
            TBL_OBRA.CHR_TITULO,
            TBL_OBRA.CHR_CHAMADA
    END
    ELSE
    BEGIN
        SELECT
            TBL_OBRA.COD_OBRA,
            (
                CASE TBL_STATUS_OBRA.CHR_DESC_STATUS_OBRA
                    WHEN 'Disponível' THEN '<div style="width:10px;height:5px;background-color:Green;"></div>'
                    WHEN 'Reservado' THEN '<div style="width:10px;height:5px;background-color:Blue;"></div>'
                    WHEN 'Emprestado' THEN '<div style="width:10px;height:5px;background-color:Red;"></div>'
                    WHEN 'Emprestado com reserva' THEN '<div style="width:10px;height:5px;background-color:Yellow;"></div>'
                    ELSE ''
                END
            ) AS CHR_STATUS,
            TBL_OBRA.CHR_CHAMADA,
            TBL_OBRA.CHR_TITULO,
            TBL_AUTOR_OBRA.CHR_NOME_AUTOR_OBRA
        FROM
            TBL_OBRA
            INNER JOIN TBL_AUTOR_OBRA
                ON TBL_OBRA.COD_AUTOR_OBRA = TBL_AUTOR_OBRA.COD_AUTOR_OBRA
            INNER JOIN TBL_ASSUNTO_OBRA
                ON TBL_OBRA.COD_ASSUNTO_OBRA = TBL_ASSUNTO_OBRA.COD_ASSUNTO_OBRA
            INNER JOIN TBL_STATUS_OBRA
                ON TBL_OBRA.COD_STATUS_OBRA = TBL_STATUS_OBRA.COD_STATUS_OBRA
        WHERE
	        TBL_OBRA.CHR_TITULO LIKE '%' + @P_CHR_BUSCA + '%' OR   
	        TBL_AUTOR_OBRA.CHR_NOME_AUTOR_OBRA LIKE '%' + @P_CHR_BUSCA + '%' OR
	        TBL_ASSUNTO_OBRA.CHR_DESC_ASSUNTO_OBRA LIKE '%' + @P_CHR_BUSCA + '%' 
        ORDER BY
            TBL_OBRA.CHR_TITULO,
            TBL_OBRA.CHR_CHAMADA
    END
    
END


-----------------------------
-- PROCEDURE LOAD_REG_OBRA --
-----------------------------

CREATE PROCEDURE LOAD_REG_OBRA
(
    @P_COD_OBRA INT
)
AS
BEGIN
    SELECT
        TBL_OBRA.COD_OBRA,
        TBL_OBRA.COD_TIPO_OBRA,
        TBL_TIPO_OBRA.CHR_DESC_TIPO_OBRA,
        TBL_OBRA.CHR_CHAMADA,
        TBL_OBRA.CHR_TITULO,
        TBL_OBRA.COD_AUTOR_OBRA,
        TBL_AUTOR_OBRA.CHR_NOME_AUTOR_OBRA,
        TBL_OBRA.CHR_EDICAO,
        TBL_OBRA.CHR_PUBLICACAO,
        TBL_OBRA.CHR_NORMALIZACAO,
        TBL_OBRA.COD_ASSUNTO_OBRA,
        TBL_ASSUNTO_OBRA.CHR_DESC_ASSUNTO_OBRA,
        TBL_OBRA.COD_STATUS_OBRA,
        TBL_STATUS_OBRA.CHR_DESC_STATUS_OBRA,
        TBL_STATUS_OBRA.BLN_PERMITE_RESERVA,
        (
			TBL_STATUS_OBRA.BLN_PERMITE_EMPRESTIMO & TBL_TIPO_OBRA.BLN_PERMITE_EMPRESTIMO				
        ) AS BLN_PERMITE_EMPRESTIMO
    FROM
        TBL_OBRA
        INNER JOIN TBL_TIPO_OBRA
            ON TBL_OBRA.COD_TIPO_OBRA = TBL_TIPO_OBRA.COD_TIPO_OBRA
        INNER JOIN TBL_AUTOR_OBRA
            ON TBL_OBRA.COD_AUTOR_OBRA = TBL_AUTOR_OBRA.COD_AUTOR_OBRA
        INNER JOIN TBL_ASSUNTO_OBRA
            ON TBL_OBRA.COD_ASSUNTO_OBRA = TBL_ASSUNTO_OBRA.COD_ASSUNTO_OBRA
        INNER JOIN TBL_STATUS_OBRA
            ON TBL_OBRA.COD_STATUS_OBRA = TBL_STATUS_OBRA.COD_STATUS_OBRA
    WHERE
        TBL_OBRA.COD_OBRA = @P_COD_OBRA
END

----------------------------------
-- PROCEDURE VERIFY_INSERT_OBRA --
----------------------------------

CREATE PROCEDURE VERIFY_INSERT_OBRA
(
	@P_COD_OBRA INT,
	@P_COD_TIPO_OBRA INT,
	@P_CHR_CHAMADA VARCHAR(16),
	@P_CHR_TITULO VARCHAR(512),
	@P_COD_AUTOR_OBRA INT,
	@P_CHR_EDICAO VARCHAR(16),
	@P_CHR_PUBLICACAO VARCHAR(64),
	@P_CHR_NORMALIZACAO VARCHAR(128),
	@P_COD_ASSUNTO_OBRA INT	
)
AS
BEGIN

    IF
    (
        SELECT
            COUNT(*)
        FROM
            TBL_OBRA
        WHERE
            TBL_OBRA.COD_OBRA <> @P_COD_OBRA AND
            TBL_OBRA.CHR_CHAMADA = @P_CHR_CHAMADA
    ) > 0
    BEGIN
        SELECT 'A localização já foi cadastrada para outra obra!' AS P_CHR_MSG_ERRO
    END
    ELSE
    BEGIN
        SELECT '' AS P_CHR_MSG_ERRO
    END

END

---------------------------
-- PROCEDURE INSERT_OBRA --
---------------------------

CREATE PROCEDURE INSERT_OBRA
(
	@P_COD_OBRA INT,
	@P_COD_TIPO_OBRA INT,
	@P_CHR_CHAMADA VARCHAR(16),
	@P_CHR_TITULO VARCHAR(512),
	@P_COD_AUTOR_OBRA INT,
	@P_CHR_EDICAO VARCHAR(16),
	@P_CHR_PUBLICACAO VARCHAR(64),
	@P_CHR_NORMALIZACAO VARCHAR(128),
	@P_COD_ASSUNTO_OBRA INT
)
AS
BEGIN

    IF
    (
        SELECT
            COUNT(*)
        FROM
            TBL_OBRA
        WHERE
            TBL_OBRA.COD_OBRA = @P_COD_OBRA
    ) > 0
    BEGIN
        UPDATE
            TBL_OBRA
        SET
            TBL_OBRA.COD_TIPO_OBRA = @P_COD_TIPO_OBRA,
	        TBL_OBRA.CHR_CHAMADA = @P_CHR_CHAMADA,
	        TBL_OBRA.CHR_TITULO = @P_CHR_TITULO,
	        TBL_OBRA.COD_AUTOR_OBRA = @P_COD_AUTOR_OBRA,
	        TBL_OBRA.CHR_EDICAO = @P_CHR_EDICAO,
	        TBL_OBRA.CHR_PUBLICACAO = @P_CHR_PUBLICACAO,
	        TBL_OBRA.CHR_NORMALIZACAO = @P_CHR_NORMALIZACAO,
	        TBL_OBRA.COD_ASSUNTO_OBRA = @P_COD_ASSUNTO_OBRA	        
	    WHERE
	        TBL_OBRA.COD_OBRA = @P_COD_OBRA
    END
    ELSE
    BEGIN
		
		DECLARE @P_COD_STATUS_OBRA INT

		SET @P_COD_STATUS_OBRA =
		(	
			SELECT 
				TBL_STATUS_OBRA.COD_STATUS_OBRA
			FROM 
				TBL_STATUS_OBRA
			WHERE
				TBL_STATUS_OBRA.CHR_DESC_STATUS_OBRA = 'Disponível'			
		)
	
        INSERT INTO TBL_OBRA
        (
            TBL_OBRA.COD_TIPO_OBRA,
	        TBL_OBRA.CHR_CHAMADA,
	        TBL_OBRA.CHR_TITULO,
	        TBL_OBRA.COD_AUTOR_OBRA,
	        TBL_OBRA.CHR_EDICAO,
	        TBL_OBRA.CHR_PUBLICACAO,
	        TBL_OBRA.CHR_NORMALIZACAO,
	        TBL_OBRA.COD_ASSUNTO_OBRA,
	        TBL_OBRA.COD_STATUS_OBRA
        )
        VALUES
        (
        	@P_COD_TIPO_OBRA,
	        @P_CHR_CHAMADA,
	        @P_CHR_TITULO,
	        @P_COD_AUTOR_OBRA,
	        @P_CHR_EDICAO,
	        @P_CHR_PUBLICACAO,
	        @P_CHR_NORMALIZACAO,
	        @P_COD_ASSUNTO_OBRA,
			@P_COD_STATUS_OBRA
        )
    END

END

---------------------------
-- PROCEDURE DELETE_OBRA --
---------------------------

CREATE PROCEDURE DELETE_OBRA
(
    @P_COD_OBRA INT
)
AS
BEGIN
    
    SELECT '' AS P_CHR_MSG_ERRO
    
    DELETE
        TBL_OBRA
    WHERE
        TBL_OBRA.COD_OBRA = @P_COD_OBRA
        
END
