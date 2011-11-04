---------------------------------------
-- INTRANET CELU
-- \App_Data\Procedures\Aviso\TBL_AVISO.SQL
-- # 2011-02-07 - Criação
-- Matheus Araújo
---------------------------------------

-------------------------------------
-- PROCEDURE LOAD_LIST_AVISO_GERAL --
-------------------------------------

CREATE PROCEDURE LOAD_LIST_AVISO_GERAL
AS
BEGIN
    SELECT
        TBL_AVISO.COD_AVISO,
        TBL_AVISO.CHR_ASSUNTO,
        TBL_MORADOR.CHR_NOME,
        (
            CONVERT(VARCHAR(10), TBL_AVISO.DT_DATAHORA, 103) + ' - ' +
            CONVERT(VARCHAR(5), TBL_AVISO.DT_DATAHORA, 108)
        ) AS DT_DATAHORA
    FROM
        TBL_AVISO
        INNER JOIN TBL_MORADOR
            ON TBL_AVISO.COD_MORADOR = TBL_MORADOR.COD_MORADOR
    WHERE
        TBL_AVISO.BLN_ATIVO = 1
    ORDER BY
        TBL_AVISO.DT_DATAHORA DESC,
        TBL_AVISO.CHR_ASSUNTO
END

-----------------------------------
-- PROCEDURE LOAD_LIST_AVISO_TOP --
-----------------------------------

CREATE PROCEDURE LOAD_LIST_AVISO_TOP
AS
BEGIN
    SELECT TOP 3
        TBL_AVISO.COD_AVISO,
        TBL_AVISO.CHR_ASSUNTO,
        TBL_MORADOR.CHR_NOME,
        (
            CONVERT(VARCHAR(10), TBL_AVISO.DT_DATAHORA, 103) + ' - ' +
            CONVERT(VARCHAR(5), TBL_AVISO.DT_DATAHORA, 108)
        ) AS DT_DATAHORA
    FROM
        TBL_AVISO
        INNER JOIN TBL_MORADOR
            ON TBL_AVISO.COD_MORADOR = TBL_MORADOR.COD_MORADOR
    WHERE
        TBL_AVISO.BLN_ATIVO = 1
    ORDER BY
        TBL_AVISO.DT_DATAHORA DESC,
        TBL_AVISO.CHR_ASSUNTO
END

------------------------------------
-- PROCEDURE LOAD_LIST_AUTO_AVISO --
------------------------------------

CREATE PROCEDURE LOAD_LIST_AUTO_AVISO
(
    @P_COD_MORADOR INT
)
AS
BEGIN
    SELECT
        TBL_AVISO.COD_AVISO,
        TBL_AVISO.CHR_ASSUNTO,
        (
            CONVERT(VARCHAR(10), TBL_AVISO.DT_DATAHORA, 103) + ' - ' +
            CONVERT(VARCHAR(5), TBL_AVISO.DT_DATAHORA, 108)
        ) AS DT_DATAHORA,
        (
            CASE TBL_AVISO.BLN_ATIVO
                WHEN 1 THEN 'Sim'                
                ELSE 'Não'
            END
        ) AS CHR_ATIVO
    FROM
        TBL_AVISO
    WHERE
        TBL_AVISO.COD_MORADOR = @P_COD_MORADOR
    ORDER BY
        TBL_AVISO.DT_DATAHORA DESC,
        TBL_AVISO.CHR_ASSUNTO
END

------------------------------
-- PROCEDURE LOAD_REG_AVISO --
------------------------------

CREATE PROCEDURE LOAD_REG_AVISO
(
    @P_COD_AVISO INT
)
AS
BEGIN
    SELECT
        TBL_AVISO.COD_AVISO,
        TBL_MORADOR.COD_MORADOR,
        TBL_MORADOR.CHR_NOME,
        TBL_AVISO.BLN_ATIVO,
        (
            CONVERT(VARCHAR(10), TBL_AVISO.DT_DATAHORA, 103) + ' - ' +
            CONVERT(VARCHAR(5), TBL_AVISO.DT_DATAHORA, 108)
        ) AS DT_DATAHORA,
        TBL_AVISO.CHR_ASSUNTO,
        TBL_AVISO.CHR_AVISO        
    FROM
        TBL_AVISO
		INNER JOIN TBL_MORADOR
			ON TBL_AVISO.COD_MORADOR = TBL_MORADOR.COD_MORADOR
    WHERE
        TBL_AVISO.COD_AVISO = @P_COD_AVISO
END

----------------------------
-- PROCEDURE INSERT_AVISO --
----------------------------

CREATE PROCEDURE INSERT_AVISO
(
    @P_COD_AVISO INT,
    @P_COD_MORADOR INT,
    @P_BLN_ATIVO BIT,
    @P_CHR_ASSUNTO VARCHAR(64),
    @P_CHR_AVISO VARCHAR(4096)    
)
AS
BEGIN
    IF
    (
        SELECT
            COUNT(*)
        FROM
            TBL_AVISO
        WHERE
            TBL_AVISO.COD_AVISO = @P_COD_AVISO
    ) > 0
    BEGIN    
        UPDATE
            TBL_AVISO
        SET
            TBL_AVISO.BLN_ATIVO = @P_BLN_ATIVO,
            TBL_AVISO.CHR_ASSUNTO = @P_CHR_ASSUNTO,
            TBL_AVISO.CHR_AVISO = @P_CHR_AVISO,
            TBL_AVISO.DT_DATAHORA = GETDATE()
        WHERE
            TBL_AVISO.COD_AVISO = @P_COD_AVISO
	END
    ELSE
    BEGIN
        INSERT INTO TBL_AVISO
        (
            TBL_AVISO.COD_MORADOR,
            TBL_AVISO.BLN_ATIVO,
            TBL_AVISO.CHR_ASSUNTO,
            TBL_AVISO.CHR_AVISO,
            TBL_AVISO.DT_DATAHORA
        )
        VALUES
        (
            @P_COD_MORADOR,
            @P_BLN_ATIVO,
            @P_CHR_ASSUNTO,
            @P_CHR_AVISO,
            GETDATE()
        )
    END
END

