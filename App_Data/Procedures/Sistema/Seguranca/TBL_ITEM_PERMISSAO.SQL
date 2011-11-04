---------------------------------------
-- INTRANET CELU
-- \App_Data\Procedures\Sistema\Seguranca\TBL_ITEM_PERMISSAO.SQL
-- # 2011-02-05 - Criação
-- Matheus Araújo
---------------------------------------

----------------------------------------
-- PROCEDURE LOAD_LIST_ITEM_PERMISSAO --
----------------------------------------

CREATE PROCEDURE LOAD_LIST_ITEM_PERMISSAO
AS
BEGIN
    SELECT
        TBL_ITEM_PERMISSAO.COD_ITEM_PERMISSAO,
        TBL_ITEM_PERMISSAO.CHR_DESC_ITEM_PERMISSAO
    FROM
        TBL_ITEM_PERMISSAO
    ORDER BY
        TBL_ITEM_PERMISSAO.COD_ITEM_PERMISSAO
END

-----------------------------------------------
-- PROCEDURE LOAD_LIST_ITEM_PERMISSAO_PERFIL --
-----------------------------------------------

CREATE PROCEDURE LOAD_LIST_ITEM_PERMISSAO_PERFIL
(
    @P_COD_PERFIL INT
)
AS
BEGIN
    SELECT
        TBL_ITEM_PERMISSAO.COD_ITEM_PERMISSAO,
        TBL_ITEM_PERMISSAO.CHR_DESC_ITEM_PERMISSAO,
		(
			SELECT
				COUNT(*)
			FROM
				TBL_PERMISSAO
			WHERE
				TBL_PERMISSAO.COD_ITEM_PERMISSAO = TBL_ITEM_PERMISSAO.COD_ITEM_PERMISSAO AND
				TBL_PERMISSAO.COD_PERFIL = @P_COD_PERFIL
		) AS COD_PERFIL        
    FROM
        TBL_ITEM_PERMISSAO        
    ORDER BY
        TBL_ITEM_PERMISSAO.COD_ITEM_PERMISSAO
END