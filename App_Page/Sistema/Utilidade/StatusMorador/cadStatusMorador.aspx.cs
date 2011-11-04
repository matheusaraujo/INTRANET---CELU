/***************************************************
 * INTRANET CELU
 * App_Page/Sistema/Utilidade/StatusMorador/cadStatusMorador.aspx.cs
 * Cadastro de status de moradores
 * # 2011-02-04
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

public partial class App_Page_Sistema_Utilidade_StatusMorador_cadStatusMorador : Celu.Library.WebPage.CRegPage
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
        base.setIdPage(CSecurity.CADASTRO_STATUS_MORADOR);

        // parâmetros sql
        base.setSqlDefault("STATUS_MORADOR");
        base.setIdentity(0);

        // id por url
        base.setIdUrl("statusmorador");

        // campos
        base.addField(new CRegField(this.txtCodigo, "COD_STATUS_MORADOR", FieldType.TextBox, SQLType.Numeric, "Código", true, false, true));
        base.addField(new CRegField(this.txtDesc, "CHR_DESC_STATUS_MORADOR", FieldType.TextBox, SQLType.Charactere, "Status de Morador", true, true, false));

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
