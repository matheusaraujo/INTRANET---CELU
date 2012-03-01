/***************************************************
 * INTRANET CELU
 * \App_Page\BemEstar\PersonaNonGrata\cadPersonaNonGrata.aspx.cs
 * Cadastro de Persona Non Grata
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

public partial class App_Page_BemEstar_PersonaNonGrata_cadPersonaNonGrata : Celu.Library.WebPage.CRegPage
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
        base.setIdPage(CSecurity.CADASTRO_PERSONA_NON_GRATA);

        // parâmetros sql
        base.setSqlDefault("PERSONA_NON_GRATA");
        base.setIdentity(0);

        // id por url
        base.setIdUrl("personanongrata");
        base.setSqlVerifySave("-1");

        // campos
        base.addField(new CRegField(this.txtCodigo, "COD_PERSONA_NON_GRATA", FieldType.TextBox, SQLType.Numeric, "Código", true, false, true));
        base.addField(new CRegField(this.calDtEntrada, "DT_DATA_ENTRADA", FieldType.Calendar, SQLType.Date, "Data de Entrada", true, false, false));
        base.addField(new CRegField(this.calDtSaida, "DT_DATA_SAIDA", FieldType.Calendar, SQLType.Date, "Data de Saída", true, false, false));
        base.addField(new CRegField(this.txtQuarto, "CHR_QUARTO", FieldType.TextBox, SQLType.Charactere, "Quarto", true, false, false));
        base.addField(new CRegField(this.txtNome, "CHR_NOME", FieldType.TextBox, SQLType.Charactere, "Nome", true, true, false));
        base.addField(new CRegField(this.txtPeriodoAberto, "CHR_PERIODO_ABERTO", FieldType.TextBox, SQLType.Charactere, "Período em Aberto", true, false, false));
        base.addField(new CRegField(this.txtDebito, "FLT_DEBITO", FieldType.TextBox, SQLType.Numeric, "Débito", true, false, false));
        base.addField(new CRegField(this.txtObservacao, "CHR_OBSERVACAO", FieldType.TextBox, SQLType.Charactere, "Observação", true, false, false));
        base.addField(new CRegField(this.cbEmAberto, "BLN_EM_ABERTO", FieldType.CheckBox, SQLType.Bit, "Em Aberto", true, false, false));

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
