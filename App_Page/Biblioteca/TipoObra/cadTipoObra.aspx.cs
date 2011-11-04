/***************************************************
 * INTRANET CELU
 * App_Page/Biblioteca/TipoObra/cadTipoObra.aspx.cs
 * Cadastro de Tipo de Obra
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

public partial class App_Page_Biblioteca_TipoObra_cadTipoObra : Celu.Library.WebPage.CRegPage
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
        base.setIdPage(CSecurity.CADASTRO_TIPO_OBRA);

        // parâmetros sql
        base.setSqlDefault("TIPO_OBRA");
        base.setIdentity(0);

        // id por url
        base.setIdUrl("tipoobra");

        // campos
        base.addField(new CRegField(this.txtCodigo, "COD_TIPO_OBRA", FieldType.TextBox, SQLType.Numeric, "Código", true, false, true));
        base.addField(new CRegField(this.cbPermiteEmprestimo, "BLN_PERMITE_EMPRESTIMO", FieldType.CheckBox, SQLType.Numeric, "Permite Empréstimo", true, false, false));
        base.addField(new CRegField(this.txtDesc, "CHR_DESC_TIPO_OBRA", FieldType.TextBox, SQLType.Charactere, "Tipo de Obra", true, true, false));
        
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
