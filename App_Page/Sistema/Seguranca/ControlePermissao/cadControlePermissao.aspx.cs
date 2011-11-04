/***************************************************
 * INTRANET CELU
 * App_Page/Sistema/Seguranca/ControlePermissao/cadControlePermissao.aspx.cs
 * Lista de controle de permissão
 * # 2011-02-06
 * Matheus Araújo 
 ***************************************************/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Celu.Library.DataBase;
using Celu.Library.Security;

public partial class App_Page_Sistema_Seguranca_ControlePermissao_cadControlePermissao : Celu.Library.WebPage.CListPage
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            this.hdPerfil.Value = getUrlParameter(this.Request.RawUrl, "perfil");
            
            if(this.hdPerfil.Value.Equals(String.Empty))
            {
                alert("Houve um erro ao carregar a página!");
            }
            else
            {
                load();
            }
        }

    }

    public void load()
    {
        base.setISqlLoad("EXECUTE LOAD_LIST_ITEM_PERMISSAO_PERFIL " + this.hdPerfil.Value);
        base.setFields("COD_ITEM_PERMISSAO;CHR_DESC_ITEM_PERMISSAO;COD_PERFIL");
        base.setIdPage(CSecurity.CONTROLE_PERMISSAO);

        base.loadPage(this.tblList, false, true, true, String.Empty, String.Empty);

        this.ClientScript.RegisterStartupScript(this.GetType(), "adjustTable",
            "<script type=\"text/javascript\" language=\"javascript\">adjustTable();</script>", false);
    }

    protected void btnFinalize_Click(object sender, EventArgs e)
    {

        try
        {

            CDataBase db = new CDataBase();

            db.execute("EXECUTE INSERT_PERMISSAO " + this.hdPerfil.Value + ",'" + this.hdControl.Value + "'");

            this.load();
        }
        catch (Exception ex)
        {
            alert("Erro ao salvar as permissões " + ex.Message);
        }



    }
}

