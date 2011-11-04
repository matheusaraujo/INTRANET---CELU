---------------------------------------
-- INTRANET CELU
-- \App_Data\Procedures\Biblioteca\TBL_STATUS_OBRA.SQL
-- # 2010-10-02 - Criação
-- Matheus Araújo
-- Valquire Jesus
---------------------------------------

-------------------------------------
-- PROCEDURE LOAD_LIST_STATUS_OBRA --
-------------------------------------

CREATE PROCEDURE LOAD_LIST_STATUS_OBRA
AS
BEGIN
    SELECT
        TBL_STATUS_OBRA.COD_STATUS_OBRA,
        TBL_STATUS_OBRA.CHR_DESC_STATUS_OBRA
    FROM
        TBL_STATUS_OBRA
    ORDER BY
        TBL_STATUS_OBRA.CHR_DESC_STATUS_OBRA
END

------------------------------------
-- PROCEDURE LOAD_REG_STATUS_OBRA --
------------------------------------

CREATE PROCEDURE LOAD_REG_STATUS_OBRA
(
    @P_COD_STATUS_OBRA INT
)
AS
BEGIN
    SELECT
        TBL_STATUS_OBRA.COD_STATUS_OBRA,
        TBL_STATUS_OBRA.BLN_PERMITE_RESERVA,
        TBL_STATUS_OBRA.BLN_PERMITE_EMPRESTIMO,
        TBL_STATUS_OBRA.BLN_PERMITE_RENOVACAO,
        TBL_STATUS_OBRA.CHR_DESC_STATUS_OBRA
    FROM
        TBL_STATUS_OBRA
    WHERE
        TBL_STATUS_OBRA.COD_STATUS_OBRA = @P_COD_STATUS_OBRA
END

-----------------------------------------
-- PROCEDURE VERIFY_INSERT_STATUS_OBRA --
-----------------------------------------

CREATE PROCEDURE VERIFY_INSERT_STATUS_OBRA
(
    @P_COD_STATUS_OBRA INT,
    @P_BLN_PERMITE_RESERVA BIT,
    @P_BLN_PERMITE_EMPRESTIMO BIT,
    @P_BLN_PERMITE_RENOVACAO BIT,
    @P_CHR_DESC_STATUS_OBRA VARCHAR(128)
)
AS
BEGIN
    IF
    (
        SELECT
            COUNT(*)
        FROM
            TBL_STATUS_OBRA
        WHERE
            TBL_STATUS_OBRA.COD_STATUS_OBRA <> @P_COD_STATUS_OBRA AND
            TBL_STATUS_OBRA.CHR_DESC_STATUS_OBRA = @P_CHR_DESC_STATUS_OBRA
    ) > 0
    BEGIN
        SELECT 'O status de obra já foi cadastrado!' AS P_CHR_MSG_ERRO
    END
    ELSE
    BEGIN
        SELECT '' AS P_CHR_MSG_ERRO
    END
END

----------------------------------
-- PROCEDURE INSERT_STATUS_OBRA --
----------------------------------

CREATE PROCEDURE INSERT_STATUS_OBRA
(
    @P_COD_STATUS_OBRA INT,
    @P_BLN_PERMITE_RESERVA BIT,
    @P_BLN_PERMITE_EMPRESTIMO BIT,
    @P_BLN_PERMITE_RENOVACAO BIT,
    @P_CHR_DESC_STATUS_OBRA VARCHAR(128)
)
AS
BEGIN
    IF
    (
        SELECT
            COUNT(*)
        FROM
            TBL_STATUS_OBRA
        WHERE
            TBL_STATUS_OBRA.COD_STATUS_OBRA = @P_COD_STATUS_OBRA
    ) > 0
    BEGIN
        UPDATE
            TBL_STATUS_OBRA
        SET
            TBL_STATUS_OBRA.BLN_PERMITE_RESERVA = @P_BLN_PERMITE_RESERVA,
            TBL_STATUS_OBRA.BLN_PERMITE_EMPRESTIMO = @P_BLN_PERMITE_EMPRESTIMO,
            TBL_STATUS_OBRA.BLN_PERMITE_RENOVACAO = @P_BLN_PERMITE_RENOVACAO,
            TBL_STATUS_OBRA.CHR_DESC_STATUS_OBRA = @P_CHR_DESC_STATUS_OBRA
        WHERE
            TBL_STATUS_OBRA.COD_STATUS_OBRA = @P_COD_STATUS_OBRA
    END
    ELSE
    BEGIN
        INSERT INTO TBL_STATUS_OBRA
        (
            TBL_STATUS_OBRA.BLN_PERMITE_RESERVA,
            TBL_STATUS_OBRA.BLN_PERMITE_EMPRESTIMO,
            TBL_STATUS_OBRA.BLN_PERMITE_RENOVACAO,
            TBL_STATUS_OBRA.CHR_DESC_STATUS_OBRA
        )
        VALUES
        (
            @P_BLN_PERMITE_RESERVA,
            @P_BLN_PERMITE_EMPRESTIMO,
            @P_BLN_PERMITE_RENOVACAO,
            @P_CHR_DESC_STATUS_OBRA
        )
    END
END

----------------------------------
-- PROCEDURE DELETE_STATUS_OBRA --
----------------------------------

CREATE PROCEDURE DELETE_STATUS_OBRA
(
    @P_COD_STATUS_OBRA INT
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
            TBL_OBRA.COD_STATUS_OBRA = @P_COD_STATUS_OBRA
    ) > 0
    BEGIN
        SELECT 'Existe(m) obra(s) nesse Status!' AS P_CHR_MSG_ERRO
    END
    ELSE
    BEGIN
        SELECT '' AS P_CHR_MSG_ERRO
        DELETE
            TBL_STATUS_OBRA
        WHERE
            TBL_STATUS_OBRA.COD_STATUS_OBRA = @P_COD_STATUS_OBRA
    END    
END