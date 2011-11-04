/***************************************************
 * INTRANET CELU
 * App_Page/Sistema/Utilidade/StatusMorador/listStatusMorador.aspx.cs
 * Lista de status de moradores
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

public partial class App_Page_Sistema_Utilidade_StatusMorador_listStatusMorador : Celu.Library.WebPage.CListPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        base.setISqlLoad("EXECUTE LOAD_LIST_STATUS_MORADOR");
        base.setFields("COD_STATUS_MORADOR;CHR_DESC_STATUS_MORADOR");
        base.setIdPage(CSecurity.CADASTRO_STATUS_MORADOR);

        base.loadPage(this.tblList, true, false, true, "Editar", "javascript:window.navigate('cadStatusMorador.aspx?statusmorador=#0;');");

    }
}
