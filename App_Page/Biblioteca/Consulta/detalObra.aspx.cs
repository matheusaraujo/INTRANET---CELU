/***************************************************
 * INTRANET CELU
 * App_Page/Biblioteca/Consulta/detalObra.aspx.cs
 * Detalhes de obra do acervo
 * # 2011-02-10
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

public partial class App_Page_Biblioteca_Consulta_detalObra : Celu.Library.WebPage.CPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        base.setIdPage(CSecurity.GERAL);

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

        String id = getUrlParameter(Request.RawUrl, "obra");

        String scripterro = "<script type=\"text/javascript\" language=\"javascript\">" + 
                "alert('Houve um erro ao carregar a obra!');self.close();</script>";

        if (id.Equals(String.Empty))
        {
            this.ClientScript.RegisterStartupScript(this.GetType(), "erro", scripterro, false);                
        }
        else
        {
            CDataBase db = new CDataBase();

            CQuery query = db.select("EXECUTE LOAD_REG_OBRA " + id, 
                "COD_OBRA;CHR_DESC_TIPO_OBRA;CHR_CHAMADA;CHR_TITULO;CHR_NOME_AUTOR_OBRA;CHR_EDICAO;CHR_PUBLICACAO;" +
                "CHR_NORMALIZACAO;CHR_DESC_ASSUNTO_OBRA;CHR_DESC_STATUS_OBRA;BLN_PERMITE_RESERVA");

            if (query.Count() == 0)
            {
                this.ClientScript.RegisterStartupScript(this.GetType(), "erro", scripterro, false);
            }
            else
            {
                this.tdCodigo.InnerText = query.Field(0, 0);
                this.hdCodObra.Value = query.Field(0, 0);
                this.tdTipoObra.InnerText = query.Field(0, 1);
                this.tdNumChamada.InnerText = query.Field(0, 2);
                this.tdTitulo.InnerHtml = "<h6>" + query.Field(0, 3) + "</h6>";
                this.tdAutorObra.InnerText = query.Field(0, 4);
                this.tdEdicao.InnerText = query.Field(0, 5);
                this.tdPublicacao.InnerText = query.Field(0, 6);
                this.tdNormalizacao.InnerText = query.Field(0, 7);
                this.tdAssuntoObra.InnerText = query.Field(0, 8);
                this.tdStatusObra.InnerText = query.Field(0, 9);

                this.btnReserva.Enabled = Convert.ToBoolean(query.Field(0, 10)) ? true : false;
            }

        }
        return true;
        
    }
    

    protected void btnReserva_Click(object sender, EventArgs e)
    {
        String codObra = this.hdCodObra.Value;
        String codMorador = ((CLogin)Session["login"]).getCod();
        String scripterro = "<script type=\"text/javascript\" language=\"javascript\">" +
            "alert('Houve um erro ao reservar a obra!\\n#ERRO');self.close();</script>";

        if (codObra.Equals(String.Empty) || codMorador.Equals(String.Empty))
        {
            this.ClientScript.RegisterStartupScript(this.GetType(), "erro", scripterro, false);
        }
        else
        {
            CDataBase db = new CDataBase();

            CQuery query = db.select("EXECUTE VERIFY_INSERT_RESERVA_OBRA " + codMorador + "," + codObra, "P_CHR_MSG_ERRO");

            if (query.Count() == 0)
            {
                this.ClientScript.RegisterStartupScript(this.GetType(), "erro", 
                    scripterro.Replace("#ERRO", "VERIFY_INSERT_RESERVA_OBRA"), false);
            }
            else
            {

                if (!query.Field(0, 0).Equals(String.Empty))
                {
                    this.ClientScript.RegisterStartupScript(this.GetType(), "erro",
                        "<script type=\"text/javascript\" language=\"javascript\">" +
                        "alert('Não é possível fazer a reserva!\\n" + query.Field(0, 0) + "')</script>", false);
                }
                else
                {
                    try
                    {
                        db.execute("EXECUTE INSERT_RESERVA_OBRA " + codMorador + "," + codObra);
                        this.ClientScript.RegisterStartupScript(this.GetType(), "sucesso",
                            "<script type=\"text/javascript\" language=\"javascript\">" +
                            "alert('Obra reservada com sucesso!');self.close();</script>", false);                        
                    }
                    catch (Exception ex)
                    {
                        this.ClientScript.RegisterStartupScript(this.GetType(), "erro", 
                            scripterro.Replace("#ERRO", ex.Message), false);
                    }
                }
            }
        }

    }
}
