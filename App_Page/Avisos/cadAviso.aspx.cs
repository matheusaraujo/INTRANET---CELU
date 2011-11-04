/***************************************************
 * INTRANET CELU
 * App_Page/Avisos/cadAviso.aspx.cs
 * Lista de moradores
 * # 2011-02-07
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

public partial class App_Page_Avisos_cadAviso : Celu.Library.WebPage.CRegPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        // obtém o código de morador
        this.txtMorador.Text = ((CLogin)Session["login"]).getCod();

        this.setPageElements();

        if (!IsPostBack)
        {
            base.loadPage();
        }

        this.txtAssunto.Attributes.Add("onkeydown", "javascript:contText('txtAssunto', 64);");
        this.txtMsg.Attributes.Add("onkeydown", "javascript:contText('txtMsg', 4096);");

    }

    public override void setPageElements()
    {
        // id da página
        base.setIdPage(CSecurity.CADASTRO_AVISO);

        // parâmetros sql
        base.setSqlDefault("AVISO");
        base.setSqlVerifySave("-1");
        base.setIdentity(0);

        // id por url
        base.setIdUrl("aviso");

        // campos
        base.addField(new CRegField(this.txtCodigo, "COD_AVISO", FieldType.TextBox, SQLType.Numeric, "Código", true, false, true));
        base.addField(new CRegField(this.txtMorador, "COD_MORADOR", FieldType.TextBox, SQLType.Numeric, "Morador", true, false, false));
        base.addField(new CRegField(this.cbAtivo, "BLN_ATIVO", FieldType.CheckBox, SQLType.Numeric, "Ativo", true, false, false));
        base.addField(new CRegField(this.txtAssunto, "CHR_ASSUNTO", FieldType.TextBox, SQLType.Charactere, "Assunto", true, true, false));
        base.addField(new CRegField(this.txtMsg, "CHR_AVISO", FieldType.TextBox, SQLType.Charactere, "Mensagem", true, true, false));

        // elementos html
        base.setHtmlElements(this.btnEdit, this.btnSave, this.btnDel, this.btnNew, this.tblCadastro);


    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        base.saveClick();
    }
}
