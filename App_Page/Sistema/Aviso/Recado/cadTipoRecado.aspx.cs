/***************************************************
 * INTRANET CELU
 * App_Page/Sistema/Aviso/Recado/cadTipoRecado.aspx.cs
 * Cadastro de Tipo de Recado
 * # 2011-04-09
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

public partial class App_Page_Sistema_Aviso_Recado_cadTipoRecado : Celu.Library.WebPage.CRegPage
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
        base.setIdPage(CSecurity.CADASTRO_TIPO_RECADO);

        // parâmetros sql
        base.setSqlDefault("TIPO_RECADO");
        base.setIdentity(0);

        // id por url
        base.setIdUrl("tiporecado");

        // campos
        base.addField(new CRegField(this.txtCodigo, "COD_TIPO_RECADO", FieldType.TextBox, SQLType.Numeric, "Código", true, false, true));
        base.addField(new CRegField(this.txtDesc, "CHR_DESC_TIPO_RECADO", FieldType.TextBox, SQLType.Charactere, "Perfil", true, true, false));

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

