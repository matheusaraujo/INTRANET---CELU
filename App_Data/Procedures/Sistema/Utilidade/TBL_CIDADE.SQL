---------------------------------------
-- INTRANET CELU
-- \App_Data\Procedures\Sistema\Utilidade\TBL_CIDADE.SQL
-- # 2010-12-17 - Criação
-- Matheus Araújo
---------------------------------------

---------------------------------
-- PROCEUDURE LOAD_LIST_CIDADE --
---------------------------------

CREATE PROCEDURE LOAD_LIST_CIDADE
AS
BEGIN
	SELECT
		TBL_CIDADE.COD_CIDADE,
		TBL_CIDADE.CHR_ESTADO,
		TBL_CIDADE.CHR_CIDADE		
	FROM
		TBL_CIDADE		
	ORDER BY
		TBL_CIDADE.CHR_ESTADO,
		TBL_CIDADE.CHR_CIDADE
END

----------------------------------------
-- PROCEUDURE LOAD_LIST_CIDADE_ESTADO --
----------------------------------------

CREATE PROCEDURE LOAD_LIST_CIDADE_ESTADO
(
    @P_CHR_ESTADO VARCHAR(2)
)
AS
BEGIN
	SELECT
		TBL_CIDADE.COD_CIDADE,		
		TBL_CIDADE.CHR_CIDADE		
	FROM
		TBL_CIDADE		
	WHERE
	    TBL_CIDADE.CHR_ESTADO = @P_CHR_ESTADO
	ORDER BY		
		TBL_CIDADE.CHR_CIDADE
END

-------------------------------
-- PROCEDURE LOAD_REG_CIDADE --
-------------------------------

CREATE PROCEDURE LOAD_REG_CIDADE
(
    @P_COD_CIDADE INT
)
AS
BEGIN
    SELECT
		TBL_CIDADE.COD_CIDADE,
		TBL_CIDADE.CHR_ESTADO,
		TBL_CIDADE.CHR_CIDADE		
	FROM
		TBL_CIDADE		
	WHERE
	    TBL_CIDADE.COD_CIDADE = @P_COD_CIDADE
END

------------------------------------
-- PROCEDURE VERIFY_INSERT_CIDADE --
------------------------------------

CREATE PROCEDURE VERIFY_INSERT_CIDADE
(
    @P_COD_CIDADE INT,
    @P_CHR_ESTADO VARCHAR(2),
    @P_CHR_CIDADE VARCHAR(128)
)
AS
BEGIN

	IF
	(
		SELECT
			COUNT(*)
		FROM
			TBL_CIDADE
		WHERE
			TBL_CIDADE.CHR_CIDADE = @P_CHR_CIDADE AND
			TBL_CIDADE.CHR_ESTADO = @P_CHR_ESTADO AND
			TBL_CIDADE.COD_CIDADE <> @P_COD_CIDADE
	)
	> 0
	BEGIN
		SELECT 'A cidade já foi cadastrada!' AS P_CHR_MSG_ERRO
	END
	ELSE
	BEGIN
		SELECT '' AS P_CHR_MSG_ERRO
	END
END

-----------------------------
-- PROCEDURE INSERT_CIDADE --
-----------------------------

CREATE PROCEDURE INSERT_CIDADE
(
    @P_COD_CIDADE INT,
    @P_CHR_ESTADO VARCHAR(2),
    @P_CHR_CIDADE VARCHAR(128)
)
AS
BEGIN
    IF 
    (
        SELECT
            COUNT(*)
        FROM
            TBL_CIDADE
        WHERE
            TBL_CIDADE.COD_CIDADE = @P_COD_CIDADE            
    ) 
    > 0
    BEGIN
        UPDATE
            TBL_CIDADE
        SET
            TBL_CIDADE.CHR_ESTADO = @P_CHR_ESTADO,
            TBL_CIDADE.CHR_CIDADE = @P_CHR_CIDADE
        WHERE
            TBL_CIDADE.COD_CIDADE = @P_COD_CIDADE
    END
    ELSE
    BEGIN
        INSERT INTO TBL_CIDADE
        (
            TBL_CIDADE.CHR_ESTADO,
            TBL_CIDADE.CHR_CIDADE
        )
        VALUES
        (
            @P_CHR_ESTADO,
            @P_CHR_CIDADE
        )
    END
END

----------------------------
-- PROCEDURE DELETE_CIDADE --
----------------------------

CREATE PROCEDURE DELETE_CIDADE
(
    @P_COD_CIDADE INT
)
AS
BEGIN
    IF
    (
        SELECT
            COUNT(*)
        FROM
            TBL_MORADOR
        WHERE
            TBL_MORADOR.COD_CIDADE_ORIGEM = @P_COD_CIDADE
    )
    > 0
    BEGIN    
        SELECT 'Existe(m) morador(es) nessa cidade!' AS P_CHR_MSG_ERRO    
    END
    ELSE
    BEGIN
        SELECT '' AS P_CHR_MSG_ERRO
        DELETE
            TBL_CIDADE
        WHERE
            TBL_CIDADE.COD_CIDADE = @P_COD_CIDADE
    END
END
