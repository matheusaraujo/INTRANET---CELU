/***************************************************
 * INTRANET CELU
 * App_Page/Avisos/Recado/meusRecados.aspx.cs
 * Lista de avisos
 * # 2011-04-09
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


public partial class App_Page_Avisos_Recado_meusRecados : Celu.Library.WebPage.CListPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        base.setISqlLoad("EXECUTE LOAD_LIST_MEUS_RECADOS " + ((CLogin)(Session["login"])).getCod());
        base.setFields("COD_RECADO;CHR_DESC_TIPO_RECADO;DT_DATAHORA");
        base.setIdPage(CSecurity.GERAL);

        base.loadPage(this.tblList, true, false, true, "Exibir", 
            "javascript:__openPopUp('viewRecado.aspx?recado=#0;', 'aviso', true, 400, 600, false, false, 'yes');");

    }
}

