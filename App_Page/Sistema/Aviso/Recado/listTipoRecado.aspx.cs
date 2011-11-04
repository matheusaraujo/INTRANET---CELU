/***************************************************
 * INTRANET CELU
 * App_Page/Sistema/Aviso/Recado/listTipoRecado.aspx.cs
 * Lista de tipo de recado
 * # 2011-04-09
 * Matheus Araújo 
 ***************************************************/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Celu.Library.Security;

public partial class App_Page_Sistema_Aviso_Recado_listTipoRecado : Celu.Library.WebPage.CListPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        base.setISqlLoad("EXECUTE LOAD_LIST_TIPO_RECADO");
        base.setFields("COD_TIPO_RECADO;CHR_DESC_TIPO_RECADO");
        base.setIdPage(CSecurity.CADASTRO_TIPO_RECADO);

        base.loadPage(this.tblList, true, false, true, "Editar", "javascript:window.navigate('cadTipoRecado.aspx?tiporecado=#0;');");

    }
}

