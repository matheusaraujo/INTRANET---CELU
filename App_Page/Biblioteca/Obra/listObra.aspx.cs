/***************************************************
 * INTRANET CELU
 * App_Page/Biblioteca/Obra/listObra.aspx.cs
 * Controle do Acervo
 * # 2011-02-08
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

public partial class App_Page_Biblioteca_Obra_listObra : Celu.Library.WebPage.CListPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        base.setIdPage(CSecurity.CADASTRO_OBRA);

        if (!IsPostBack)
        {
            base.addSelect(new CSelect(this.slctTipoObra, "EXECUTE LOAD_LIST_TIPO_OBRA", "COD_TIPO_OBRA;CHR_DESC_TIPO_OBRA", 0, false, false));
            base.loadPage();
        }
    }

    public override Boolean loadPage()
    {
        base.setISqlLoad("EXECUTE LOAD_LIST_OBRA " +
            this.slctTipoObra.SelectedValue + ",'" +
            this.txtTexto.Text + "'");
        base.setFields("COD_OBRA;CHR_CHAMADA;CHR_TITULO;CHR_NOME_AUTOR_OBRA");

        return base.loadPage(this.tblList, true, false, true, "Editar", 
            "javascript:window.navigate('cadObra.aspx?obra=#0;');");
    }
    
    protected void btnFind_Click(object sender, EventArgs e)
    {
        this.loadPage();
    }
}
