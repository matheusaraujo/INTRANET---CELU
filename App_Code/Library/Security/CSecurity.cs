using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/***************************************************
 * INTRANET CELU
 * App_Code/Library/Security/CSecurity.cs
 * Armazena constantes para segurança
 * # 2010-11-07
 * Matheus Araújo 
 ***************************************************/
namespace Celu.Library.Security
{
    public class CSecurity
    {

        public const String GERAL = "1000";

        public const String CADASTRO_MORADOR = "1001";
        public const String CADASTRO_AVISO = "1002";

        public const String CADASTRO_STATUS_MORADOR = "2001";
        public const String CADASTRO_PERFIL = "2002";
        public const String CADASTRO_IES = "2003";
        public const String CADASTRO_CURSO = "2004";
        public const String CADASTRO_CIDADE = "2005";
        public const String CADASTRO_QUARTO = "2006";
        public const String CONTROLE_PERMISSAO = "2007";
        public const String CADASTRO_TIPO_RECADO = "2008";

        public const String CADASTRO_ASSUNTO_OBRA = "3001";
        public const String CADASTRO_AUTOR_OBRA = "3002";
        public const String CADASTRO_STATUS_OBRA = "3003";
        public const String CADASTRO_TIPO_OBRA = "3004";
        public const String CADASTRO_OBRA = "3005";
        public const String CONTROLE_EMPRESTIMO = "3006";

        public const String CADASTRO_PERSONA_NON_GRATA = "4001";

    }
}