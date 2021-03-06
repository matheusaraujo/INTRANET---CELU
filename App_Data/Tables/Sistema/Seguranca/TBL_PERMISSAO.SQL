﻿---------------------------------------
-- INTRANET CELU
-- \App_Data\Tables\Sistema\Seguranca\TBL_PERMISSAO.SQL
-- # 2010-11-07 - Criação
-- Matheus Araújo
---------------------------------------

CREATE TABLE TBL_PERMISSAO
(
	COD_ITEM_PERMISSAO INT,	
	COD_PERFIL INT,
	
	CONSTRAINT FK_PERMISSAO_ITEM_PERMISSAO FOREIGN KEY (COD_ITEM_PERMISSAO) REFERENCES TBL_ITEM_PERMISSAO (COD_ITEM_PERMISSAO),
	CONSTRAINT FK_PERMISSAO_PERFIL FOREIGN KEY (COD_PERFIL) REFERENCES TBL_PERFIL (COD_PERFIL)
)