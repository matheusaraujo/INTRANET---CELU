/***************************************************
 * INTRANET CELU
 * App_Page/Biblioteca/AssuntoObra/listAssuntoObra.aspx.cs
 * Lista de assunto por obra
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

public partial class App_Page_Biblioteca_AssuntoObra_listAssuntoObra : Celu.Library.WebPage.CListPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        base.setISqlLoad("EXECUTE LOAD_LIST_ASSUNTO_OBRA");
        base.setFields("COD_ASSUNTO_OBRA;CHR_DESC_ASSUNTO_OBRA");
        base.setIdPage(CSecurity.CADASTRO_ASSUNTO_OBRA);

        base.loadPage(this.tblList, true, false, true, "Editar", "javascript:window.navigate('cadAssuntoObra.aspx?assuntoobra=#0;');");

    }
}