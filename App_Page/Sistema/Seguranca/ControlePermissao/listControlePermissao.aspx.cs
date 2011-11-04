/***************************************************
 * INTRANET CELU
 * App_Page/Sistema/Seguranca/ControlePermissao/listControlePermissao.aspx.cs
 * Lista de perfil para permissão
 * # 2011-02-06
 * Matheus Araújo 
 ***************************************************/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Celu.Library.Security;

public partial class App_Page_Sistema_Seguranca_ControlePermissao_listControlePermissao : Celu.Library.WebPage.CListPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        base.setISqlLoad("EXECUTE LOAD_LIST_PERFIL");
        base.setFields("COD_PERFIL;CHR_DESC_PERFIL");
        base.setIdPage(CSecurity.CONTROLE_PERMISSAO);

        base.loadPage(this.tblList, true, false, true, "Permissões", "javascript:window.navigate('cadControlePermissao.aspx?perfil=#0;');");

    }
}

