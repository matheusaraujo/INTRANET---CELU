/***************************************************
 * INTRANET CELU
 * App_Page/Biblioteca/Consulta/myHistory.aspx.cs
 * Consulta ao histórico do morador
 * # 2011-02-10
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
using Celu.Library.WebPage;

public partial class App_Page_Biblioteca_Consulta_myHistory : Celu.Library.WebPage.CPage
{

    private const String BTN_RESERVA_ALL = "Carregar todas as reservas";
    private const String BTN_RESERVA_OPEN = "Carregar reservas em aberto";
    private const String BTN_EMPRESTIMO_ALL = "Carregar todos os empréstimos";
    private const String BTN_EMPRESTIMO_OPEN = "Carregar empréstimos em aberto";

    protected void Page_Load(object sender, EventArgs e)
    {
        base.setIdPage(CSecurity.GERAL);

        if (!IsPostBack)
        {
            if(base.loadPage()){
                this.loadPage();
            }
        }
        else
        {
            if (this.hdControl.Value.Length > 6)
            {
                String[] values = hdControl.Value.ToLower().Split(';');

                if (values[0].Equals("cancel"))
                {
                    this.cancelReserva(values[1]);
                }
                else if (values[0].Equals("renew"))
                {
                    this.renovaEmprestimo(values[1]);
                }
            }
        }

        this.hdControl.Value = "";
    }

    public override Boolean loadPage()
    {

        // id do morador
        this.hdMorador.Value = ((CLogin)Session["login"]).getCod();

        this.btnReserva.Text = BTN_RESERVA_ALL;
        this.btnEmprestimo.Text = BTN_EMPRESTIMO_ALL;

        // carrega as reservas
        this.loadReserva(false);

        // carrega os empréstimos
        this.loadEmprestimo(false);

        // script
        this.ClientScript.RegisterStartupScript(this.GetType(), "table",
            " <script type=\"text/javascript\" language=\"javascript\">__table();</script>", false);


        return true;
    }

    private void loadReserva(Boolean showAll)
    {
        CListPage list = new CListPage();

        list.setIdPage(this.getIdPage());

        list.setISqlLoad("EXECUTE LOAD_LIST_AUTO_RESERVA_OBRA " + hdMorador.Value + "," + (showAll ? "1" : "0"));
        list.setFields("COD_RESERVA_OBRA;COD_OBRA;CHR_TITULO;DT_DATAHORA;CHR_ABERTA");

        list.loadPage(this.tblReserva, true, false, true, "Cancelar", "javascript:__action('cancel','#0');");

    }

    private void cancelReserva(String id)
    {
        try
        {
            CDataBase db = new CDataBase();

            db.execute("EXECUTE CANCELA_RESERVA_OBRA " + id);

            alert("Reserva cancelada!");

            this.loadPage();

        }
        catch (Exception ex)
        {
            alert("Erro ao cancelar a reserva!\\n" + ex.Message);
        }
    }

    private void loadEmprestimo(Boolean showAll)
    {
        CListPage list = new CListPage();

        list.setIdPage(this.getIdPage());

        list.setISqlLoad("EXECUTE LOAD_LIST_AUTO_EMPRESTIMO_OBRA " + hdMorador.Value + "," + (showAll ? "1" : "0"));
        list.setFields("COD_EMPRESTIMO_OBRA;COD_OBRA;CHR_TITULO;DT_DATA_EMPRESTIMO;DT_DATA_DEVOLUCAO_PREVISTA;" + 
            "INT_CONT_RENOVACAO;CHR_ABERTO;CHR_DIAS_VENCIMENTO");

        list.loadPage(this.tblEmprestimo, true, false, true, "Renovar", "javascript:__action('renew','#0');");

    }

    private void renovaEmprestimo(String id)
    {

        String erro = "Houve um erro ao renovar o empréstimo!#ERRO";

        if (id.Equals(String.Empty))
        {
            alert(erro.Replace("#ERRO", "\\nID not found"));
        }
        else
        {
            try
            {
                CDataBase db = new CDataBase();

                CQuery query = db.select("EXECUTE RENOVA_EMPRESTIMO_OBRA " + id, "P_CHR_MSG_ERRO");

                if (query.Count() == 0)
                {
                    alert(erro.Replace("#ERRO", "\\nQUERY not found"));
                }
                else
                {
                    if (query.Field(0, 0).Equals(String.Empty))
                    {
                        alert("Empréstimo renovado com sucesso!");
                    }
                    else
                    {
                        alert("A obra não pode ser renovada!\\n" + query.Field(0, 0));
                    }
                }
            }
            catch (Exception ex)
            {
                alert(erro.Replace("#ERRO", "\\n" + ex.Message));
            }
        }

        this.loadPage();
        
    }
    
    protected void btnReserva_Click(object sender, EventArgs e)
    {
        if (this.btnReserva.Text.Equals(BTN_RESERVA_ALL))
        {
            this.loadReserva(true);
            this.btnReserva.Text = BTN_RESERVA_OPEN;
        }
        else
        {
            this.loadReserva(false);
            this.btnReserva.Text = BTN_RESERVA_ALL;
        }

        // empréstimo
        this.loadEmprestimo(this.btnEmprestimo.Text.Equals(BTN_EMPRESTIMO_OPEN));

        // script
        this.ClientScript.RegisterStartupScript(this.GetType(), "table",
            " <script type=\"text/javascript\" language=\"javascript\">__table();</script>", false);
    }
    
    protected void btnEmprestimo_Click(object sender, EventArgs e)
    {
        if (this.btnEmprestimo.Text.Equals(BTN_EMPRESTIMO_ALL))
        {
            this.loadEmprestimo(true);
            this.btnEmprestimo.Text = BTN_EMPRESTIMO_OPEN;
        }
        else
        {
            this.loadEmprestimo(false);
            this.btnEmprestimo.Text = BTN_EMPRESTIMO_ALL;
        }

        // empréstimo
        this.loadReserva(this.btnReserva.Text.Equals(BTN_RESERVA_OPEN));

        // script
        this.ClientScript.RegisterStartupScript(this.GetType(), "table",
            " <script type=\"text/javascript\" language=\"javascript\">__table();</script>", false);
    }
}
