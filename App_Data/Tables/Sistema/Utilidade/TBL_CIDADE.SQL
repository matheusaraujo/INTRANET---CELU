---------------------------------------
-- INTRANET CELU
-- \App_Data\Tables\Sistema\Utilidade\TBL_CIDADE.SQL
-- # 2011-02-05 - Criação
-- Matheus Araújo
---------------------------------------

CREATE TABLE TBL_CIDADE
(
	COD_CIDADE INT IDENTITY,
	CHR_ESTADO VARCHAR(2) NOT NULL,
	CHR_CIDADE VARCHAR(128) NOT NULL,
	
	CONSTRAINT PK_CIDADE PRIMARY KEY (COD_CIDADE),
	CONSTRAINT UN_CIDADE UNIQUE (CHR_ESTADO, CHR_CIDADE)	
)