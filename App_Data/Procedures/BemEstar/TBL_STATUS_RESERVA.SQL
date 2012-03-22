---------------------------------------
-- INTRANET CELU
-- \App_Data\Procedures\BemEstar\TBL_STATUS_RESERVA.SQL
-- # 2012-03-21 - Criação
-- Matheus Araújo
---------------------------------------
-----------------------------------------
-- PROCEUDURE LOAD_LIST_STATUS_RESERVA --
-----------------------------------------

CREATE PROCEDURE LOAD_LIST_STATUS_RESERVA
AS
BEGIN
	SELECT
		TBL_STATUS_RESERVA.COD_STATUS_RESERVA,
		TBL_STATUS_RESERVA.CHR_STATUS_RESERVA		
	FROM
		TBL_STATUS_RESERVA		
	ORDER BY
		TBL_STATUS_RESERVA.CHR_STATUS_RESERVA
END

---------------------------------------
-- PROCEDURE LOAD_REG_STATUS_RESERVA --
---------------------------------------

CREATE PROCEDURE LOAD_REG_STATUS_RESERVA
(
    @P_COD_STATUS_RESERVA INT
)
AS
BEGIN
    SELECT
		TBL_STATUS_RESERVA.COD_STATUS_RESERVA,
		TBL_STATUS_RESERVA.CHR_STATUS_RESERVA		
	FROM
		TBL_STATUS_RESERVA		
	WHERE
	    TBL_STATUS_RESERVA.COD_STATUS_RESERVA = @P_COD_STATUS_RESERVA
END

--------------------------------------------
-- PROCEDURE VERIFY_INSERT_STATUS_RESERVA --
--------------------------------------------

CREATE PROCEDURE VERIFY_INSERT_STATUS_RESERVA
(
    @P_COD_STATUS_RESERVA INT,
    @P_CHR_STATUS_RESERVA VARCHAR(128)
)
AS
BEGIN
    IF 
    (
        SELECT
            COUNT(*)
        FROM
            TBL_STATUS_RESERVA
        WHERE
            TBL_STATUS_RESERVA.COD_STATUS_RESERVA <> @P_COD_STATUS_RESERVA AND
            TBL_STATUS_RESERVA.CHR_STATUS_RESERVA = @P_CHR_STATUS_RESERVA
    ) 
    > 0
    BEGIN
        SELECT 'O Status já foi cadastrado!' AS P_CHR_MSG_ERRO
    END
    ELSE
    BEGIN
        SELECT '' AS P_CHR_MSG_ERRO
    END
END

-------------------------------------
-- PROCEDURE INSERT_STATUS_RESERVA --
-------------------------------------

CREATE PROCEDURE INSERT_STATUS_RESERVA
(
    @P_COD_STATUS_RESERVA INT,
    @P_CHR_STATUS_RESERVA VARCHAR(128)
)
AS
BEGIN
    IF 
    (
        SELECT
            COUNT(*)
        FROM
            TBL_STATUS_RESERVA
        WHERE
            TBL_STATUS_RESERVA.COD_STATUS_RESERVA = @P_COD_STATUS_RESERVA            
    ) 
    > 0
    BEGIN
        UPDATE
            TBL_STATUS_RESERVA
        SET
            TBL_STATUS_RESERVA.CHR_STATUS_RESERVA = @P_CHR_STATUS_RESERVA
        WHERE
            TBL_STATUS_RESERVA.COD_STATUS_RESERVA = @P_COD_STATUS_RESERVA
    END
    ELSE
    BEGIN
        INSERT INTO TBL_STATUS_RESERVA
        (
            TBL_STATUS_RESERVA.CHR_STATUS_RESERVA
        )
        VALUES
        (
            @P_CHR_STATUS_RESERVA
        )
    END
END

-------------------------------------
-- PROCEDURE DELETE_STATUS_RESERVA --
-------------------------------------

CREATE PROCEDURE DELETE_STATUS_RESERVA
(
    @P_COD_STATUS_RESERVA INT
)
AS
BEGIN
 
    SELECT '' AS P_CHR_MSG_ERRO
    
    DELETE
        TBL_STATUS_RESERVA
    WHERE
        TBL_STATUS_RESERVA.COD_STATUS_RESERVA = @P_COD_STATUS_RESERVA
 
END
