---------------------------------------
-- INTRANET CELU
-- \App_Data\Tables\Sistema\Utilidade\TBL_IES.SQL
-- # 2011-02-05 - Criação
-- Matheus Araújo
---------------------------------------

CREATE TABLE TBL_IES
(
	COD_IES INT IDENTITY,
	CHR_DESC_IES VARCHAR(128) NOT NULL,
	
	CONSTRAINT PK_IES PRIMARY KEY (COD_IES),
	CONSTRAINT UN_DESC_IES UNIQUE (CHR_DESC_IES)
)
