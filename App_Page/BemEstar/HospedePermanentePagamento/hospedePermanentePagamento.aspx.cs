/***************************************************
 * INTRANET CELU
 * \App_Page\BemEstar\HospedePermanentePagamento\chospedePermanentePagamento.aspx.cs
 * Página geral para controle de pagamento de hóspede
 * # 2012-03-16
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

public partial class App_Page_BemEstar_HospedePermanentePagamento_hospedePermanentePagamento : Celu.Library.WebPage.CPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            base.setIdPage(CSecurity.CADASTRO_HOSPEDE_PERMANENTE_PAGAMENTO);
            base.loadPage();
        }

    }
}
