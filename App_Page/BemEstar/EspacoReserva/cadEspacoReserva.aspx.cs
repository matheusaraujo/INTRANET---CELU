/***************************************************
 * INTRANET CELU
 * App_Page/BemEstar/EspacoReserva/cadEspacoReserva.aspx.cs
 * Cadastro de espaço de reserva
 * # 2012-03-21
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

public partial class App_Page_BemEstar_EspacoReserva_cadEspacoReserva : Celu.Library.WebPage.CRegPage
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
        base.setIdPage(CSecurity.CADASTRO_ESPACO_RESERVA);

        // parâmetros sql
        base.setSqlDefault("ESPACO_RESERVA");
        base.setIdentity(0);

        // id por url
        base.setIdUrl("espacoreserva");

        // campos
        base.addField(new CRegField(this.txtCodigo, "COD_ESPACO_RESERVA", FieldType.TextBox, SQLType.Numeric, "Código", true, false, true));
        base.addField(new CRegField(this.txtNome, "CHR_NOME_ESPACO_RESERVA", FieldType.TextBox, SQLType.Charactere, "Espaço de Reserva", true, true, false));

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
