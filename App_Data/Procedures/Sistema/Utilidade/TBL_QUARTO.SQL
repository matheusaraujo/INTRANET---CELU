---------------------------------------
-- INTRANET CELU
-- \App_Data\Procedures\Sistema\Utilidade\TBL_QUARTO.SQL
-- # 2010-12-17 - Criação
-- Matheus Araújo
---------------------------------------

---------------------------------
-- PROCEUDURE LOAD_LIST_QUARTO --
---------------------------------

CREATE PROCEDURE LOAD_LIST_QUARTO
AS
BEGIN
	SELECT
		TBL_QUARTO.COD_QUARTO,
		TBL_QUARTO.CHR_DESC_QUARTO		
	FROM
		TBL_QUARTO		
	ORDER BY
		TBL_QUARTO.CHR_DESC_QUARTO
END

-------------------------------
-- PROCEDURE LOAD_REG_QUARTO --
-------------------------------

CREATE PROCEDURE LOAD_REG_QUARTO
(
    @P_COD_QUARTO INT
)
AS
BEGIN
    SELECT
		TBL_QUARTO.COD_QUARTO,
		TBL_QUARTO.CHR_DESC_QUARTO		
	FROM
		TBL_QUARTO		
	WHERE
	    TBL_QUARTO.COD_QUARTO = @P_COD_QUARTO
END

------------------------------------
-- PROCEDURE VERIFY_INSERT_QUARTO --
------------------------------------

CREATE PROCEDURE VERIFY_INSERT_QUARTO
(
    @P_COD_QUARTO INT,
    @P_CHR_DESC_QUARTO VARCHAR(128)
)
AS
BEGIN
    IF 
    (
        SELECT
            COUNT(*)
        FROM
            TBL_QUARTO
        WHERE
            TBL_QUARTO.COD_QUARTO <> @P_COD_QUARTO AND
            TBL_QUARTO.CHR_DESC_QUARTO = @P_CHR_DESC_QUARTO
    ) 
    > 0
    BEGIN
        SELECT 'O quarto já foi cadastrado!' AS P_CHR_MSG_ERRO
    END
    ELSE
    BEGIN
        SELECT '' AS P_CHR_MSG_ERRO
    END
END

-----------------------------
-- PROCEDURE INSERT_QUARTO --
-----------------------------

CREATE PROCEDURE INSERT_QUARTO
(
    @P_COD_QUARTO INT,
    @P_CHR_DESC_QUARTO VARCHAR(128)
)
AS
BEGIN
    IF 
    (
        SELECT
            COUNT(*)
        FROM
            TBL_QUARTO
        WHERE
            TBL_QUARTO.COD_QUARTO = @P_COD_QUARTO            
    ) 
    > 0
    BEGIN
        UPDATE
            TBL_QUARTO
        SET
            TBL_QUARTO.CHR_DESC_QUARTO = @P_CHR_DESC_QUARTO
        WHERE
            TBL_QUARTO.COD_QUARTO = @P_COD_QUARTO
    END
    ELSE
    BEGIN
        INSERT INTO TBL_QUARTO
        (
            TBL_QUARTO.CHR_DESC_QUARTO
        )
        VALUES
        (
            @P_CHR_DESC_QUARTO
        )
    END
END

-----------------------------
-- PROCEDURE DELETE_QUARTO --
-----------------------------

CREATE PROCEDURE DELETE_QUARTO
(
    @P_COD_QUARTO INT
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
            TBL_MORADOR.COD_QUARTO = @P_COD_QUARTO
    )
    > 0
    BEGIN    
        SELECT 'Existe(m) morador(es) nesse quarto!' AS P_CHR_MSG_ERRO    
    END
    ELSE
    BEGIN
        SELECT '' AS P_CHR_MSG_ERRO
        DELETE
            TBL_QUARTO
        WHERE
            TBL_QUARTO.COD_QUARTO = @P_COD_QUARTO
    END
END
