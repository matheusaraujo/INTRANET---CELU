/***************************************************
 * INTRANET CELU
 * App_Page/Sistema/Seguranca/Perfil/listPerfil.aspx.cs
 * Lista de perfil
 * # 2010-10-30
 * Matheus Araújo 
 ***************************************************/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Celu.Library.Security;

public partial class App_Page_Sistema_Seguranca_listPerfil : Celu.Library.WebPage.CListPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        base.setISqlLoad("EXECUTE LOAD_LIST_PERFIL");
        base.setFields("COD_PERFIL;CHR_DESC_PERFIL");
        base.setIdPage(CSecurity.CADASTRO_PERFIL);

        base.loadPage(this.tblList, true, false, true, "Editar", "javascript:window.navigate('cadPerfil.aspx?perfil=#0;');");

    }
}

