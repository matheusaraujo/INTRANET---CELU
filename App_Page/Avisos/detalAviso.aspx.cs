/***************************************************
 * INTRANET CELU
 * App_Page/Avisos/detalAviso.aspx.cs
 * Lista de avisos
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
using Celu.Library.DataBase;

public partial class App_Page_Avisos_detalAviso : Celu.Library.WebPage.CPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        // ID da página
        setIdPage(CSecurity.GERAL);

        if (!IsPostBack)
        {
            if (base.loadPage())
            {
                this.loadPage();
            }
        }
    }

    public override Boolean loadPage()
    {


        String id = getUrlParameter(this.Request.RawUrl, "aviso");

        String script = "<script type=\"text/javascript\" language=\"javascript\">" +
            "alert('Erro ao carregar a página!');self.close();</script>";

        if (id.Equals(String.Empty))
        {
            this.ClientScript.RegisterStartupScript(this.GetType(), "erro", script, false);
        }
        else
        {

            CDataBase db = new CDataBase();

            CQuery query = db.select("EXECUTE LOAD_REG_AVISO " + id, "CHR_NOME;DT_DATAHORA;CHR_ASSUNTO;CHR_AVISO");

            if (query.Count() == 0)
            {
                this.ClientScript.RegisterStartupScript(this.GetType(), "erro", script, false);
            }
            else
            {

                this.tdMorador.InnerText = query.Field(0, 0);
                this.tdData.InnerText = query.Field(0, 1);
                this.tdAssunto.InnerHtml = "<h3>" + query.Field(0, 2) + "</h3>";
                this.tdMensagem.InnerHtml = query.Field(0, 3).Replace("[b]", "<b>")
                    .Replace("[/b]", "</b>")
                    .Replace("[i]", "<i>")
                    .Replace("[/i]", "</i>")
                    .Replace("[u]", "<u>")
                    .Replace("[/u]", "</u>")
                    .Replace("[br]", "<br />");
            }

        }

        return true;
    }


}
