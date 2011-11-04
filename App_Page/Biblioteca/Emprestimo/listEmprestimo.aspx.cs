/***************************************************
 * INTRANET CELU
 * App_Page/Biblioteca/Emprestimo/listEmprestimo.aspx.cs
 * Controle de empréstimo
 * # 2011-02-11
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

public partial class App_Page_Biblioteca_Emprestimo_listEmprestimo : Celu.Library.WebPage.CPage
{

    protected void Page_Load(object sender, EventArgs e)
    {
        base.setIdPage(CSecurity.CONTROLE_EMPRESTIMO);

        if (!IsPostBack)
        {
            if (base.loadPage())
            {
                this.loadPage();
            }
        }
        else
        {
            if (!this.hdControl.Value.Equals(String.Empty))
            {
                String[] values = this.hdControl.Value.ToLower().Split(';');

                if (values[0].Equals("emprestimo"))
                {
                    this.registraEmprestimo(values[1]);
                }
                else if (values[0].Equals("devolucao"))
                {
                    this.registraDevolucao(values[1]);
                }
            }
        }

        this.hdControl.Value = String.Empty;
    }

    public override bool loadPage()
    {

        // carrega as reservas
        this.loadReserva();

        // carrega os empréstimos
        this.loadEmprestimo();

        this.ClientScript.RegisterStartupScript(this.GetType(), "table",
            " <script type=\"text/javascript\" language=\"javascript\">__table();</script>", false);

        return true;
    }

    private void loadReserva()
    {
        CListPage list = new CListPage();

        list.setIdPage(this.getIdPage());

        list.setISqlLoad("EXECUTE LOAD_LIST_RESERVA_OBRA");
        list.setFields("COD_RESERVA_OBRA;COD_MORADOR;COD_OBRA;CHR_NOME;CHR_TITULO;DT_DATAHORA");

        list.loadPage(this.tblReserva, true, false, true, "Registrar empréstimo", "javascript:__action('emprestimo','#0');");

    }

    private void loadEmprestimo()
    {
        CListPage list = new CListPage();

        list.setIdPage(this.getIdPage());

        list.setISqlLoad("EXECUTE LOAD_LIST_EMPRESTIMO_OBRA");
        list.setFields("COD_EMPRESTIMO_OBRA;COD_MORADOR;COD_OBRA;CHR_NOME;CHR_TITULO;DT_DATA_EMPRESTIMO;" + 
            "DT_DATA_DEVOLUCAO_PREVISTA;INT_CONT_RENOVACAO;CHR_DIAS_VENCIMENTO");

        list.loadPage(this.tblEmprestimo, true, false, true, "Registrar devolução", "javascript:__action('devolucao','#0');");
    }

    private void registraEmprestimo(String idReserva)
    {   
        String scripterro = "<script type=\"text/javascript\" language=\"javascript\">" +
            "alert('Houve um erro ao reservar a obra!\\n#ERRO');self.close();</script>";

        if (idReserva.Equals(String.Empty) || idReserva.Equals(String.Empty))
        {
            this.ClientScript.RegisterStartupScript(this.GetType(), "erro", scripterro, false);
        }
        else
        {
            CDataBase db = new CDataBase();

            CQuery query = db.select("EXECUTE VERIFY_INSERT_EMPRESTIMO_RESERVA_OBRA " + idReserva, "P_CHR_MSG_ERRO");

            if (query.Count() == 0)
            {
                this.ClientScript.RegisterStartupScript(this.GetType(), "erro",
                    scripterro.Replace("#ERRO", "VERIFY_INSERT_EMPRESTIMO_RESERVA_OBRA"), false);
            }
            else
            {

                if (!query.Field(0, 0).Equals(String.Empty))
                {
                    this.ClientScript.RegisterStartupScript(this.GetType(), "erro",
                        "<script type=\"text/javascript\" language=\"javascript\">" +
                        "alert('Não é possível fazer a o empréstimo!\\n" + query.Field(0, 0) + "')</script>", false);
                }
                else
                {
                    try
                    {
                        db.execute("EXECUTE INSERT_EMPRESTIMO_RESERVA_OBRA " + idReserva);
                        this.ClientScript.RegisterStartupScript(this.GetType(), "sucesso",
                            "<script type=\"text/javascript\" language=\"javascript\">" +
                            "alert('Empréstimo realizado com sucesso!')</script>", false);
                    }
                    catch (Exception ex)
                    {
                        this.ClientScript.RegisterStartupScript(this.GetType(), "erro",
                            scripterro.Replace("#ERRO", ex.Message), false);
                    }
                }
            }
        }

        this.loadPage();

    }

    private void registraDevolucao(String idReserva)
    {
        try
        {
            if (idReserva.Equals(String.Empty))
            {
                alert("Houve um erro ao registrar a devolução\\nID NOT FOUND");
            }
            else
            {
                CDataBase db = new CDataBase();

                db.execute("EXECUTE DEVOLUCAO_EMPRESTIMO_OBRA " + idReserva);

                alert("Devolução feita com sucesso!");
            }
        }
        catch(Exception ex){
            alert("Houve um erro ao registrar a devolução!\\n" + ex.Message);
        }

        this.loadPage();
    }
}


