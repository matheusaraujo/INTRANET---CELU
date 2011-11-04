---------------------------------------
-- INTRANET CELU
-- \App_Data\Tables\Biblioteca\TBL_AUTOR_OBRA.SQL
-- # 2010-10-02 - Criação
-- Matheus Araújo
-- Valquire Jesus
---------------------------------------

CREATE TABLE TBL_AUTOR_OBRA
(
	COD_AUTOR_OBRA INT IDENTITY,
	CHR_NOME_AUTOR_OBRA VARCHAR(256),
	
	CONSTRAINT PK_AUTOR_OBRA PRIMARY KEY (COD_AUTOR_OBRA),
	CONSTRAINT UN_AUTOR_OBRA UNIQUE (CHR_NOME_AUTOR_OBRA)
)
