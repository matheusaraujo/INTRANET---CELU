/***************************************************
 * INTRANET CELU
 * \App_Page\BemEstar\HospedeTemporario\listHospedeTemporario.aspx.cs
 * Página de listagem de hóspede temporário
 * # 2012-03-22
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

public partial class App_Page_BemEstar_HospedeTemporario_listHospedeTemporario : Celu.Library.WebPage.CListPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        base.setIdPage(CSecurity.CONTROLE_RESERVA);

        if (!IsPostBack)
        {         
            base.loadPage();
        }
    }

    public override bool loadPage()
    {

        base.setISqlLoad("EXECUTE LOAD_LIST_HOSPEDE_TEMPORARIO " +            
            this.calDataInicial.SelectedDate.Year + "-" + this.calDataInicial.SelectedDate.Month + "-" + this.calDataInicial.SelectedDate.Day + "','" +
            this.calDataFinal.SelectedDate.Year + "-" + this.calDataFinal.SelectedDate.Month + "-" + this.calDataFinal.SelectedDate.Day + "'");

        base.setFields("COD_HOSPEDE_TEMPORARIO;DT_DATA_INICIO;DT_DATA_FIM;CHR_EVENTO;CHR_RESPONSAVEL;FLT_VALOR;CHR_SITUACAO");

        return base.loadPage(this.tblList, true, false, true, "Editar", "javascript:window.navigate('cadHospedeTemporario.aspx?hospedetemporario=#0;');");

    }

    protected void btnList_Click(object sender, EventArgs e)
    {
        this.loadPage();
    }
}
