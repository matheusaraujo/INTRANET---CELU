/***************************************************
 * INTRANET CELU
 * App_Page/Avisos/listAvisos.aspx.cs
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

public partial class App_Page_Avisos_listAvisos : Celu.Library.WebPage.CListPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        base.setISqlLoad("EXECUTE LOAD_LIST_AVISO_GERAL");
        base.setFields("COD_AVISO;CHR_ASSUNTO;CHR_NOME;DT_DATAHORA");
        base.setIdPage(CSecurity.GERAL);

        base.loadPage(this.tblList, true, false, true, "Exibir", 
            "javascript:__openPopUp('detalAviso.aspx?aviso=#0;', 'aviso', true, 400, 600, false, false, 'yes');");

    }
}