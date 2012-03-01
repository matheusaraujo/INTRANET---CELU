/***************************************************
 * INTRANET CELU
 * \App_Page\BemEstar\PersonaNonGrata\listPersonaNonGrata.aspx.cs
 * Lista de Persona Non Grata
 * # 2012-03-01
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

public partial class App_Page_BemEstar_PersonaNonGrata_listPersonaNonGrata : Celu.Library.WebPage.CListPage
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

    public override bool loadPage()
    {
        
        base.setISqlLoad("EXECUTE LOAD_LIST_PERSONA_NON_GRATA " + this.cbListAll.Checked);

        if (this.cbListDetal.Checked)
        {
            base.setFields("COD_PERSONA_NON_GRATA;DT_DATA_ENTRADA;DT_DATA_SAIDA;CHR_QUARTO;CHR_NOME;CHR_PERIODO_ABERTO;FLT_DEBITO;CHR_OBSERVACAO;CHR_EM_ABERTO");
        }
        else
        {
            base.setFields("COD_PERSONA_NON_GRATA;CHR_NOME;CHR_EM_ABERTO");
            
        }

        base.setIdPage(CSecurity.CADASTRO_PERSONA_NON_GRATA);

        this.tblList.Rows[0].Cells[7].ColSpan = this.cbListDetal.Checked ? 1 : 2;

        // visibilidade das colunas
        this.tblList.Rows[0].Cells[0].Visible =
            this.tblList.Rows[0].Cells[1].Visible =
            this.tblList.Rows[0].Cells[2].Visible =
            this.tblList.Rows[0].Cells[4].Visible =
            this.tblList.Rows[0].Cells[5].Visible =
            this.tblList.Rows[0].Cells[6].Visible =
            this.tblList.Rows[0].Cells[8].Visible =
            this.cbListDetal.Checked;
        

        return base.loadPage(this.tblList, true, false, true, "Editar", "javascript:window.navigate('cadPersonaNonGrata.aspx?personanongrata=#0;');");

    }
    protected void cbListDetal_CheckedChanged(object sender, EventArgs e)
    {
        this.loadPage();
    }
}
