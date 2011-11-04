/***************************************************
 * INTRANET CELU
 * App_Page/Biblioteca/Consulta/listObra.aspx.cs
 * Consulta do Acervo
 * # 2011-02-08
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

public partial class App_Page_Biblioteca_Consulta_listObra : Celu.Library.WebPage.CListPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        base.setIdPage(CSecurity.GERAL);

        if (!IsPostBack)
        {   
            base.loadPage();
        }
    }

    public override Boolean loadPage()
    {
        if (this.txtTexto.Text.Length < 3)
        {
            alert("Digite pelo menos 3 caracteres para efetuar a busca!");
            return false;
        }
        else
        {

            base.setISqlLoad("EXECUTE LOAD_LIST_OBRA_CONSULTA " +
                this.DropDownPesquisaPor.SelectedValue + ",'" +
                this.txtTexto.Text + "'");
            base.setFields("COD_OBRA;CHR_STATUS;CHR_CHAMADA;CHR_TITULO;CHR_NOME_AUTOR_OBRA");

            return base.loadPage(this.tblList, true, false, true, "Detalhes",
                "javascript:__openPopUp('detalObra.aspx?obra=#0;', 'obra', true, 400, 600, false, false, 'yes');");
        }
    }
    
    protected void btnFind_Click(object sender, EventArgs e)
    {
        this.loadPage();
    }
}
