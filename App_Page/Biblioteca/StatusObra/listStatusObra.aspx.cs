/***************************************************
 * INTRANET CELU
 * App_Page/Biblioteca/StatusObra/listStatusObra.aspx.cs
 * Lista de status de obra
 * # 2011-02-08
 * Matheus Araújo 
 ***************************************************/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Celu.Library.Security;
using Celu.Library.WebPage;

public partial class App_Page_Biblioteca_StatusObra_listStatusObra : Celu.Library.WebPage.CListPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        base.setISqlLoad("EXECUTE LOAD_LIST_STATUS_OBRA");
        base.setFields("COD_STATUS_OBRA;CHR_DESC_STATUS_OBRA");
        base.setIdPage(CSecurity.CADASTRO_STATUS_OBRA);

        base.loadPage(this.tblList, true, false, true, "Editar", "javascript:window.navigate('cadStatusObra.aspx?statusobra=#0;');");

    }
}