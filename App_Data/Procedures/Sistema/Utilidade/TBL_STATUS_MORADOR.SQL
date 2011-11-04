---------------------------------------
-- INTRANET CELU
-- \App_Data\Procedures\Sistema\Utilidade\TBL_STATUS_MORADOR.SQL
-- # 2010-12-17 - Criação
-- Matheus Araújo
---------------------------------------

-----------------------------------------
-- PROCEUDURE LOAD_LIST_STATUS_MORADOR --
-----------------------------------------

CREATE PROCEDURE LOAD_LIST_STATUS_MORADOR
AS
BEGIN
	SELECT
		TBL_STATUS_MORADOR.COD_STATUS_MORADOR,
		TBL_STATUS_MORADOR.CHR_DESC_STATUS_MORADOR		
	FROM
		TBL_STATUS_MORADOR		
	ORDER BY
		TBL_STATUS_MORADOR.CHR_DESC_STATUS_MORADOR
END

---------------------------------------
-- PROCEDURE LOAD_REG_STATUS_MORADOR --
---------------------------------------

CREATE PROCEDURE LOAD_REG_STATUS_MORADOR
(
    @P_COD_STATUS_MORADOR INT
)
AS
BEGIN
    SELECT
		TBL_STATUS_MORADOR.COD_STATUS_MORADOR,
		TBL_STATUS_MORADOR.CHR_DESC_STATUS_MORADOR		
	FROM
		TBL_STATUS_MORADOR		
	WHERE
	    TBL_STATUS_MORADOR.COD_STATUS_MORADOR = @P_COD_STATUS_MORADOR
END

--------------------------------------------
-- PROCEDURE VERIFY_INSERT_STATUS_MORADOR --
--------------------------------------------

CREATE PROCEDURE VERIFY_INSERT_STATUS_MORADOR
(
    @P_COD_STATUS_MORADOR INT,
    @P_CHR_DESC_STATUS_MORADOR VARCHAR(128)
)
AS
BEGIN
    IF 
    (
        SELECT
            COUNT(*)
        FROM
            TBL_STATUS_MORADOR
        WHERE
            TBL_STATUS_MORADOR.COD_STATUS_MORADOR <> @P_COD_STATUS_MORADOR AND
            TBL_STATUS_MORADOR.CHR_DESC_STATUS_MORADOR = @P_CHR_DESC_STATUS_MORADOR
    ) 
    > 0
    BEGIN
        SELECT 'O Status de Morador já foi cadastrado!' AS P_CHR_MSG_ERRO
    END
    ELSE
    BEGIN
        SELECT '' AS P_CHR_MSG_ERRO
    END
END

-------------------------------------
-- PROCEDURE INSERT_STATUS_MORADOR --
-------------------------------------

CREATE PROCEDURE INSERT_STATUS_MORADOR
(
    @P_COD_STATUS_MORADOR INT,
    @P_CHR_DESC_STATUS_MORADOR VARCHAR(128)
)
AS
BEGIN
    IF 
    (
        SELECT
            COUNT(*)
        FROM
            TBL_STATUS_MORADOR
        WHERE
            TBL_STATUS_MORADOR.COD_STATUS_MORADOR = @P_COD_STATUS_MORADOR            
    ) 
    > 0
    BEGIN
        UPDATE
            TBL_STATUS_MORADOR
        SET
            TBL_STATUS_MORADOR.CHR_DESC_STATUS_MORADOR = @P_CHR_DESC_STATUS_MORADOR
        WHERE
            TBL_STATUS_MORADOR.COD_STATUS_MORADOR = @P_COD_STATUS_MORADOR
    END
    ELSE
    BEGIN
        INSERT INTO TBL_STATUS_MORADOR
        (
            TBL_STATUS_MORADOR.CHR_DESC_STATUS_MORADOR
        )
        VALUES
        (
            @P_CHR_DESC_STATUS_MORADOR
        )
    END
END

-------------------------------------
-- PROCEDURE DELETE_STATUS_MORADOR --
-------------------------------------

CREATE PROCEDURE DELETE_STATUS_MORADOR
(
    @P_COD_STATUS_MORADOR INT
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
            TBL_MORADOR.COD_STATUS_MORADOR = @P_COD_STATUS_MORADOR
    )
    > 0
    BEGIN    
        SELECT 'Existe(m) morador(es) com esse status!' AS P_CHR_MSG_ERRO    
    END
    ELSE
    BEGIN
        SELECT '' AS P_CHR_MSG_ERRO
        DELETE
            TBL_STATUS_MORADOR
        WHERE
            TBL_STATUS_MORADOR.COD_STATUS_MORADOR = @P_COD_STATUS_MORADOR
    END
END
