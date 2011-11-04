/***************************************************
 * INTRANET CELU
 * App_Page/Common/listComumMorador.aspx.cs
 * Lista de moradores
 * # 2011-02-07
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


public partial class App_Page_Common_listComumMorador : Celu.Library.WebPage.CListPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        base.setISqlLoad("EXECUTE LOAD_LIST_MORADOR");
        base.setFields("COD_MORADOR;CHR_NOME;CHR_DESC_PERFIL");
        base.setIdPage(CSecurity.GERAL);

        base.loadPage(this.tblList, true, false, true, "Detalhes",
            "javascript:__openPopUp('detalMorador.aspx?morador=#0;', 'morador', true, 600, 800, false, false, 'yes');");

    }
}
