/***************************************************
 * INTRANET CELU
 * App_Page/Diretoria/Morador/listMorador.aspx.cs
 * Lista de moradores
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

public partial class App_Page_Diretoria_Morador_listMorador : Celu.Library.WebPage.CListPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        base.setISqlLoad("EXECUTE LOAD_LIST_MORADOR");
        base.setFields("COD_MORADOR;CHR_NOME;CHR_DESC_PERFIL");
        base.setIdPage(CSecurity.CADASTRO_MORADOR);

        base.loadPage(this.tblList, true, false, true, "Editar", "javascript:window.navigate('cadMorador.aspx?morador=#0;');");

    }
}