---------------------------------------
-- INTRANET CELU
-- \App_Data\Procedures\Biblioteca\TBL_RESERVA_OBRA.SQL
-- # 2011-02-10 - Criação
-- Matheus Araújo
---------------------------------------

------------------------------------------
-- PROCEDURE VERIFY_INSERT_RESERVA_OBRA --
------------------------------------------

CREATE PROCEDURE VERIFY_INSERT_RESERVA_OBRA
(
    @P_COD_MORADOR INT,
    @P_COD_OBRA INT    
)
AS
BEGIN
    IF
    (
        SELECT
            COUNT(*)
        FROM
            TBL_OBRA
            INNER JOIN TBL_STATUS_OBRA
                ON TBL_OBRA.COD_STATUS_OBRA = TBL_STATUS_OBRA.COD_STATUS_OBRA
            INNER JOIN TBL_TIPO_OBRA
                ON TBL_OBRA.COD_TIPO_OBRA = TBL_TIPO_OBRA.COD_TIPO_OBRA
        WHERE
            TBL_OBRA.COD_OBRA = @P_COD_OBRA AND
            TBL_STATUS_OBRA.BLN_PERMITE_RESERVA = 1 AND
            TBL_TIPO_OBRA.BLN_PERMITE_EMPRESTIMO = 1
    )
    > 0
    BEGIN    
        IF
        (
            SELECT
                COUNT(*)
            FROM
                TBL_RESERVA_OBRA
            WHERE
                TBL_RESERVA_OBRA.COD_MORADOR = @P_COD_MORADOR AND
                TBL_RESERVA_OBRA.BLN_ABERTA = 1
        ) < 3
        BEGIN
            IF
            (
                SELECT
                    COUNT(*)
                FROM
                    TBL_EMPRESTIMO_OBRA
                WHERE
                    TBL_EMPRESTIMO_OBRA.COD_MORADOR = @P_COD_MORADOR AND
                    TBL_EMPRESTIMO_OBRA.BLN_ABERTO = 1 AND
                    DATEDIFF(DAY, GETDATE(), TBL_EMPRESTIMO_OBRA.DT_DATA_DEVOLUCAO_PREVISTA) < 0
            ) = 0
            BEGIN
                IF
                (
                    SELECT
                        COUNT(*)
                    FROM
                        TBL_EMPRESTIMO_OBRA
                    WHERE
                        TBL_EMPRESTIMO_OBRA.COD_MORADOR = @P_COD_MORADOR AND
                        TBL_EMPRESTIMO_OBRA.COD_OBRA = @P_COD_OBRA AND
                        TBL_EMPRESTIMO_OBRA.BLN_ABERTO = 1
                ) = 0
                BEGIN
                    SELECT '' AS P_CHR_MSG_ERO
                END
                ELSE
                BEGIN
                    SELECT 'A obra está emprestada para o morador!' AS P_CHR_MSG_ERRO
                END
            END
            ELSE
            BEGIN
                SELECT 'O morador possui atrasos em empréstimos!' AS P_CHR_MSG_ERRO
            END
        END
        ELSE
        BEGIN
            SELECT 'O morador atingiu o limite de reservas em aberto!' AS P_CHR_MSG_ERRO
        END
    END
    ELSE
    BEGIN
        SELECT 'A obra não está disponível para reserva!' AS P_CHR_MSG_ERRO
    END
END

-----------------------------------
-- PROCEDURE INSERT_RESERVA_OBRA --
-----------------------------------

CREATE PROCEDURE INSERT_RESERVA_OBRA
(
    @P_COD_MORADOR INT,
    @P_COD_OBRA INT    
)
AS
BEGIN

    DECLARE @P_DISPONIVEL INT
    DECLARE @P_RESERVADO INT
    DECLARE @P_EMPRESTADO INT
    DECLARE @P_EMPRESTADO_RESERVA INT

    -- DETERMINA OS CÓDIGOS
    SET @P_DISPONIVEL = (SELECT COD_STATUS_OBRA FROM TBL_STATUS_OBRA WHERE CHR_DESC_STATUS_OBRA = 'Disponível')
    SET @P_RESERVADO = (SELECT COD_STATUS_OBRA FROM TBL_STATUS_OBRA WHERE CHR_DESC_STATUS_OBRA = 'Reservado')
    SET @P_EMPRESTADO = (SELECT COD_STATUS_OBRA FROM TBL_STATUS_OBRA WHERE CHR_DESC_STATUS_OBRA = 'Emprestado')
    SET @P_EMPRESTADO_RESERVA = (SELECT COD_STATUS_OBRA FROM TBL_STATUS_OBRA WHERE CHR_DESC_STATUS_OBRA = 'Emprestado com reserva')

    -- ATUALIZA STATUS DA OBRA
    UPDATE
        TBL_OBRA
    SET
        TBL_OBRA.COD_STATUS_OBRA =
        (
            CASE TBL_OBRA.COD_STATUS_OBRA
                WHEN @P_DISPONIVEL THEN @P_RESERVADO
                WHEN @P_EMPRESTADO THEN @P_EMPRESTADO_RESERVA
            END
        )
    WHERE
        TBL_OBRA.COD_OBRA = @P_COD_OBRA

    INSERT INTO TBL_RESERVA_OBRA
    (
        TBL_RESERVA_OBRA.COD_MORADOR,
        TBL_RESERVA_OBRA.COD_OBRA,
        TBL_RESERVA_OBRA.DT_DATAHORA,
        TBL_RESERVA_OBRA.BLN_ABERTA
    )
    VALUES
    (
        @P_COD_MORADOR,
        @P_COD_OBRA,
        GETDATE(),
        1
    )
