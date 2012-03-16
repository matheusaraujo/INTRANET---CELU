/***************************************************
 * INTRANET CELU
 * \App_Page\BemEstar\HospedePermanente\listHospedePermanente.aspx.cs
 * Lista de Hóspede Permanente
 * # 2012-03-16
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

public partial class App_Page_BemEstar_HospedePermanente_listHospedePermanente : Celu.Library.WebPage.CListPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!base.IsPostBack)
        {
            this.loadPage();
        }
    }

    protected void cbListAll_CheckedChanged(object sender, EventArgs e)
    {
        this.loadPage();
    }

    protected void cbListDetal_CheckedChanged(object sender, EventArgs e)
    {
        this.loadPage();
    }

    public override bool loadPage()
    {

        base.setISqlLoad("EXECUTE LOAD_LIST_HOSPEDE_PERMANENTE " + this.cbListAll.Checked);

        if (this.cbListDetal.Checked)
        {
            base.setFields("COD_HOSPEDE_PERMANENTE;CHR_DESC_QUARTO;CHR_NOME;CHR_RG;CHR_CPF;CHR_CIDADE_ORIGEM;CHR_CURSO;CHR_RECEPCAO;CHR_ATIVO");
        }
        else
        {
            base.setFields("COD_HOSPEDE_PERMANENTE;CHR_DESC_QUARTO;CHR_NOME;CHR_ATIVO");

        }

        base.setIdPage(CSecurity.CADASTRO_HOSPEDE_PERMANENTE);

        // visibilidade das colunas
        this.tblList.Rows[0].Cells[2].Visible =
            this.tblList.Rows[0].Cells[3].Visible =
            this.tblList.Rows[0].Cells[4].Visible =
            this.tblList.Rows[0].Cells[5].Visible =
            this.tblList.Rows[0].Cells[6].Visible =            
            this.cbListDetal.Checked;

        return base.loadPage(this.tblList, true, false, true, "Editar", "javascript:window.navigate('cadHospedePermanente.aspx?hospedepermanente=#0;');");

    }
}
