﻿---------------------------------------
-- INTRANET CELU
-- \App_Data\Tables\BemEstar\TBL_HOSPEDE_TEMPORARIO.SQL
-- # 2012-03-22 - Criação
-- Matheus Araújo
---------------------------------------

CREATE TABLE TBL_HOSPEDE_TEMPORARIO
(
    COD_HOSPEDE_TEMPORARIO INT IDENTITY,
    DT_DATA_INICIO SMALLDATETIME,
    DT_DATA_FIM SMALLDATETIME,
    CHR_EVENTO VARCHAR(256),
    CHR_RESPONSAVEL VARCHAR(256),
    CHR_CONTATO VARCHAR(256),
    INT_QUANTIDADE_PESSOAS INT,
    INT_QUANTIDADE_PERNOITE INT,
    FLT_VALOR NUMERIC(10,2),
    CHR_SITUACAO VARCHAR(256),
    CHR_OBSERVACAO VARCHAR(256),
    
    CONSTRAINT PK_HOSPEDE_TEMPORARIO PRIMARY KEY (COD_HOSPEDE_TEMPORARIO)
)