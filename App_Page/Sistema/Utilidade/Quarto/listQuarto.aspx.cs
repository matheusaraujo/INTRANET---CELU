/***************************************************
 * INTRANET CELU
 * App_Page/Sistema/Utilidade/Quarto/listQuarto.aspx.cs
 * Lista de quarto
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

public partial class App_Page_Sistema_Utilidade_Quarto_listQuarto : Celu.Library.WebPage.CListPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        base.setISqlLoad("EXECUTE LOAD_LIST_QUARTO");
        base.setFields("COD_QUARTO;CHR_DESC_QUARTO");
        base.setIdPage(CSecurity.CADASTRO_QUARTO);

        base.loadPage(this.tblList, true, false, true, "Editar", "javascript:window.navigate('cadQuarto.aspx?quarto=#0;');");

    }
}
