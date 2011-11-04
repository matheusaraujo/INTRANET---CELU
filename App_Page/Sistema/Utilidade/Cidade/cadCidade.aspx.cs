/***************************************************
 * INTRANET CELU
 * App_Page/Sistema/Utilidade/Cidade/cadCidade.aspx.cs
 * Cadastro de Cidade
 * # 2011-02-05
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

public partial class App_Page_Sistema_Utilidade_Cidade_cadCidade : Celu.Library.WebPage.CRegPage
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
        base.setIdPage(CSecurity.CADASTRO_CIDADE);

        // parâmetros sql
        base.setSqlDefault("CIDADE");
        base.setIdentity(0);

        // id por url
        base.setIdUrl("cidade");

        // campos
        base.addField(new CRegField(this.txtCodigo, "COD_CIDADE", FieldType.TextBox, SQLType.Numeric, "Código", true, false, true));
        base.addField(new CRegField(this.txtEstado, "CHR_ESTADO", FieldType.TextBox, SQLType.Charactere, "Estado", true, true, false));
        base.addField(new CRegField(this.txtCidade, "CHR_CIDADE", FieldType.TextBox, SQLType.Charactere, "Cidade", true, true, false));

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
