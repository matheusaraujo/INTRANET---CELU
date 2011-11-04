/***************************************************
 * INTRANET CELU
 * App_Page/Biblioteca/AutorObra/cadAutorObra.aspx.cs
 * Cadastro de Autor de Obra
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

public partial class App_Page_Biblioteca_AutorObra_cadAutorObra : Celu.Library.WebPage.CRegPage
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
        base.setIdPage(CSecurity.CADASTRO_AUTOR_OBRA);

        // parâmetros sql
        base.setSqlDefault("AUTOR_OBRA");
        base.setIdentity(0);

        // id por url
        base.setIdUrl("autorobra");

        // campos
        base.addField(new CRegField(this.txtCodigo, "COD_AUTOR_OBRA", FieldType.TextBox, SQLType.Numeric, "Código", true, false, true));
        base.addField(new CRegField(this.txtDesc, "CHR_NOME_AUTOR_OBRA", FieldType.TextBox, SQLType.Charactere, "Autor de Obra", true, true, false));
        
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
