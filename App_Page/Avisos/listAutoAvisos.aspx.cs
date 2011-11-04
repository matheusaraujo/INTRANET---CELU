/***************************************************
 * INTRANET CELU
 * App_Page/Avisos/listAutoAvisos.aspx.cs
 * Lista de avisos
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

public partial class App_Page_Avisos_listAutoAvisos : Celu.Library.WebPage.CListPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        base.setISqlLoad("EXECUTE LOAD_LIST_AUTO_AVISO " + ((CLogin)Session["login"]).getCod());
        base.setFields("COD_AVISO;CHR_ASSUNTO;DT_DATAHORA;CHR_ATIVO");
        base.setIdPage(CSecurity.CADASTRO_AVISO);

        base.loadPage(this.tblList, true, false, true, "Editar", "javascript:window.navigate('cadAviso.aspx?aviso=#0;');");
    }
}
