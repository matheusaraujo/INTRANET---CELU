/***************************************************
 * INTRANET CELU
 * App_Page/Biblioteca/TipoObra/listTipoObra.aspx.cs
 * Lista de tipo de obra
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

public partial class App_Page_Biblioteca_TipoObra_listTipoObra : Celu.Library.WebPage.CListPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        base.setISqlLoad("EXECUTE LOAD_LIST_TIPO_OBRA");
        base.setFields("COD_TIPO_OBRA;CHR_DESC_TIPO_OBRA");
        base.setIdPage(CSecurity.CADASTRO_TIPO_OBRA);

        base.loadPage(this.tblList, true, false, true, "Editar", "javascript:window.navigate('cadTipoObra.aspx?tipoobra=#0;');");

    }
}