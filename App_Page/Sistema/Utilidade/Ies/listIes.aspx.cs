/***************************************************
 * INTRANET CELU
 * App_Page/Sistema/Utilidade/Ies/listIes.aspx.cs
 * Lista de Instituições
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

public partial class App_Page_Sistema_Utilidade_Ies_listIes : Celu.Library.WebPage.CListPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        base.setISqlLoad("EXECUTE LOAD_LIST_IES");
        base.setFields("COD_IES;CHR_DESC_IES");
        base.setIdPage(CSecurity.CADASTRO_IES);

        base.loadPage(this.tblList, true, false, true, "Editar", "javascript:window.navigate('cadIes.aspx?ies=#0;');");

    }
}

