/***************************************************
 * INTRANET CELU
 * \App_Page\BemEstar\Reserva\reserva.aspx.cs
 * Página geral para reserva de espaço físico
 * # 2012-03-21
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

public partial class App_Page_BemEstar_Reserva_reserva : Celu.Library.WebPage.CPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            base.setIdPage(CSecurity.CONTROLE_RESERVA);
            base.loadPage();
        }

    }
}