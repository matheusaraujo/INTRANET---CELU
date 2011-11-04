/***************************************************
 * INTRANET CELU
 * App_Page/Sistema/Utilidade/Curso/listCurso.aspx.cs
 * Lista de curso
 * # 2011-02-05
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

public partial class App_Page_Sistema_Utilidade_Curso_listCurso : Celu.Library.WebPage.CListPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        base.setISqlLoad("EXECUTE LOAD_LIST_CURSO");
        base.setFields("COD_CURSO;CHR_DESC_CURSO");
        base.setIdPage(CSecurity.CADASTRO_CURSO);

        base.loadPage(this.tblList, true, false, true, "Editar", "javascript:window.navigate('cadCurso.aspx?curso=#0;');");

    }
}
