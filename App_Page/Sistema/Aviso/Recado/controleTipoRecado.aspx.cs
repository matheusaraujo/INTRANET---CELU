/***************************************************
 * INTRANET CELU
 * App_Page/Sistema/Aviso/Recado/controleTipoRecado.aspx.cs
 * Lista de controle de permissão
 * # 2011-04-09
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

public partial class App_Page_Sistema_Aviso_Recado_controleTipoRecado : Celu.Library.WebPage.CListPage
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            this.hdTipoRecado.Value = getUrlParameter(this.Request.RawUrl, "tiporecado");

            if (this.hdTipoRecado.Value.Equals(String.Empty))
            {
                alert("Você deve salvar o tipo de recado antes!");
            }
            else
            {
                this.load();
            }
        }

    }

    public void load()
    {

        if (this.hdTipoRecado.Value.Equals(String.Empty))
        {
            alert("Houve um erro ao carregar a página!");
        }
        else
        {
            base.setISqlLoad("EXECUTE LOAD_LIST_PERFIL_TIPO_RECADO " + this.hdTipoRecado.Value);
            base.setFields("COD_PERFIL;CHR_DESC_PERFIL;PERMISSAO");
            base.setIdPage(CSecurity.CADASTRO_TIPO_RECADO);

            base.loadPage(this.tblList, false, true, true, String.Empty, String.Empty);

            this.ClientScript.RegisterStartupScript(this.GetType(), "adjustTable",
                "<script type=\"text/javascript\" language=\"javascript\">adjustTable();</script>", false);
        }
    }

    protected void btnFinalize_Click(object sender, EventArgs e)
    {

        try
        {

            CDataBase db = new CDataBase();

            db.execute("EXECUTE INSERT_PERMISSAO_TIPO_RECADO " + this.hdTipoRecado.Value + ",'" + this.hdControl.Value + "'");

            this.load();
        }
        catch (Exception ex)
        {
            alert("Erro ao salvar as permissões " + ex.Message);
        }



    }
}
