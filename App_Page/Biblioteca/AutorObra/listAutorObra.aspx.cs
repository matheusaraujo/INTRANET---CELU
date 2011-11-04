/***************************************************
 * INTRANET CELU
 * App_Page/Biblioteca/AutorObra/listAutorObra.aspx.cs
 * Lista de autor
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

public partial class App_Page_Biblioteca_AutorObra_listAutorObra : Celu.Library.WebPage.CListPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        base.setISqlLoad("EXECUTE LOAD_LIST_AUTOR_OBRA");
        base.setFields("COD_AUTOR_OBRA;CHR_NOME_AUTOR_OBRA");
        base.setIdPage(CSecurity.CADASTRO_AUTOR_OBRA);

        base.loadPage(this.tblList, true, false, true, "Editar", "javascript:window.navigate('cadAutorObra.aspx?autorobra=#0;');");

    }
}