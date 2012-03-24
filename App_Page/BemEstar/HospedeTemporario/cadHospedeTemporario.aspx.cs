/***************************************************
 * INTRANET CELU
 * \App_Page\BemEstar\HospedeTemporario\cadHospedeTemporario.aspx.cs
 * Cadastro de Hóspede Temporário
 * # 2012-03-23
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

public partial class App_Page_BemEstar_HospedeTemporario_cadHospedeTemporario : Celu.Library.WebPage.CRegPage
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
        base.setIdPage(CSecurity.CONTROLE_HOSPEDETE_TEMPORARIO);

        // parâmetros sql
        base.setSqlDefault("HOSPEDE_TEMPORARIO");
        base.setIdentity(0);

        // id por url
        base.setIdUrl("hospedetemporario");
        base.setSqlVerifySave("-1");

        // campos
        base.addField(new CRegField(this.txtCodigo, "COD_HOSPEDE_PERMANENTE", FieldType.TextBox, SQLType.Numeric, "Código", true, false, true));
        base.addField(new CRegField(this.calDtIngresso, "DT_DATA_ENTRADA", FieldType.Calendar, SQLType.Date, "Data de entrada", true, false, false));
        base.addField(new CRegField(this.calDtSaida, "DT_DATA_SAIDA", FieldType.Calendar, SQLType.Date, "Data de saída", true, false, false));
        base.addField(new CRegField(this.txtEvento, "CHR_EVENTO", FieldType.TextBox, SQLType.Charactere, "Evento", true, true, false));
        base.addField(new CRegField(this.txtResponsavel, "CHR_RESPONSAVEL", FieldType.TextBox, SQLType.Charactere, "Responsável", true, true, false));
        base.addField(new CRegField(this.txtContato, "CHR_CONTATO", FieldType.TextBox, SQLType.Charactere, "Contato", true, true, false));
        base.addField(new CRegField(this.txtQtdPessoas, "INT_QUANTIDADE_PESSOAS", FieldType.TextBox, SQLType.Numeric, "Quantidade de Pessoas", true, true, false));
        base.addField(new CRegField(this.txtQtdPernoites, "INT_QUANTIDADE_PERNOITE", FieldType.TextBox, SQLType.Numeric, "Quantidade de pernoites", true, true, false));
        base.addField(new CRegField(this.txtValor, "FLT_VALOR", FieldType.TextBox, SQLType.Numeric, "Valor", true, true, false));
        base.addField(new CRegField(this.txtSituacao, "CHR_SITUACAO", FieldType.TextBox, SQLType.Charactere, "Situação", true, false, false));
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
        base.delClick();
    }
}
