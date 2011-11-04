---------------------------------------
-- INTRANET CELU
-- \App_Data\Procedures\Biblioteca\TBL_ASSUNTO_OBRA.SQL
-- # 2010-10-02 - Criação
-- Matheus Araújo
-- Valquire Jesus
---------------------------------------

--------------------------------------
-- PROCEDURE LOAD_LIST_ASSUNTO_OBRA --
--------------------------------------

CREATE PROCEDURE LOAD_LIST_ASSUNTO_OBRA
AS
BEGIN
    SELECT
        TBL_ASSUNTO_OBRA.COD_ASSUNTO_OBRA,
        TBL_ASSUNTO_OBRA.CHR_DESC_ASSUNTO_OBRA
    FROM
        TBL_ASSUNTO_OBRA
    ORDER BY
        TBL_ASSUNTO_OBRA.CHR_DESC_ASSUNTO_OBRA
END

-------------------------------------
-- PROCEDURE LOAD_REG_ASSUNTO_OBRA --
-------------------------------------

CREATE PROCEDURE LOAD_REG_ASSUNTO_OBRA
(
    @P_COD_ASSUNTO_OBRA INT
)
AS
BEGIN
    SELECT
        TBL_ASSUNTO_OBRA.COD_ASSUNTO_OBRA,
        TBL_ASSUNTO_OBRA.CHR_DESC_ASSUNTO_OBRA
    FROM
        TBL_ASSUNTO_OBRA
    WHERE
        TBL_ASSUNTO_OBRA.COD_ASSUNTO_OBRA = @P_COD_ASSUNTO_OBRA
END

------------------------------------------
-- PROCEDURE VERIFY_INSERT_ASSUNTO_OBRA --
------------------------------------------

CREATE PROCEDURE VERIFY_INSERT_ASSUNTO_OBRA
(
    @P_COD_ASSUNTO_OBRA INT,
    @P_CHR_DESC_ASSUNTO_OBRA VARCHAR(128)
)
AS
BEGIN
    IF
    (
        SELECT
            COUNT(*)
        FROM
            TBL_ASSUNTO_OBRA
        WHERE
            TBL_ASSUNTO_OBRA.COD_ASSUNTO_OBRA <> @P_COD_ASSUNTO_OBRA AND
            TBL_ASSUNTO_OBRA.CHR_DESC_ASSUNTO_OBRA = @P_CHR_DESC_ASSUNTO_OBRA
    ) > 0
    BEGIN
        SELECT 'O assunto já foi cadastrado!' AS P_CHR_MSG_ERRO
    END
    ELSE
    BEGIN
        SELECT '' AS P_CHR_MSG_ERRO
    END
END

-----------------------------------
-- PROCEDURE INSERT_ASSUNTO_OBRA --
-----------------------------------

CREATE PROCEDURE INSERT_ASSUNTO_OBRA
(
    @P_COD_ASSUNTO_OBRA INT,
    @P_CHR_DESC_ASSUNTO_OBRA VARCHAR(128)
)
AS
BEGIN
    IF
    (
        SELECT
            COUNT(*)
        FROM
            TBL_ASSUNTO_OBRA
        WHERE
            TBL_ASSUNTO_OBRA.COD_ASSUNTO_OBRA = @P_COD_ASSUNTO_OBRA
    ) > 0
    BEGIN
        UPDATE
            TBL_ASSUNTO_OBRA
        SET
            TBL_ASSUNTO_OBRA.CHR_DESC_ASSUNTO_OBRA = @P_CHR_DESC_ASSUNTO_OBRA
        WHERE
            TBL_ASSUNTO_OBRA.COD_ASSUNTO_OBRA = @P_COD_ASSUNTO_OBRA
    END
    ELSE
    BEGIN
        INSERT INTO TBL_ASSUNTO_OBRA
        (
            TBL_ASSUNTO_OBRA.CHR_DESC_ASSUNTO_OBRA
        )
        VALUES
        (
            @P_CHR_DESC_ASSUNTO_OBRA
        )
    END
END

-----------------------------------
-- PROCEDURE DELETE_ASSUNTO_OBRA --
-----------------------------------

CREATE PROCEDURE DELETE_ASSUNTO_OBRA
(
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
            TBL_OBRA.COD_ASSUNTO_OBRA = @P_COD_ASSUNTO_OBRA
    ) > 0
    BEGIN
        SELECT 'Existe(m) obra(s) com esse Assunto!' AS P_CHR_MSG_ERRO
    END
    ELSE
    BEGIN
        SELECT '' AS P_CHR_MSG_ERRO
        DELETE
            TBL_ASSUNTO_OBRA
        WHERE
            TBL_ASSUNTO_OBRA.COD_ASSUNTO_OBRA = @P_COD_ASSUNTO_OBRA
    END    
END