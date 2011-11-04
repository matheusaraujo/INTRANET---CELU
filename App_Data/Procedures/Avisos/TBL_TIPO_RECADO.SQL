---------------------------------------
-- INTRANET CELU
-- \App_Data\Procedures\Aviso\TBL_TIPO_RECADO.SQL
-- # 2011-04-09 - Criação
-- Matheus Araújo
---------------------------------------

-------------------------------------
-- PROCEDURE LOAD_LIST_TIPO_RECADO --
-------------------------------------

CREATE PROCEDURE LOAD_LIST_TIPO_RECADO
AS
BEGIN
    SELECT
        TBL_TIPO_RECADO.COD_TIPO_RECADO,
        TBL_TIPO_RECADO.CHR_DESC_TIPO_RECADO
    FROM
        TBL_TIPO_RECADO
    ORDER BY
        TBL_TIPO_RECADO.CHR_DESC_TIPO_RECADO
END

------------------------------------
-- PROCEDURE LOAD_REG_TIPO_RECADO --
------------------------------------

CREATE PROCEDURE LOAD_REG_TIPO_RECADO
(
    @P_COD_TIPO_RECADO INT
)
AS
BEGIN
    SELECT
        TBL_TIPO_RECADO.COD_TIPO_RECADO,
        TBL_TIPO_RECADO.CHR_DESC_TIPO_RECADO
    FROM
        TBL_TIPO_RECADO
    WHERE
        TBL_TIPO_RECADO.COD_TIPO_RECADO = @P_COD_TIPO_RECADO
END

-----------------------------------------
-- PROCEDURE VERIFY_INSERT_TIPO_RECADO --
-----------------------------------------

CREATE PROCEDURE VERIFY_INSERT_TIPO_RECADO
(
    @P_COD_TIPO_RECADO INT,
    @P_CHR_DESC_TIPO_RECADO VARCHAR(128)
)
AS
BEGIN
    IF
    (
        SELECT
            COUNT(*)
        FROM
            TBL_TIPO_RECADO
        WHERE
            TBL_TIPO_RECADO.COD_TIPO_RECADO <> @P_COD_TIPO_RECADO AND
            TBL_TIPO_RECADO.CHR_DESC_TIPO_RECADO = @P_CHR_DESC_TIPO_RECADO
    ) > 0
    BEGIN
        SELECT 'O tipo já foi cadastrado!' AS P_CHR_MSG_ERRO
    END
    ELSE
    BEGIN
        SELECT '' AS P_CHR_MSG_ERRO
    END
END

-----------------------------------
-- PROCEDURE INSERT_TIPO_RECADO --
-----------------------------------

CREATE PROCEDURE INSERT_TIPO_RECADO
(
    @P_COD_TIPO_RECADO INT,
    @P_CHR_DESC_TIPO_RECADO VARCHAR(128)
)
AS
BEGIN
    IF
    (
        SELECT
            COUNT(*)
        FROM
            TBL_TIPO_RECADO
        WHERE
            TBL_TIPO_RECADO.COD_TIPO_RECADO = @P_COD_TIPO_RECADO
    ) > 0
    BEGIN
        UPDATE
            TBL_TIPO_RECADO
        SET
            TBL_TIPO_RECADO.CHR_DESC_TIPO_RECADO = @P_CHR_DESC_TIPO_RECADO
        WHERE
            TBL_TIPO_RECADO.COD_TIPO_RECADO = @P_COD_TIPO_RECADO
    END
    ELSE
    BEGIN
        INSERT INTO TBL_TIPO_RECADO
        (
            TBL_TIPO_RECADO.CHR_DESC_TIPO_RECADO
        )
        VALUES
        (
            @P_CHR_DESC_TIPO_RECADO
        )
    END
END

----------------------------------
-- PROCEDURE DELETE_TIPO_RECADO --
----------------------------------

CREATE PROCEDURE DELETE_TIPO_RECADO
(
    @P_COD_TIPO_RECADO INT
)
AS
BEGIN
    IF
    (
        SELECT
            COUNT(*)
        FROM
            TBL_RECADO
        WHERE
            TBL_RECADO.COD_TIPO_RECADO = @P_COD_TIPO_RECADO
    ) > 0
    BEGIN
        SELECT 'Existe(m) recado(s) com esse Assunto!' AS P_CHR_MSG_ERRO
    END
    ELSE
    BEGIN
        SELECT '' AS P_CHR_MSG_ERRO
        
        DELETE
			TBL_PERMISSAO_TIPO_RECADO
		WHERE
			TBL_PERMISSAO_TIPO_RECADO.COD_TIPO_RECADO = @P_COD_TIPO_RECADO
			
        DELETE
            TBL_TIPO_RECADO
        WHERE
            TBL_TIPO_RECADO.COD_TIPO_RECADO = @P_COD_TIPO_RECADO
    END    
END
