/***************************************************
 * INTRANET CELU
 * App_Page/Avisos/Recado/lerRecados.aspx.cs
 * Lista de avisos
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

public partial class App_Page_Avisos_Recado_lerRecados : Celu.Library.WebPage.CListPage
{

    private const String LOAD_ALL = "Carregar todos os recados";
    private const String LOAD_ONLY = "Carregar apenas recados não ocultos";

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {            
            this.btnLoad.Text = LOAD_ALL;
            this.loadPage();
        }
        else
        {
            if (!this.hdControl.Value.Equals(String.Empty))
            {
                this.exibeOculta(this.hdControl.Value);
            }
            this.hdControl.Value = String.Empty;

            
        }

    }

    public override bool loadPage()
    {
        base.setISqlLoad("EXECUTE LOAD_LIST_RECADOS " + ((CLogin)(Session["login"])).getCod() + "," + (this.btnLoad.Text.Equals(LOAD_ONLY)?"1":"0"));
        base.setFields("COD_RECADO;CHR_NOME;CHR_DESC_TIPO_RECADO;DT_DATAHORA;BLN_OCULTO");
        base.setIdPage(CSecurity.GERAL);

        this.ClientScript.RegisterStartupScript(this.GetType(), "adjust",
            "<script type=\"text/javascript\" language=\"javascript\">adjust();</script>", false);

        return base.loadPage(this.tblList, true, false, true, "Exibir",
            "javascript:__openPopUp('viewRecado.aspx?recado=#0;', 'aviso', true, 400, 600, false, false, 'yes');");


    }

    protected void btnLoad_Click(object sender, EventArgs e)
    {
        try
        {
            this.btnLoad.Text = (this.btnLoad.Text.Equals(LOAD_ONLY) ? LOAD_ALL : LOAD_ONLY);
            this.loadPage();
        }
        catch (Exception ex)
        {
            alert("Erro ao recarregar a recado!\n" + ex.Message);
        }
    }

    private void exibeOculta(String id)
    {
        try
        {
            CDataBase cdb = new CDataBase();

            cdb.execute("EXECUTE EXIBE_OCULTA_RECADO " + id);

            this.btnLoad.Text = LOAD_ALL;
            this.loadPage();

            alert("Recado ocultado/exibido com sucesso!");

        }
        catch (Exception ex)
        {
            alert("Erro ao exibir/ocultar recado\n" + ex.Message);
        }
    }
}


