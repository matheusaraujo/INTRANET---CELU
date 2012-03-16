/***************************************************
 * INTRANET CELU
 * \App_Page\BemEstar\PersonaNonGrata\listPersonaNonGrata.aspx.cs
 * Lista de Persona Non Grata
 * # 2012-03-01
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

public partial class App_Page_BemEstar_HospedePermanentePagamento_listMesAtual : Celu.Library.WebPage.CListPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        base.setISqlLoad("EXECUTE LOAD_LIST_HOSPEDE_PERMANENTE_PAGAMENTO_MES_ATUAL");
        base.setFields("CHR_NOME;INT_DIA_VENCIMENTO;CHR_PAGO");
        base.setIdPage(CSecurity.CADASTRO_HOSPEDE_PERMANENTE_PAGAMENTO);

        base.loadPage(this.tblList, false, true, true, "-1", "-1");

        this.ClientScript.RegisterStartupScript(this.GetType(), "adjust",
            "<script type=\"text/javascript\" language=\"javascript\">adjust();</script>", false);

    }

}
