/***************************************************
 * INTRANET CELU
 * App_Page/Common/main.aspx.cs
 * Página inicial
 * # 2010-10-30
 * Matheus Araújo 
 ***************************************************/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Celu.Library.WebPage;
using Celu.Library.Security;

public partial class App_Page_Common_main : Celu.Library.WebPage.CPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        // ID da página
        setIdPage(CSecurity.GERAL);

        if (!IsPostBack)
        {
            if (base.loadPage())
            {
                this.loadPage();
            }
        }


    }

    public override Boolean loadPage()
    {

        // Carrega os aniversários
        CListPage list = new CListPage();

        list.setISqlLoad("EXECUTE LOAD_LIST_ANIVERSARIO_MES");
        list.setFields("COD_MORADOR;CHR_NOME;CHR_ANIVERSARIO");
        list.setIdPage(this.getIdPage());

        list.loadPage(this.tblAniversario, true, false, true, "Detalhes",
            "javascript:__openPopUp('detalMorador.aspx?morador=#0;', 'morador', true, 400, 600, false, false, 'yes');");

        // Carrega avisos
        list = new CListPage();

        list.setISqlLoad("EXECUTE LOAD_LIST_AVISO_TOP");
        list.setFields("COD_AVISO;CHR_ASSUNTO;CHR_NOME;DT_DATAHORA");
        list.setIdPage(this.getIdPage());

        list.loadPage(this.tblAvisos, true, false, true, "Exibir",
            "javascript:__openPopUp('../Avisos/detalAviso.aspx?aviso=#0;', 'aviso', true, 400, 600, false, false, 'yes');");

        return true;
    }
}