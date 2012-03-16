/***************************************************
 * INTRANET CELU
 * \App_Page\BemEstar\HospedePermanentePagamento\cadHospedePermanentePagamento.aspx.cs
 * Registro de Pagamento de Hóspede Permanente
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

public partial class App_Page_BemEstar_HospedePermanentePagamento_cadHospedePermanentePagamento : Celu.Library.WebPage.CRegPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.setPageElements();

        if (!IsPostBack)
        {
            base.loadPage();          
        }

    }

    public override void setPageElements()
    {
        // id da página
        base.setIdPage(CSecurity.CADASTRO_HOSPEDE_PERMANENTE_PAGAMENTO);

        // select
        base.addSelect(new CSelect(this.slctHospede, "EXECUTE LOAD_LIST_HOSPEDE_PERMANENTE 0", "COD_HOSPEDE_PERMANENTE;CHR_NOME", 0, false, true));
        
        // parâmetros sql
        base.setSqlDefault("HOSPEDE_PERMANENTE_PAGAMENTO");
        base.setIdentity(-1);
        base.setSqlLoad("-1");

        // id por url
        base.setIdUrl("hospedepermanentepagamento");
        
        // campos
        base.addField(new CRegField(this.slctHospede, "COD_HOSPEDE", FieldType.SelectBox, SQLType.Numeric, "Hóspede", true, true, false));
        base.addField(new CRegField(this.slctMes, "INT_MES", FieldType.SelectBox, SQLType.Numeric, "Mês", true, true, false));
        base.addField(new CRegField(this.txtAno, "INT_ANO", FieldType.TextBox, SQLType.Numeric, "Ano", true, true, false));
        base.addField(new CRegField(this.txtValor, "FLT_VALOR", FieldType.TextBox, SQLType.Numeric, "Valor pago", true, true, false));
        base.addField(new CRegField(this.calDtPagamento, "DT_DATA_PAGAMENTO", FieldType.Calendar, SQLType.Date, "Data de pagamento", true, true, false));
        base.addField(new CRegField(this.txtObservacao, "CHR_OBSERVACAO", FieldType.TextBox, SQLType.Charactere, "Observação", true, false, false));
        
        // elementos html
        base.setHtmlElements(this.btnEdit, this.btnSave, this.btnDel, this.btnNew, this.tblCadastro);

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        base.saveClick();
    }
    protected void btnDel_Click(object sender, EventArgs e)
    {
        return;
    }
}
