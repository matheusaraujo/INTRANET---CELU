---------------------------------------
-- INTRANET CELU
-- \App_Data\Procedures\Sistema\Seguranca\TBL_PERFIL.SQL
-- # 2010-12-17 - Criação
-- Matheus Araújo
---------------------------------------

---------------------------------
-- PROCEUDURE LOAD_LIST_PERFIL --
---------------------------------

CREATE PROCEDURE LOAD_LIST_PERFIL
AS
BEGIN
	SELECT
		TBL_PERFIL.COD_PERFIL,
		TBL_PERFIL.CHR_DESC_PERFIL		
	FROM
		TBL_PERFIL		
	ORDER BY
		TBL_PERFIL.CHR_DESC_PERFIL
END

-------------------------------
-- PROCEDURE LOAD_REG_PERFIL --
-------------------------------

CREATE PROCEDURE LOAD_REG_PERFIL
(
    @P_COD_PERFIL INT
)
AS
BEGIN
    SELECT
		TBL_PERFIL.COD_PERFIL,
		TBL_PERFIL.CHR_DESC_PERFIL		
	FROM
		TBL_PERFIL		
	WHERE
	    TBL_PERFIL.COD_PERFIL = @P_COD_PERFIL
END

------------------------------------
-- PROCEDURE VERIFY_INSERT_PERFIL --
------------------------------------

CREATE PROCEDURE VERIFY_INSERT_PERFIL
(
    @P_COD_PERFIL INT,
    @P_CHR_DESC_PERFIL VARCHAR(128)
)
AS
BEGIN
    IF 
    (
        SELECT
            COUNT(*)
        FROM
            TBL_PERFIL
        WHERE
            TBL_PERFIL.COD_PERFIL <> @P_COD_PERFIL AND
            TBL_PERFIL.CHR_DESC_PERFIL = @P_CHR_DESC_PERFIL
    ) 
    > 0
    BEGIN
        SELECT 'O perfil já foi cadastrado!' AS P_CHR_MSG_ERRO
    END
    ELSE
    BEGIN
        SELECT '' AS P_CHR_MSG_ERRO
    END
END

-----------------------------
-- PROCEDURE INSERT_PERFIL --
-----------------------------

CREATE PROCEDURE INSERT_PERFIL
(
    @P_COD_PERFIL INT,
    @P_CHR_DESC_PERFIL VARCHAR(128)
)
AS
BEGIN
    IF 
    (
        SELECT
            COUNT(*)
        FROM
            TBL_PERFIL
        WHERE
            TBL_PERFIL.COD_PERFIL = @P_COD_PERFIL            
    ) 
    > 0
    BEGIN
        UPDATE
            TBL_PERFIL
        SET
            TBL_PERFIL.CHR_DESC_PERFIL = @P_CHR_DESC_PERFIL
        WHERE
            TBL_PERFIL.COD_PERFIL = @P_COD_PERFIL
    END
    ELSE
    BEGIN
        INSERT INTO TBL_PERFIL
        (
            TBL_PERFIL.CHR_DESC_PERFIL
        )
        VALUES
        (
            @P_CHR_DESC_PERFIL
        )
    END
END

-----------------------------
-- PROCEDURE DELETE_PERFIL --
-----------------------------

CREATE PROCEDURE DELETE_PERFIL
(
    @P_COD_PERFIL INT
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
            TBL_MORADOR.COD_PERFIL = @P_COD_PERFIL
    )
    > 0
    BEGIN    
        SELECT 'Existe(m) morador(es) com esse perfil!' AS P_CHR_MSG_ERRO    
    END
    ELSE
    BEGIN
        SELECT '' AS P_CHR_MSG_ERRO
        DELETE
            TBL_PERFIL
        WHERE
            TBL_PERFIL.COD_PERFIL = @P_COD_PERFIL
    END
END
