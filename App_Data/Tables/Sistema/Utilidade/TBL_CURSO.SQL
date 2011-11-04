---------------------------------------
-- INTRANET CELU
-- \App_Data\Tables\Sistema\Utilidade\TBL_CURSO.SQL
-- # 2011-02-05 - Criação
-- Matheus Araújo
---------------------------------------

CREATE TABLE TBL_CURSO
(
	COD_CURSO INT IDENTITY,
	CHR_DESC_CURSO VARCHAR(128) NOT NULL,
	
	CONSTRAINT PK_CURSO PRIMARY KEY (COD_CURSO),
	CONSTRAINT UN_DESC_CURSO UNIQUE (CHR_DESC_CURSO)
)
