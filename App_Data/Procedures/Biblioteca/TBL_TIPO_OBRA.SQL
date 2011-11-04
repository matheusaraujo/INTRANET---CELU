---------------------------------------
-- INTRANET CELU
-- \App_Data\Procedures\Biblioteca\TBL_TIPO_OBRA.SQL
-- # 2010-10-02 - Criação
-- Matheus Araújo
-- Valquire Jesus
---------------------------------------

-----------------------------------
-- PROCEDURE LOAD_LIST_TIPO_OBRA --
-----------------------------------

CREATE PROCEDURE LOAD_LIST_TIPO_OBRA
AS
BEGIN
    SELECT
        TBL_TIPO_OBRA.COD_TIPO_OBRA,
        TBL_TIPO_OBRA.CHR_DESC_TIPO_OBRA
    FROM
        TBL_TIPO_OBRA
    ORDER BY
        TBL_TIPO_OBRA.CHR_DESC_TIPO_OBRA
END

----------------------------------
-- PROCEDURE LOAD_REG_TIPO_OBRA --
----------------------------------

CREATE PROCEDURE LOAD_REG_TIPO_OBRA
(
    @P_COD_TIPO_OBRA INT
)
AS
BEGIN
    SELECT
        TBL_TIPO_OBRA.COD_TIPO_OBRA,
        TBL_TIPO_OBRA.BLN_PERMITE_EMPRESTIMO,
        TBL_TIPO_OBRA.CHR_DESC_TIPO_OBRA
    FROM
        TBL_TIPO_OBRA
    WHERE
        TBL_TIPO_OBRA.COD_TIPO_OBRA = @P_COD_TIPO_OBRA
END

---------------------------------------
-- PROCEDURE VERIFY_INSERT_TIPO_OBRA --
---------------------------------------

CREATE PROCEDURE VERIFY_INSERT_TIPO_OBRA
(
    @P_COD_TIPO_OBRA INT,
    @P_BLN_PERMITE_EMPRESTIMO BIT,
    @P_CHR_DESC_TIPO_OBRA VARCHAR(128)
)
AS
BEGIN
    IF
    (
        SELECT
            COUNT(*)
        FROM
            TBL_TIPO_OBRA
        WHERE
            TBL_TIPO_OBRA.COD_TIPO_OBRA <> @P_COD_TIPO_OBRA AND
            TBL_TIPO_OBRA.CHR_DESC_TIPO_OBRA = @P_CHR_DESC_TIPO_OBRA
    ) > 0
    BEGIN
        SELECT 'O tipo de obra já foi cadastrado!' AS P_CHR_MSG_ERRO
    END
    ELSE
    BEGIN
        SELECT '' AS P_CHR_MSG_ERRO
    END
END

--------------------------------
-- PROCEDURE INSERT_TIPO_OBRA --
--------------------------------

CREATE PROCEDURE INSERT_TIPO_OBRA
(
    @P_COD_TIPO_OBRA INT,
    @P_BLN_PERMITE_EMPRESTIMO BIT,
    @P_CHR_DESC_TIPO_OBRA VARCHAR(128)
)
AS
BEGIN
    IF
    (
        SELECT
            COUNT(*)
        FROM
            TBL_TIPO_OBRA
        WHERE
            TBL_TIPO_OBRA.COD_TIPO_OBRA = @P_COD_TIPO_OBRA
    ) > 0
    BEGIN
        UPDATE
            TBL_TIPO_OBRA
        SET
            TBL_TIPO_OBRA.BLN_PERMITE_EMPRESTIMO = @P_BLN_PERMITE_EMPRESTIMO,
            TBL_TIPO_OBRA.CHR_DESC_TIPO_OBRA = @P_CHR_DESC_TIPO_OBRA
        WHERE
            TBL_TIPO_OBRA.COD_TIPO_OBRA = @P_COD_TIPO_OBRA
    END
    ELSE
    BEGIN
        INSERT INTO TBL_TIPO_OBRA
        (
            TBL_TIPO_OBRA.BLN_PERMITE_EMPRESTIMO,
            TBL_TIPO_OBRA.CHR_DESC_TIPO_OBRA
        )
        VALUES
        (
            @P_BLN_PERMITE_EMPRESTIMO,
            @P_CHR_DESC_TIPO_OBRA
        )
    END
END

--------------------------------
-- PROCEDURE DELETE_TIPO_OBRA --
--------------------------------

CREATE PROCEDURE DELETE_TIPO_OBRA
(
    @P_COD_TIPO_OBRA INT
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
            TBL_OBRA.COD_TIPO_OBRA = @P_COD_TIPO_OBRA
    ) > 0
    BEGIN
        SELECT 'Existe(m) obra(s) com esse tipo!' AS P_CHR_MSG_ERRO
    END
    ELSE
    BEGIN
        SELECT '' AS P_CHR_MSG_ERRO
        DELETE
            TBL_TIPO_OBRA
        WHERE
            TBL_TIPO_OBRA.COD_TIPO_OBRA = @P_COD_TIPO_OBRA
    END    
END