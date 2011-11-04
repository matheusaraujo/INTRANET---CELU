/***************************************************
 * INTRANET CELU
 * App_Page/Biblioteca/AssuntoObra/cadAssuntoObra.aspx.cs
 * Cadastro de Assunto de Obra
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

public partial class App_Page_Biblioteca_AssuntoObra_cadAssuntoObra : Celu.Library.WebPage.CRegPage
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
        base.setIdPage(CSecurity.CADASTRO_ASSUNTO_OBRA);

        // parâmetros sql
        base.setSqlDefault("ASSUNTO_OBRA");
        base.setIdentity(0);

        // id por url
        base.setIdUrl("assuntoobra");

        // campos
        base.addField(new CRegField(this.txtCodigo, "COD_ASSUNTO_OBRA", FieldType.TextBox, SQLType.Numeric, "Código", true, false, true));
        base.addField(new CRegField(this.txtDesc, "CHR_DESC_ASSUNTO_OBRA", FieldType.TextBox, SQLType.Charactere, "Assunto de Obra", true, true, false));
        
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
