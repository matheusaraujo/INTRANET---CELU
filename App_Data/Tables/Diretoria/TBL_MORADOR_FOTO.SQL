---------------------------------------
-- INTRANET CELU
-- \App_Data\Tables\Diretoria\TBL_MORADOR_FOTO.SQL
-- # 2011-04-16 - Criação
-- Matheus Araújo
---------------------------------------

CREATE TABLE TBL_MORADOR_FOTO
(
	COD_MORADOR INT,	
	MIME VARCHAR(50),
	imagem VARBINARY(MAX),
	
	CONSTRAINT PK_MORADOR_FOTO PRIMARY KEY (COD_MORADOR),
	CONSTRAINT FK_MORADOR_FOTO FOREIGN KEY (COD_MORADOR) REFERENCES TBL_MORADOR (COD_MORADOR)
)