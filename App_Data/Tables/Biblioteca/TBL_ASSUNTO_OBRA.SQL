---------------------------------------
-- INTRANET CELU
-- \App_Data\Tables\Biblioteca\TBL_ASSUNTO_OBRA.SQL
-- # 2010-10-02 - Criação
-- Matheus Araújo
-- Valquire Jesus
---------------------------------------

CREATE TABLE TBL_ASSUNTO_OBRA
(
	COD_ASSUNTO_OBRA INT IDENTITY,
	CHR_DESC_ASSUNTO_OBRA VARCHAR(128) NOT NULL,
	
	CONSTRAINT PK_ASSUNTO_OBRA PRIMARY KEY (COD_ASSUNTO_OBRA),
	CONSTRAINT UN_DESC_ASSUNTO_OBRA UNIQUE (CHR_DESC_ASSUNTO_OBRA)
)