/***************************************************
 * INTRANET CELU
 * \App_Page\BemEstar\Reserva\cadReserva.aspx.cs
 * Controle de Reserva
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

public partial class App_Page_BemEstar_Reserva_cadReserva : Celu.Library.WebPage.CRegPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.setPageElements();

        if (!IsPostBack)
        {
            base.loadPage();

            if (!this.txtDataHoraInicial.Text.Equals(String.Empty))
            {
                DateTime dt = Convert.ToDateTime(this.txtDataHoraInicial.Text);

                this.calDataInicial.SelectedDate = new DateTime(dt.Year, dt.Month, dt.Day);

                this.txtHoraInicial.Text = dt.ToShortTimeString();
            }

            if (!this.txtDataHoraFinal.Text.Equals(String.Empty))
            {
                DateTime dt = Convert.ToDateTime(this.txtDataHoraFinal.Text);

                this.calDataFinal.SelectedDate = new DateTime(dt.Year, dt.Month, dt.Day);

                this.txtHoraFinal.Text = dt.ToShortTimeString();
            }
        }

    }


    public override void setPageElements()
    {
        // id da página
        base.setIdPage(CSecurity.CADASTRO_PERSONA_NON_GRATA);

        // parâmetros sql
        base.setSqlDefault("RESERVA");
        base.setIdentity(0);

        // select
        base.addSelect(new CSelect(this.slctEspacoReserva, "EXECUTE LOAD_LIST_ESPACO_RESERVA", "COD_ESPACO_RESERVA;CHR_NOME_ESPACO_RESERVA", 0, false, false));
        base.addSelect(new CSelect(this.slctStatusReserva, "EXECUTE LOAD_LIST_STATUS_RESERVA", "COD_STATUS_RESERVA;CHR_STATUS_RESERVA", 0, false, true));

        // id por url
        base.setIdUrl("reserva");
        
        // campos
        base.addField(new CRegField(this.txtCodigo, "COD_RESERVA", FieldType.TextBox, SQLType.Numeric, "Código", true, false, true));
        base.addField(new CRegField(this.slctEspacoReserva, "COD_ESPACO_RESERVA", FieldType.SelectBox, SQLType.Numeric, "Espaço de Reserva", true, true, false));
        base.addField(new CRegField(this.slctStatusReserva, "COD_STATUS_RESERVA", FieldType.SelectBox, SQLType.Numeric, "Status de Reserva", true, false, false));
        base.addField(new CRegField(this.txtDataHoraInicial, "DT_DATA_HORA_INICIAL", FieldType.TextBox, SQLType.DateTime, "Data/hora Início", true, true, false));
        base.addField(new CRegField(this.txtDataHoraFinal, "DT_DATA_HORA_FINAL", FieldType.TextBox, SQLType.DateTime, "Data/hora Final", true, true, false));
        base.addField(new CRegField(this.txtEvento, "CHR_EVENTO", FieldType.TextBox, SQLType.Charactere, "Evento", true, true, false));
        base.addField(new CRegField(this.txtQuantidade, "INT_QUANTIDADE", FieldType.TextBox, SQLType.Numeric, "Quantidade", true, false, false));
        base.addField(new CRegField(this.txtResponsavel, "CHR_RESPONSAVEL", FieldType.TextBox, SQLType.Charactere, "Responsável", true, true, false));
        base.addField(new CRegField(this.txtContato, "CHR_CONTATO", FieldType.TextBox, SQLType.Charactere, "Contato", true, false, false));
        base.addField(new CRegField(this.txtOrigem, "CHR_ORIGEM", FieldType.TextBox, SQLType.Charactere, "Origem", true, false, false));
        base.addField(new CRegField(this.txtObservacao, "CHR_OBSERVACAO", FieldType.TextBox, SQLType.Charactere, "Observação", true, false, false));
        base.addField(new CRegField(this.cbReservaExclusiva, "BLN_RESERVA_EXCLUSIVA", FieldType.CheckBox, SQLType.Bit, "Reserva Exclusiva", true, false, false));
        base.addField(new CRegField(this.calDataReserva, "DT_DATA_DA_RESERVA", FieldType.Calendar, SQLType.Date, "Data da reserva", true, true, false));
        base.addField(new CRegField(this.txtResponsavelReserva, "CHR_RESPONSAVEL_RESERVA", FieldType.TextBox, SQLType.Charactere, "Responsável pela reserva", true, true, false));
    
        // elementos html
        base.setHtmlElements(this.btnEdit, this.btnSave, this.btnDel, this.btnNew, this.tblCadastro);

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {

        // verify the time inputs
        if (!isValidTime(this.txtHoraInicial.Text))
        {
            alert("Digite a Hora Inicial no formato válido!");
        }
        else if (!isValidTime(this.txtHoraFinal.Text))
        {
            alert("Digite a Hora Final no formato válido!");
        }
        else
        {
            // set the textbox for datetime inputs
            this.txtDataHoraInicial.Text =
                this.calDataInicial.SelectedDate.Year + "-" +
                this.calDataInicial.SelectedDate.Month + "-" +
                this.calDataInicial.SelectedDate.Day + " " +
                this.txtHoraInicial.Text;

            this.txtDataHoraFinal.Text =
                this.calDataFinal.SelectedDate.Year + "-" +
                this.calDataFinal.SelectedDate.Month + "-" +
                this.calDataFinal.SelectedDate.Day + " " +
                this.txtHoraFinal.Text;

            base.saveClick();
        }
    }

    protected void btnDel_Click(object sender, EventArgs e)
    {
        base.delClick();
    }
}
