---------------------------------------
-- INTRANET CELU
-- \App_Data\Tables\Sistema\Utilidade\TBL_QUARTO.SQL
-- # 2011-02-05 - Criação
-- Matheus Araújo
---------------------------------------

CREATE TABLE TBL_QUARTO
(
	COD_QUARTO INT IDENTITY,
	CHR_DESC_QUARTO VARCHAR(128) NOT NULL,
	
	CONSTRAINT PK_QUARTO PRIMARY KEY (COD_QUARTO),
	CONSTRAINT UN_DESC_QUARTO UNIQUE (CHR_DESC_QUARTO)
)
