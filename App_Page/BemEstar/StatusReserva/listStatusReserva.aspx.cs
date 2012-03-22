/***************************************************
 * INTRANET CELU
 * App_Page/BemEstar/StatusReserva/listStatusReserva.aspx.cs
 * Lista de status de reserva
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

public partial class App_Page_BemEstar_StatusReserva_listStatusReserva : Celu.Library.WebPage.CListPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        base.setISqlLoad("EXECUTE LOAD_LIST_STATUS_RESERVA");
        base.setFields("COD_STATUS_RESERVA;CHR_STATUS_RESERVA");
        base.setIdPage(CSecurity.CADASTRO_STATUS_RESERVA);

        base.loadPage(this.tblList, true, false, true, "Editar", "javascript:window.navigate('cadStatusReserva.aspx?statusreserva=#0;');");

    }
}

