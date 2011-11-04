/***************************************************
 * INTRANET CELU
 * App_Page/Common/detalMorador.aspx.cs
 * Detalhe para morador
 * # 2011-02-07
 * Matheus Araújo 
 ***************************************************/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;

using Celu.Library.WebPage;
using Celu.Library.Security;
using Celu.Library.DataBase;

public partial class App_Page_Common_detalMorador : Celu.Library.WebPage.CPage
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

        String id = getUrlParameter(this.Request.RawUrl, "morador");

        String script = "<script type=\"text/javascript\" language=\"javascript\">" +
            "alert('Erro ao carregar a página!');self.close();</script>";

        if (id.Equals(String.Empty))
        {
            this.ClientScript.RegisterStartupScript(this.GetType(), "erro", script, false);
        }
        else
        {

            CDataBase db = new CDataBase();

            CQuery query = db.select("EXECUTE LOAD_REG_MORADOR " + id, 
                "CHR_NOME;CHR_NUMERO_LAVANDERIA;CHR_DESC_PERFIL;CHR_DESC_STATUS_MORADOR;CHR_DESC_IES;" + 
                "CHR_DESC_CURSO;CHR_DESC_QUARTO;CHR_CIDADE_ORIGEM;CHR_TELEFONE_CELULAR;CHR_EMAIL;CHR_ANIVERSARIO;" + 
                "CHR_APELIDO;CHR_INGRESSO");

            if (query.Count() == 0)
            {
                this.ClientScript.RegisterStartupScript(this.GetType(), "erro", script, false);
            }
            else
            {

                this.tdNome.InnerText = query.Field(0, 0);
                this.tdNumLavanderia.InnerText = query.Field(0, 1);
                this.tdPerfil.InnerText = query.Field(0, 2);
                this.tdStatus.InnerText = query.Field(0, 3);
                this.tdIes.InnerText = query.Field(0, 4);
                this.tdCurso.InnerText = query.Field(0, 5);
                this.tdQuarto.InnerText = query.Field(0, 6);
                this.tdCidadeOrigem.InnerText = query.Field(0, 7);
                this.tdTelefone.InnerText = query.Field(0, 8);
                this.tdEmail.InnerText = query.Field(0, 9);
                this.tdAniversario.InnerText = query.Field(0, 10);
                this.tdApelido.InnerText = query.Field(0, 11);
                this.tdIngresso.InnerText = query.Field(0, 12);

                this.frmFoto.Attributes["src"] =
                    "frmFoto.aspx?morador=" + id + ";";

                
            }

        }

        return true;
    }

 

}