---------------------------------------
-- INTRANET CELU
-- \App_Data\Procedures\Sistema\Utilidade\TBL_IES.SQL
-- # 2010-12-17 - Criação
-- Matheus Araújo
---------------------------------------

------------------------------
-- PROCEUDURE LOAD_LIST_IES --
------------------------------

CREATE PROCEDURE LOAD_LIST_IES
AS
BEGIN
	SELECT
		TBL_IES.COD_IES,
		TBL_IES.CHR_DESC_IES		
	FROM
		TBL_IES		
	ORDER BY
		TBL_IES.CHR_DESC_IES
END

----------------------------
-- PROCEDURE LOAD_REG_IES --
----------------------------

CREATE PROCEDURE LOAD_REG_IES
(
    @P_COD_IES INT
)
AS
BEGIN
    SELECT
		TBL_IES.COD_IES,
		TBL_IES.CHR_DESC_IES		
	FROM
		TBL_IES		
	WHERE
	    TBL_IES.COD_IES = @P_COD_IES
END

---------------------------------
-- PROCEDURE VERIFY_INSERT_IES --
---------------------------------

CREATE PROCEDURE VERIFY_INSERT_IES
(
    @P_COD_IES INT,
    @P_CHR_DESC_IES VARCHAR(128)
)
AS
BEGIN
    IF 
    (
        SELECT
            COUNT(*)
        FROM
            TBL_IES
        WHERE
            TBL_IES.COD_IES <> @P_COD_IES AND
            TBL_IES.CHR_DESC_IES = @P_CHR_DESC_IES
    ) 
    > 0
    BEGIN
        SELECT 'A instituição já foi cadastrada!' AS P_CHR_MSG_ERRO
    END
    ELSE
    BEGIN
        SELECT '' AS P_CHR_MSG_ERRO
    END
END

--------------------------
-- PROCEDURE INSERT_IES --
--------------------------

CREATE PROCEDURE INSERT_IES
(
    @P_COD_IES INT,
    @P_CHR_DESC_IES VARCHAR(128)
)
AS
BEGIN
    IF 
    (
        SELECT
            COUNT(*)
        FROM
            TBL_IES
        WHERE
            TBL_IES.COD_IES = @P_COD_IES            
    ) 
    > 0
    BEGIN
        UPDATE
            TBL_IES
        SET
            TBL_IES.CHR_DESC_IES = @P_CHR_DESC_IES
        WHERE
            TBL_IES.COD_IES = @P_COD_IES
    END
    ELSE
    BEGIN
        INSERT INTO TBL_IES
        (
            TBL_IES.CHR_DESC_IES
        )
        VALUES
        (
            @P_CHR_DESC_IES
        )
    END
END

--------------------------
-- PROCEDURE DELETE_IES --
--------------------------

CREATE PROCEDURE DELETE_IES
(
    @P_COD_IES INT
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
            TBL_MORADOR.COD_IES = @P_COD_IES
    )
    > 0
    BEGIN    
        SELECT 'Existe(m) morador(es) nessa instituição!' AS P_CHR_MSG_ERRO    
    END
    ELSE
    BEGIN
        SELECT '' AS P_CHR_MSG_ERRO
        DELETE
            TBL_IES
        WHERE
            TBL_IES.COD_IES = @P_COD_IES
    END
END
