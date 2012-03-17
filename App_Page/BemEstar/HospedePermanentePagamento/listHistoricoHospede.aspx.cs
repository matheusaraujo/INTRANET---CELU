/***************************************************
 * INTRANET CELU
 * \App_Page\BemEstar\PersonaNonGrata\listHistoricoHospede.aspx.cs
 * Lista de controle de histórico por hóspede
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

public partial class App_Page_BemEstar_HospedePermanentePagamento_listHistoricoHospede : Celu.Library.WebPage.CListPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            base.setIdPage(CSecurity.CADASTRO_HOSPEDE_PERMANENTE_PAGAMENTO);
            base.addSelect(new CSelect(this.slctHospede, "EXECUTE LOAD_LIST_HOSPEDE_PERMANENTE 1", "COD_HOSPEDE_PERMANENTE;CHR_NOME", 0, false, true));
            base.loadPage();
        }

    }
}