END

-------------------------------------------
-- PROCEDURE LOAD_LIST_AUTO_RESERVA_OBRA --
-------------------------------------------

CREATE PROCEDURE LOAD_LIST_AUTO_RESERVA_OBRA
(
    @P_COD_MORADOR INT,
    @P_BIT_SHOW_ALL BIT
)
AS
BEGIN

    SELECT
        TBL_RESERVA_OBRA.COD_RESERVA_OBRA,
        TBL_RESERVA_OBRA.COD_OBRA,
        TBL_OBRA.CHR_TITULO,
        (
            CONVERT(VARCHAR(10), TBL_RESERVA_OBRA.DT_DATAHORA, 103) + ' - ' + 
            CONVERT(VARCHAR(5), TBL_RESERVA_OBRA.DT_DATAHORA, 108)
        ) AS DT_DATAHORA,
        (
            CASE TBL_RESERVA_OBRA.BLN_ABERTA
                WHEN 1 THEN 'Sim'
                ELSE 'Não'
            END
        ) AS CHR_ABERTA
    FROM
        TBL_RESERVA_OBRA
        INNER JOIN TBL_OBRA
            ON TBL_RESERVA_OBRA.COD_OBRA = TBL_OBRA.COD_OBRA
    WHERE
        TBL_RESERVA_OBRA.COD_MORADOR = @P_COD_MORADOR AND
        (
			(TBL_RESERVA_OBRA.BLN_ABERTA = 1 AND @P_BIT_SHOW_ALL = 0)
			OR @P_BIT_SHOW_ALL = 1
		)
	ORDER BY
	    TBL_RESERVA_OBRA.DT_DATAHORA,
	    TBL_OBRA.CHR_TITULO
END

--------------------------------------
-- PROCEDURE LOAD_LIST_RESERVA_OBRA --
--------------------------------------

CREATE PROCEDURE LOAD_LIST_RESERVA_OBRA
AS
BEGIN
    SELECT
        TBL_RESERVA_OBRA.COD_RESERVA_OBRA,
        TBL_MORADOR.COD_MORADOR,
        TBL_MORADOR.CHR_NOME,
        TBL_OBRA.COD_OBRA,
        TBL_OBRA.CHR_TITULO,
        (
            CONVERT(VARCHAR(10), TBL_RESERVA_OBRA.DT_DATAHORA, 103) + ' - ' + 
            CONVERT(VARCHAR(5), TBL_RESERVA_OBRA.DT_DATAHORA, 108)
        ) AS DT_DATAHORA
    FROM
        TBL_OBRA
        INNER JOIN TBL_RESERVA_OBRA
            ON TBL_OBRA.COD_OBRA = TBL_RESERVA_OBRA.COD_OBRA
        INNER JOIN TBL_MORADOR
            ON TBL_RESERVA_OBRA.COD_MORADOR = TBL_MORADOR.COD_MORADOR
    WHERE
        TBL_RESERVA_OBRA.BLN_ABERTA = 1
    ORDER BY
        TBL_RESERVA_OBRA.DT_DATAHORA DESC,
        TBL_MORADOR.CHR_NOME,
        TBL_OBRA.CHR_TITULO
END

------------------------------------
-- PROCEDURE CANCELA_RESERVA_OBRA --
------------------------------------

CREATE PROCEDURE CANCELA_RESERVA_OBRA
(
    @P_COD_RESERVA_OBRA INT
)
AS
BEGIN

    DECLARE @P_COD_OBRA INT
    DECLARE @P_DISPONIVEL INT
    DECLARE @P_RESERVADO INT
    DECLARE @P_EMPRESTADO INT
    DECLARE @P_EMPRESTADO_RESERVA INT

    -- DETERMINA OS CÓDIGOS
    SET @P_DISPONIVEL = (SELECT COD_STATUS_OBRA FROM TBL_STATUS_OBRA WHERE CHR_DESC_STATUS_OBRA = 'Disponível')
    SET @P_RESERVADO = (SELECT COD_STATUS_OBRA FROM TBL_STATUS_OBRA WHERE CHR_DESC_STATUS_OBRA = 'Reservado')
    SET @P_EMPRESTADO = (SELECT COD_STATUS_OBRA FROM TBL_STATUS_OBRA WHERE CHR_DESC_STATUS_OBRA = 'Emprestado')
    SET @P_EMPRESTADO_RESERVA = (SELECT COD_STATUS_OBRA FROM TBL_STATUS_OBRA WHERE CHR_DESC_STATUS_OBRA = 'Emprestado com reserva')
    
    SET @P_COD_OBRA =
    (
        SELECT
            TBL_RESERVA_OBRA.COD_OBRA
        FROM
            TBL_RESERVA_OBRA
        WHERE
            TBL_RESERVA_OBRA.COD_RESERVA_OBRA = @P_COD_RESERVA_OBRA
    )
    
    UPDATE
        TBL_RESERVA_OBRA
    SET
        TBL_RESERVA_OBRA.BLN_ABERTA = 0
    WHERE
        TBL_RESERVA_OBRA.COD_RESERVA_OBRA = @P_COD_RESERVA_OBRA
    
        
    UPDATE
        TBL_OBRA
    SET
        TBL_OBRA.COD_STATUS_OBRA =
        (
            CASE TBL_OBRA.COD_STATUS_OBRA
                WHEN @P_EMPRESTADO_RESERVA THEN @P_EMPRESTADO
                WHEN @P_RESERVADO THEN @P_DISPONIVEL
            END
        )
    WHERE
        TBL_OBRA.COD_OBRA = @P_COD_OBRA
    
    
END