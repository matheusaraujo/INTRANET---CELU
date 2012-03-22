/***************************************************
 * INTRANET CELU
 * App_Page/BemEstar/EspacoReserva/listEspacoReserva.aspx.cs
 * Lista de espaço de reserva
 * # 2012-03-21
 * Matheus Araújo 
 ***************************************************/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Celu.Library.Security;

public partial class App_Page_BemEstar_EspacoReserva_listEspacoReserva : Celu.Library.WebPage.CListPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        base.setISqlLoad("EXECUTE LOAD_LIST_ESPACO_RESERVA");
        base.setFields("COD_ESPACO_RESERVA;CHR_NOME_ESPACO_RESERVA");
        base.setIdPage(CSecurity.CADASTRO_ESPACO_RESERVA);

        base.loadPage(this.tblList, true, false, true, "Editar", "javascript:window.navigate('cadEspacoReserva.aspx?espacoreserva=#0;');");

    }
}

