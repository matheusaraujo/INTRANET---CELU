---------------------------------------
-- INTRANET CELU
-- \App_Data\Procedures\Biblioteca\TBL_AUTOR_OBRA.SQL
-- # 2010-10-02 - Criação
-- Matheus Araújo
-- Valquire Jesus
---------------------------------------

------------------------------------
-- PROCEDURE LOAD_LIST_AUTOR_OBRA --
------------------------------------

CREATE PROCEDURE LOAD_LIST_AUTOR_OBRA
AS
BEGIN
    SELECT
        TBL_AUTOR_OBRA.COD_AUTOR_OBRA,
        TBL_AUTOR_OBRA.CHR_NOME_AUTOR_OBRA
    FROM
        TBL_AUTOR_OBRA
    ORDER BY
        TBL_AUTOR_OBRA.CHR_NOME_AUTOR_OBRA
END

-----------------------------------
-- PROCEDURE LOAD_REG_AUTOR_OBRA --
-----------------------------------

CREATE PROCEDURE LOAD_REG_AUTOR_OBRA
(
    @P_COD_AUTOR_OBRA INT
)
AS
BEGIN
    SELECT
        TBL_AUTOR_OBRA.COD_AUTOR_OBRA,
        TBL_AUTOR_OBRA.CHR_NOME_AUTOR_OBRA
    FROM
        TBL_AUTOR_OBRA
    WHERE
        TBL_AUTOR_OBRA.COD_AUTOR_OBRA = @P_COD_AUTOR_OBRA
END

----------------------------------------
-- PROCEDURE VERIFY_INSERT_AUTOR_OBRA --
----------------------------------------

CREATE PROCEDURE VERIFY_INSERT_AUTOR_OBRA
(
    @P_COD_AUTOR_OBRA INT,
    @P_CHR_NOME_AUTOR_OBRA VARCHAR(128)
)
AS
BEGIN
    IF
    (
        SELECT
            COUNT(*)
        FROM
            TBL_AUTOR_OBRA
        WHERE
            TBL_AUTOR_OBRA.COD_AUTOR_OBRA <> @P_COD_AUTOR_OBRA AND
            TBL_AUTOR_OBRA.CHR_NOME_AUTOR_OBRA = @P_CHR_NOME_AUTOR_OBRA
    ) > 0
    BEGIN
        SELECT 'O autor já foi cadastrado!' AS P_CHR_MSG_ERRO
    END
    ELSE
    BEGIN
        SELECT '' AS P_CHR_MSG_ERRO
    END
END

---------------------------------
-- PROCEDURE INSERT_AUTOR_OBRA --
---------------------------------

CREATE PROCEDURE INSERT_AUTOR_OBRA
(
    @P_COD_AUTOR_OBRA INT,
    @P_CHR_NOME_AUTOR_OBRA VARCHAR(128)
)
AS
BEGIN
    IF
    (
        SELECT
            COUNT(*)
        FROM
            TBL_AUTOR_OBRA
        WHERE
            TBL_AUTOR_OBRA.COD_AUTOR_OBRA = @P_COD_AUTOR_OBRA
    ) > 0
    BEGIN
        UPDATE
            TBL_AUTOR_OBRA
        SET
            TBL_AUTOR_OBRA.CHR_NOME_AUTOR_OBRA = @P_CHR_NOME_AUTOR_OBRA
        WHERE
            TBL_AUTOR_OBRA.COD_AUTOR_OBRA = @P_COD_AUTOR_OBRA
    END
    ELSE
    BEGIN
        INSERT INTO TBL_AUTOR_OBRA
        (
            TBL_AUTOR_OBRA.CHR_NOME_AUTOR_OBRA
        )
        VALUES
        (
            @P_CHR_NOME_AUTOR_OBRA
        )
    END
END

---------------------------------
-- PROCEDURE DELETE_AUTOR_OBRA --
---------------------------------

CREATE PROCEDURE DELETE_AUTOR_OBRA
(
    @P_COD_AUTOR_OBRA INT
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
            TBL_OBRA.COD_AUTOR_OBRA = @P_COD_AUTOR_OBRA
    ) > 0
    BEGIN
        SELECT 'Existe(m) obra(s) com esse autor!' AS P_CHR_MSG_ERRO
    END
    ELSE
    BEGIN
        SELECT '' AS P_CHR_MSG_ERRO
        DELETE
            TBL_AUTOR_OBRA
        WHERE
            TBL_AUTOR_OBRA.COD_AUTOR_OBRA = @P_COD_AUTOR_OBRA
    END    
END