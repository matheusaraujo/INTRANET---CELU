/***************************************************
 * INTRANET CELU
 * App_Page/Avisos/Recado/cadRecado.aspx.cs
 * Cadastro de Recado
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
using Celu.Library.DataBase;

public partial class App_Page_Avisos_Recado_cadRecado : Celu.Library.WebPage.CPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.loadPage();
            this.ddlAssunto_Change(sender, e);
        }

    }

    public override bool loadPage()
    {

        base.setIdPage(CSecurity.GERAL);
        this.txtMsg.Attributes.Add("onkeydown", "javascript:contText('txtMsg', 2048);");
        base.addSelect(new CSelect(this.ddlAssunto, "EXECUTE LOAD_LIST_TIPO_RECADO", "COD_TIPO_RECADO;CHR_DESC_TIPO_RECADO", 0, false, false));

        return base.loadPage();
    }

    protected void ddlAssunto_Change(Object sender, EventArgs e)
    {

        String value = this.ddlAssunto.SelectedValue;

        if (value.Equals(String.Empty))
        {
            alert("Houve um erro ao carregar!");
        }
        else
        {

            CDataBase db = new CDataBase();

            CQuery query = db.select("EXECUTE LOAD_LIST_PERFIL_BY_TIPO_RECADO " + value , "CHR_DESC_PERFIL");

            String html = "<ul>";

            for (int i = 0; i < query.Count(); i++)
            {
                html += "<li>" + query.Field(i, 0) + "</li>";
            }

            html += "</ul>";

            this.tdQuem.InnerHtml = html;

        }

        
    }

    protected void btnEnviar_Click(object sender, EventArgs e)
    {
        try
        {
            CLogin login = (CLogin)Session["login"];

            CDataBase db = new CDataBase();

            db.execute("EXECUTE INSERT_RECADO " + login.getCod() + "," + this.ddlAssunto.SelectedValue + ",'" + this.txtMsg.Text + "'");

            alert("Recado enviado!");

            this.txtMsg.Text = "";

        }
        catch (Exception ex)
        {
            alert("Erro ao enviar o recado!\n" + ex.Message);
        }
    }
}
