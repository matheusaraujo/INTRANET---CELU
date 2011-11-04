/***************************************************
 * INTRANET CELU
 * App_Page/Biblioteca/StatusObra/cadStatusObra.aspx.cs
 * Cadastro de Status de Obra
 * # 2011-02-08
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

public partial class App_Page_Biblioteca_StatusObra_cadStatusObra : Celu.Library.WebPage.CRegPage
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
        base.setIdPage(CSecurity.CADASTRO_STATUS_OBRA);

        // cadastro de sistema
        base.setSystemCad(true);

        // parâmetros sql
        base.setSqlDefault("STATUS_OBRA");
        base.setIdentity(0);

        // id por url
        base.setIdUrl("statusobra");

        // campos
        base.addField(new CRegField(this.txtCodigo, "COD_STATUS_OBRA", FieldType.TextBox, SQLType.Numeric, "Código", true, false, true));
        base.addField(new CRegField(this.cbPermiteReserva, "BLN_PERMITE_RESERVA", FieldType.CheckBox, SQLType.Numeric, "Permite Reserva", true, false, false));
        base.addField(new CRegField(this.cbPermiteEmprestimo, "BLN_PERMITE_EMPRESTIMO", FieldType.CheckBox, SQLType.Numeric, "Permite Empréstimo", true, false, false));
        base.addField(new CRegField(this.cbPermiteRenovacao, "BLN_PERMITE_RENOVACAO", FieldType.CheckBox, SQLType.Numeric, "Permite Renovação", true, false, false));
        base.addField(new CRegField(this.txtDesc, "CHR_DESC_STATUS_OBRA", FieldType.TextBox, SQLType.Charactere, "Status de Obra", true, true, false));

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
