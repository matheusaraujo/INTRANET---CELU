/***************************************************
 * INTRANET CELU
 * \App_Page\BemEstar\HospedePermanente\cadHospedePermanente.aspx.cs
 * Cadastro de Hóspede Permanente
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

public partial class App_Page_BemEstar_HospedePermanente_cadHospedePermanente : Celu.Library.WebPage.CRegPage
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
        base.setIdPage(CSecurity.CADASTRO_HOSPEDE_PERMANENTE);

        // select
        base.addSelect(new CSelect(this.slctQuarto, "EXECUTE LOAD_LIST_QUARTO", "COD_QUARTO;CHR_DESC_QUARTO", 0, false, true));
        base.addSelect(new CSelect(this.slctCidade, "EXECUTE LOAD_LIST_CIDADE", "COD_CIDADE;CHR_ESTADO;CHR_CIDADE", 0, false, true));

        // parâmetros sql
        base.setSqlDefault("HOSPEDE_PERMANENTE");
        base.setIdentity(0);

        // id por url
        base.setIdUrl("hospedepermanente");
        base.setSqlVerifySave("-1");

        // campos
        base.addField(new CRegField(this.txtCodigo, "COD_HOSPEDE_PERMANENTE", FieldType.TextBox, SQLType.Numeric, "Código", true, false, true));
        base.addField(new CRegField(this.slctQuarto, "COD_QUARTO", FieldType.SelectBox, SQLType.Numeric, "Quarto", true, false, false));
        base.addField(new CRegField(this.txtNome, "CHR_NOME", FieldType.TextBox, SQLType.Charactere, "Nome", true, true, false));
        base.addField(new CRegField(this.txtRg, "CHR_RG", FieldType.TextBox, SQLType.Charactere, "RG", true, true, false));
        base.addField(new CRegField(this.txtCpf, "CHR_CPF", FieldType.TextBox, SQLType.Charactere, "CPF", true, true, false));
        base.addField(new CRegField(this.slctCidade, "COD_CIDADE_ORIGEM", FieldType.SelectBox, SQLType.Numeric, "Cidade de Origem", true, false, false));
        base.addField(new CRegField(this.txtCurso, "CHR_CURSO", FieldType.TextBox, SQLType.Charactere, "Curso", true, true, false));
        base.addField(new CRegField(this.txtRecepcao, "CHR_RECEPCAO", FieldType.TextBox, SQLType.Charactere, "Recepção", true, false, false));
        base.addField(new CRegField(this.txtDiaVencimento, "INT_DIA_VENCIMENTO", FieldType.TextBox, SQLType.Numeric, "Dia de vencimento", true, false, false));
        base.addField(new CRegField(this.calDtIngresso, "DT_DATA_INGRESSO", FieldType.Calendar, SQLType.Date, "Data de ingresso", true, false, false));
        base.addField(new CRegField(this.cbAtivo, "BLN_ATIVO", FieldType.CheckBox, SQLType.Bit, "Ativo", true, false, false));
        
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
