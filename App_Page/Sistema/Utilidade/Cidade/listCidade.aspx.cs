/***************************************************
 * INTRANET CELU
 * App_Page/Sistema/Utilidade/Cidade/listCidade.aspx.cs
 * Lista de curso
 * # 2011-02-05
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

public partial class App_Page_Sistema_Utilidade_Cidade_listCidade : Celu.Library.WebPage.CListPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            this.DropDownList_SelectedIndexChanged(sender, e);
        }
        
    }

    protected void DropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        base.setISqlLoad("EXECUTE LOAD_LIST_CIDADE_ESTADO '" + this.DropDownList.SelectedItem.Text + "'");
        base.setFields("COD_CIDADE;CHR_CIDADE");
        base.setIdPage(CSecurity.CADASTRO_CIDADE);

        base.loadPage(this.tblList, true, false, true, "Editar", "javascript:window.navigate('cadCidade.aspx?cidade=#0;');");
    }

}
