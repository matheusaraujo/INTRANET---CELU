---------------------------------------
-- INTRANET CELU
-- \App_Data\Procedures\Sistema\Utilidade\TBL_CURSO.SQL
-- # 2010-12-17 - Criação
-- Matheus Araújo
---------------------------------------

--------------------------------
-- PROCEUDURE LOAD_LIST_CURSO --
--------------------------------

CREATE PROCEDURE LOAD_LIST_CURSO
AS
BEGIN
	SELECT
		TBL_CURSO.COD_CURSO,
		TBL_CURSO.CHR_DESC_CURSO		
	FROM
		TBL_CURSO		
	ORDER BY
		TBL_CURSO.CHR_DESC_CURSO
END

------------------------------
-- PROCEDURE LOAD_REG_CURSO --
------------------------------

CREATE PROCEDURE LOAD_REG_CURSO
(
    @P_COD_CURSO INT
)
AS
BEGIN
    SELECT
		TBL_CURSO.COD_CURSO,
		TBL_CURSO.CHR_DESC_CURSO		
	FROM
		TBL_CURSO		
	WHERE
	    TBL_CURSO.COD_CURSO = @P_COD_CURSO
END

-----------------------------------
-- PROCEDURE VERIFY_INSERT_CURSO --
-----------------------------------

CREATE PROCEDURE VERIFY_INSERT_CURSO
(
    @P_COD_CURSO INT,
    @P_CHR_DESC_CURSO VARCHAR(128)
)
AS
BEGIN
    IF 
    (
        SELECT
            COUNT(*)
        FROM
            TBL_CURSO
        WHERE
            TBL_CURSO.COD_CURSO <> @P_COD_CURSO AND
            TBL_CURSO.CHR_DESC_CURSO = @P_CHR_DESC_CURSO
    ) 
    > 0
    BEGIN
        SELECT 'O curso já foi cadastrado!' AS P_CHR_MSG_ERRO
    END
    ELSE
    BEGIN
        SELECT '' AS P_CHR_MSG_ERRO
    END
END

----------------------------
-- PROCEDURE INSERT_CURSO --
----------------------------

CREATE PROCEDURE INSERT_CURSO
(
    @P_COD_CURSO INT,
    @P_CHR_DESC_CURSO VARCHAR(128)
)
AS
BEGIN
    IF 
    (
        SELECT
            COUNT(*)
        FROM
            TBL_CURSO
        WHERE
            TBL_CURSO.COD_CURSO = @P_COD_CURSO            
    ) 
    > 0
    BEGIN
        UPDATE
            TBL_CURSO
        SET
            TBL_CURSO.CHR_DESC_CURSO = @P_CHR_DESC_CURSO
        WHERE
            TBL_CURSO.COD_CURSO = @P_COD_CURSO
    END
    ELSE
    BEGIN
        INSERT INTO TBL_CURSO
        (
            TBL_CURSO.CHR_DESC_CURSO
        )
        VALUES
        (
            @P_CHR_DESC_CURSO
        )
    END
END

----------------------------
-- PROCEDURE DELETE_CURSO --
----------------------------

CREATE PROCEDURE DELETE_CURSO
(
    @P_COD_CURSO INT
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
            TBL_MORADOR.COD_CURSO = @P_COD_CURSO
    )
    > 0
    BEGIN    
        SELECT 'Existe(m) morador(es) nesse curso!' AS P_CHR_MSG_ERRO    
    END
    ELSE
    BEGIN
        SELECT '' AS P_CHR_MSG_ERRO
        DELETE
            TBL_CURSO
        WHERE
            TBL_CURSO.COD_CURSO = @P_COD_CURSO
    END
END
