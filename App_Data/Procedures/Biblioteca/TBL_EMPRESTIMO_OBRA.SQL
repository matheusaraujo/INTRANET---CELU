---------------------------------------
-- INTRANET CELU
-- \App_Data\Procedures\Biblioteca\TBL_EMPRESTIMO_OBRA.SQL
-- # 2011-02-11 - Criação
-- Matheus Araújo
---------------------------------------

-----------------------------------------------------
-- PROCEDURE VERIFY_INSERT_EMPRESTIMO_RESERVA_OBRA --
-----------------------------------------------------

CREATE PROCEDURE VERIFY_INSERT_EMPRESTIMO_RESERVA_OBRA
(
    @P_COD_RESERVA_OBRA INT
)
AS
BEGIN

    DECLARE @P_COD_MORADOR INT
    DECLARE @P_COD_OBRA INT
    
    SELECT
        @P_COD_MORADOR = TBL_RESERVA_OBRA.COD_MORADOR,
        @P_COD_OBRA = TBL_RESERVA_OBRA.COD_OBRA
    FROM
        TBL_RESERVA_OBRA
    WHERE
        TBL_RESERVA_OBRA.COD_RESERVA_OBRA = @P_COD_RESERVA_OBRA
        
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
            TBL_STATUS_OBRA.BLN_PERMITE_EMPRESTIMO = 1 AND
            TBL_TIPO_OBRA.BLN_PERMITE_EMPRESTIMO = 1        
    )
    > 0
    BEGIN
        IF
        (
            SELECT
                COUNT(*)
            FROM
                TBL_EMPRESTIMO_OBRA
            WHERE
                TBL_EMPRESTIMO_OBRA.COD_MORADOR = @P_COD_MORADOR AND
                TBL_EMPRESTIMO_OBRA.BLN_ABERTO = 1
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
                SELECT '' AS P_CHR_MSG_ERRO
            END
            ELSE
            BEGIN
                SELECT 'O morador possui atrasos em empréstimos!' AS P_CHR_MSG_ERRO
            END
        END
        ELSE
        BEGIN
            SELECT 'O morador atingiu o limite de empréstimos em aberto!' AS P_CHR_MSG_ERRO
        END
    END
    ELSE
    BEGIN
        SELECT 'O status/tipo de obra não permite empréstimo!' AS P_CHR_MSG_ERRO
    END
    

END

----------------------------------------------
-- PROCEDURE INSERT_EMPRESTIMO_RESERVA_OBRA --
----------------------------------------------

CREATE PROCEDURE INSERT_EMPRESTIMO_RESERVA_OBRA
(
    @P_COD_RESERVA_OBRA INT
)
AS
BEGIN

    DECLARE @P_COD_MORADOR INT
    DECLARE @P_COD_OBRA INT

    SELECT
        @P_COD_MORADOR = TBL_RESERVA_OBRA.COD_MORADOR,
        @P_COD_OBRA = TBL_RESERVA_OBRA.COD_OBRA
    FROM
        TBL_RESERVA_OBRA
    WHERE
        TBL_RESERVA_OBRA.COD_RESERVA_OBRA = @P_COD_RESERVA_OBRA

    INSERT INTO TBL_EMPRESTIMO_OBRA
    (
        TBL_EMPRESTIMO_OBRA.COD_MORADOR,
        TBL_EMPRESTIMO_OBRA.COD_OBRA,
        TBL_EMPRESTIMO_OBRA.DT_DATA_EMPRESTIMO,
        TBL_EMPRESTIMO_OBRA.DT_DATA_DEVOLUCAO_PREVISTA,
        TBL_EMPRESTIMO_OBRA.INT_CONT_RENOVACAO,
        TBL_EMPRESTIMO_OBRA.BLN_ABERTO
    )
    VALUES
    (
        @P_COD_MORADOR,
        @P_COD_OBRA,
        GETDATE(),
        DATEADD(DAY, 10, GETDATE()),
        0,
        1
    )
    
    
    -- ATUALIZA A RESERVA
    UPDATE
        TBL_RESERVA_OBRA
    SET
        TBL_RESERVA_OBRA.BLN_ABERTA = 0
    WHERE
        TBL_RESERVA_OBRA.COD_RESERVA_OBRA = @P_COD_RESERVA_OBRA
        
    -- ATUALIZA A OBRA
    UPDATE
        TBL_OBRA
    SET
        TBL_OBRA.COD_STATUS_OBRA =
        (
            SELECT
                TBL_STATUS_OBRA.COD_STATUS_OBRA
            FROM
                TBL_STATUS_OBRA
            WHERE
                TBL_STATUS_OBRA.CHR_DESC_STATUS_OBRA = 'Emprestado'
        )
    WHERE
        TBL_OBRA.COD_OBRA = @P_COD_OBRA
        
        
END

----------------------------------------------
-- PROCEDURE LOAD_LIST_AUTO_EMPRESTIMO_OBRA --
----------------------------------------------

CREATE PROCEDURE LOAD_LIST_AUTO_EMPRESTIMO_OBRA
(
    @P_COD_MORADOR INT,
    @P_BIT_SHOW_ALL BIT    
)
AS
BEGIN
    SELECT
        TBL_EMPRESTIMO_OBRA.COD_EMPRESTIMO_OBRA,
        TBL_EMPRESTIMO_OBRA.COD_OBRA,
        TBL_OBRA.CHR_TITULO,
        (
            CONVERT(VARCHAR(10), TBL_EMPRESTIMO_OBRA.DT_DATA_EMPRESTIMO, 103)
        ) AS DT_DATA_EMPRESTIMO,
        (
            CONVERT(VARCHAR(10), TBL_EMPRESTIMO_OBRA.DT_DATA_DEVOLUCAO_PREVISTA, 103)
        ) AS DT_DATA_DEVOLUCAO_PREVISTA,
        (
            CASE TBL_EMPRESTIMO_OBRA.BLN_ABERTO
                WHEN 1 THEN 'Sim'
                ELSE 'Não'
            END
        ) AS CHR_ABERTO,
        TBL_EMPRESTIMO_OBRA.INT_CONT_RENOVACAO,
        (
            DATEDIFF(DAY, GETDATE(), TBL_EMPRESTIMO_OBRA.DT_DATA_DEVOLUCAO_PREVISTA)                
        ) AS CHR_DIAS_VENCIMENTO
    FROM
        TBL_EMPRESTIMO_OBRA
        INNER JOIN TBL_OBRA
            ON TBL_EMPRESTIMO_OBRA.COD_OBRA = TBL_OBRA.COD_OBRA
    WHERE
        TBL_EMPRESTIMO_OBRA.COD_MORADOR = @P_COD_MORADOR AND
        (
			(TBL_EMPRESTIMO_OBRA.BLN_ABERTO = 1 AND @P_BIT_SHOW_ALL = 0)
			OR @P_BIT_SHOW_ALL = 1
		)
	ORDER BY
	    TBL_EMPRESTIMO_OBRA.DT_DATA_DEVOLUCAO_PREVISTA,
	    TBL_OBRA.CHR_TITULO
END

-----------------------------------------
-- PROCEDURE LOAD_LIST_EMPRESTIMO_OBRA --
-----------------------------------------

CREATE PROCEDURE LOAD_LIST_EMPRESTIMO_OBRA
AS
BEGIN
    SELECT
        TBL_EMPRESTIMO_OBRA.COD_EMPRESTIMO_OBRA,
        TBL_MORADOR.COD_MORADOR,
        TBL_OBRA.COD_OBRA,        
        TBL_MORADOR.CHR_NOME,        
        TBL_OBRA.CHR_TITULO,                        
        (
            CONVERT(VARCHAR(10), TBL_EMPRESTIMO_OBRA.DT_DATA_EMPRESTIMO, 103)
        ) AS DT_DATA_EMPRESTIMO,
        (
            CONVERT(VARCHAR(10), TBL_EMPRESTIMO_OBRA.DT_DATA_DEVOLUCAO_PREVISTA, 103)
        ) AS DT_DATA_DEVOLUCAO_PREVISTA,        
        TBL_EMPRESTIMO_OBRA.INT_CONT_RENOVACAO,
        (
            DATEDIFF(DAY, GETDATE(), TBL_EMPRESTIMO_OBRA.DT_DATA_DEVOLUCAO_PREVISTA)                
        ) AS CHR_DIAS_VENCIMENTO
    FROM
        TBL_MORADOR
        INNER JOIN TBL_EMPRESTIMO_OBRA
            ON TBL_MORADOR.COD_MORADOR = TBL_EMPRESTIMO_OBRA.COD_MORADOR
        INNER JOIN TBL_OBRA
            ON TBL_EMPRESTIMO_OBRA.COD_OBRA = TBL_OBRA.COD_OBRA
    WHERE
        TBL_EMPRESTIMO_OBRA.BLN_ABERTO = 1
	ORDER BY
	    TBL_EMPRESTIMO_OBRA.DT_DATA_DEVOLUCAO_PREVISTA,
	    TBL_MORADOR.CHR_NOME,
	    TBL_OBRA.CHR_TITULO
END

--------------------------------------
-- PROCEDURE RENOVA_EMPRESTIMO_OBRA --
--------------------------------------

CREATE PROCEDURE RENOVA_EMPRESTIMO_OBRA
(
    @P_COD_EMPRESTIMO_OBRA INT
)
AS
BEGIN
    
    -- VERIFICA STATUS
    -- VERIFICA DATA    
    -- VERIFICA QUANTIDADE
    
    DECLARE @P_COD_MORADOR INT
    DECLARE @P_COD_OBRA INT
    
    SELECT
        @P_COD_MORADOR = TBL_EMPRESTIMO_OBRA.COD_MORADOR,
        @P_COD_OBRA = TBL_EMPRESTIMO_OBRA.COD_OBRA
    FROM
        TBL_EMPRESTIMO_OBRA
    WHERE
        TBL_EMPRESTIMO_OBRA.COD_EMPRESTIMO_OBRA = @P_COD_EMPRESTIMO_OBRA
    
    IF
    (
        SELECT
            COUNT(*)
        FROM
            TBL_OBRA
            INNER JOIN TBL_STATUS_OBRA
                ON TBL_OBRA.COD_STATUS_OBRA = TBL_STATUS_OBRA.COD_STATUS_OBRA
        WHERE
            TBL_OBRA.COD_OBRA = @P_COD_OBRA AND
            TBL_STATUS_OBRA.BLN_PERMITE_RENOVACAO = 1
    ) > 0
    BEGIN
        IF
        (
            SELECT
                COUNT(*)
            FROM
                TBL_EMPRESTIMO_OBRA
            WHERE
                TBL_EMPRESTIMO_OBRA.COD_EMPRESTIMO_OBRA = @P_COD_EMPRESTIMO_OBRA AND
                DATEDIFF(DAY, GETDATE(), TBL_EMPRESTIMO_OBRA.DT_DATA_DEVOLUCAO_PREVISTA) > 0
        ) > 0
        BEGIN
            IF
            (
                SELECT
                    TBL_EMPRESTIMO_OBRA.INT_CONT_RENOVACAO
                FROM
                    TBL_EMPRESTIMO_OBRA
                WHERE
                    TBL_EMPRESTIMO_OBRA.COD_EMPRESTIMO_OBRA = @P_COD_EMPRESTIMO_OBRA
            ) < 3
            BEGIN
                SELECT '' AS P_CHR_MSG_ERRO             
                
                UPDATE
                    TBL_EMPRESTIMO_OBRA
                SET
                    TBL_EMPRESTIMO_OBRA.DT_DATA_DEVOLUCAO_PREVISTA = DATEADD(DAY, 10, GETDATE()),
                    TBL_EMPRESTIMO_OBRA.INT_CONT_RENOVACAO = TBL_EMPRESTIMO_OBRA.INT_CONT_RENOVACAO + 1
                WHERE
                    TBL_EMPRESTIMO_OBRA.COD_EMPRESTIMO_OBRA = @P_COD_EMPRESTIMO_OBRA
                    
            END
            ELSE
            BEGIN
                SELECT 'O empréstimo atingiu o limite de renovações!' AS P_CHR_MSG_ERRO
            END
        END
        ELSE
        BEGIN
            SELECT 'O empréstimo está vencido!' AS P_CHR_MSG_ERRO
        END
    END
    ELSE
    BEGIN
        SELECT 'Existe uma reserva!' AS P_CHR_MSG_ERRO
    END
END

-----------------------------------------
-- PROCEDURE DEVOLUCAO_EMPRESTIMO_OBRA --
-----------------------------------------

CREATE PROCEDURE DEVOLUCAO_EMPRESTIMO_OBRA
(
    @P_COD_EMPRESTIMO_OBRA INT
)
AS
BEGIN

    DECLARE @P_COD_OBRA INT
    DECLARE @P_DISPONIVEL INT
    DECLARE @P_RESERVADO INT
    DECLARE @P_EMPRESTADO INT
    DECLARE @P_EMPRESTADO_RESERVA INT

    -- DETERMINA OS CÓDIGOS
    SET @P_COD_OBRA = (SELECT COD_OBRA FROM TBL_EMPRESTIMO_OBRA WHERE COD_EMPRESTIMO_OBRA = @P_COD_EMPRESTIMO_OBRA)
    SET @P_DISPONIVEL = (SELECT COD_STATUS_OBRA FROM TBL_STATUS_OBRA WHERE CHR_DESC_STATUS_OBRA = 'Disponível')
    SET @P_RESERVADO = (SELECT COD_STATUS_OBRA FROM TBL_STATUS_OBRA WHERE CHR_DESC_STATUS_OBRA = 'Reservado')
    SET @P_EMPRESTADO = (SELECT COD_STATUS_OBRA FROM TBL_STATUS_OBRA WHERE CHR_DESC_STATUS_OBRA = 'Emprestado')
    SET @P_EMPRESTADO_RESERVA = (SELECT COD_STATUS_OBRA FROM TBL_STATUS_OBRA WHERE CHR_DESC_STATUS_OBRA = 'Emprestado com reserva')


    -- ATUALIZA O EMPRÉSTIMO
    UPDATE
        TBL_EMPRESTIMO_OBRA
    SET
        TBL_EMPRESTIMO_OBRA.DT_DATA_DEVOLUCAO = GETDATE(),
        TBL_EMPRESTIMO_OBRA.BLN_ABERTO = 0
    WHERE
        TBL_EMPRESTIMO_OBRA.COD_EMPRESTIMO_OBRA = @P_COD_EMPRESTIMO_OBRA
        
    -- ATUALIZA A OBRA
    UPDATE
        TBL_OBRA
    SET
        TBL_OBRA.COD_STATUS_OBRA =
        (
            CASE TBL_OBRA.COD_STATUS_OBRA
                WHEN @P_EMPRESTADO THEN @P_DISPONIVEL
                WHEN @P_EMPRESTADO_RESERVA THEN @P_RESERVADO
            END
        )
    WHERE
        TBL_OBRA.COD_OBRA = @P_COD_OBRA

END
