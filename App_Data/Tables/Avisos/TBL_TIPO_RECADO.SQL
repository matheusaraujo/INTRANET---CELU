---------------------------------------
-- INTRANET CELU
-- \App_Data\Tables\Aviso\TBL_TIPO_RECADO.SQL
-- # 2011-04-09 - Criação
-- Matheus Araújo
---------------------------------------

CREATE TABLE TBL_TIPO_RECADO
(
	COD_TIPO_RECADO INT IDENTITY,
	CHR_DESC_TIPO_RECADO VARCHAR(256),
	
	CONSTRAINT PK_TIPO_RECADO PRIMARY KEY (COD_TIPO_RECADO),
	CONSTRAINT UN_TIPO_RECADO UNIQUE (CHR_DESC_TIPO_RECADO)
)