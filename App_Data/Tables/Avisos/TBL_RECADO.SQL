﻿---------------------------------------
-- INTRANET CELU
-- \App_Data\Tables\Aviso\TBL_RECADO.SQL
-- # 2011-04-09 - Criação
-- Matheus Araújo
---------------------------------------

CREATE TABLE TBL_RECADO
(
	COD_RECADO INT IDENTITY,
	COD_MORADOR INT,
	COD_TIPO_RECADO INT,
	DT_DATAHORA SMALLDATETIME,
	BLN_OCULTO BIT,
	CHR_RECADO VARCHAR(2048),
	
	CONSTRAINT PK_RECADO PRIMARY KEY (COD_RECADO),
	CONSTRAINT FK_RECADO_MORADOR FOREIGN KEY (COD_MORADOR) REFERENCES TBL_MORADOR (COD_MORADOR),
	CONSTRAINT FK_RECADO_TIPO_RECADO FOREIGN KEY (COD_TIPO_RECADO) REFERENCES TBL_TIPO_RECADO (COD_TIPO_RECADO)
)