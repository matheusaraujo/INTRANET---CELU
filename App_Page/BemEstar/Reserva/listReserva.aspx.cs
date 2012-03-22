/***************************************************
 * INTRANET CELU
 * \App_Page\BemEstar\Reserva\listReserva.aspx.cs
 * Página de listagem reserva de espaço físico
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

public partial class App_Page_BemEstar_Reserva_listReserva : Celu.Library.WebPage.CListPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        base.setIdPage(CSecurity.CONTROLE_RESERVA);

        if (!IsPostBack)
        {
            base.addSelect(new CSelect(this.slctEspacoFisico, "EXECUTE LOAD_LIST_ESPACO_RESERVA", "COD_ESPACO_RESERVA;CHR_NOME_ESPACO_RESERVA", 0, false, false));
            base.loadPage();
        }
    }

    public override bool loadPage()
    {

        base.setISqlLoad("EXECUTE LOAD_LIST_RESERVA " +
            this.slctTipoLista.SelectedValue + "," + 
            this.slctEspacoFisico.SelectedValue + ",'" + 
            this.calDataInicial.SelectedDate.Year + "-" + this.calDataInicial.SelectedDate.Month + "-" + this.calDataInicial.SelectedDate.Day + "','" + 
            this.calDataFinal.SelectedDate.Year + "-" + this.calDataFinal.SelectedDate.Month + "-" + this.calDataFinal.SelectedDate.Day + "'");

        base.setFields("COD_RESERVA;CHR_EVENTO;CHR_NOME_ESPACO_RESERVA;CHR_RESPONSAVEL;CHR_DATA_HORA_INICIAL;CHR_DATA_HORA_FINAL;CHR_STATUS_RESERVA");

        return base.loadPage(this.tblList, true, false, true, "Editar", "javascript:window.navigate('cadReserva.aspx?reserva=#0;');");

    }

    protected void btnList_Click(object sender, EventArgs e)
    {
        this.loadPage();
    }
}
