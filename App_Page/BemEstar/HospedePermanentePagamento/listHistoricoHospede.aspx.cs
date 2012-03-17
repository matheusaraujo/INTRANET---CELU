/***************************************************
 * INTRANET CELU
 * \App_Page\BemEstar\HospedePermanentePagamento\listHistoricoHospede.aspx.cs
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
using Celu.Library.DataBase;

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
        else
        {
            if (this.hdControl.Value.Length > 6)
            {
                if (this.hdControl.Value.Substring(0, 6).Equals("delete"))
                {
                    CDataBase db = new CDataBase();

                    string id = hdControl.Value.Substring(hdControl.Value.IndexOf(";") + 1);

                    try
                    {
                        db.execute("EXECUTE DELETE_HOSPEDE_PERMANENTE_PAGAMENTO " + id);

                        alert("Registro excluído!");

                        this.slctHospede_SelectedIndexChanged(sender, e);
                    }
                    catch (Exception ex)
                    {
                        alert("Houve um erro!\n" + ex.Message);
                    }
                }
            }
        }

        this.hdControl.Value = "";
    }

    protected void slctHospede_SelectedIndexChanged(object sender, EventArgs e)
    {

        if (!this.slctHospede.SelectedValue.Equals(string.Empty))
        {

            base.setISqlLoad("EXECUTE LOAD_LIST_HOSPEDE_PERMANENTE_PAGAMENTO_HISTORICO_HOSPEDE " + this.slctHospede.SelectedValue.ToString());
            base.setFields("COD_HOSPEDE_PERMANENTE_PAGAMENTO;DT_DATA_INGRESSO;DT_DATA_SAIDA;INT_ANO;INT_MES;FLT_VALOR;DT_DATA_PAGAMENTO;CHR_OBSERVACAO;BLN_ATIVO");
            base.setIdPage(CSecurity.CADASTRO_HOSPEDE_PERMANENTE_PAGAMENTO);

            base.loadPage(this.tblList, false, true, true, "-1", "-1");

            this.ClientScript.RegisterStartupScript(this.GetType(), "adjust",
                "<script type=\"text/javascript\" language=\"javascript\">adjust();</script>", false);
        }

    }
}
