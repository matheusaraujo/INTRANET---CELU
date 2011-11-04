/***************************************************
 * INTRANET CELU
 * App_Page/Login/login.aspx.cs
 * Página de login
 * # 2010-10-30
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

public partial class App_Page_Login_login : Celu.Library.WebPage.CPage
{
    // evento onLoad da página
    protected void Page_Load(object sender, EventArgs e)
    {
        // seta o foco em login
        if (!this.IsPostBack)
        {
            this.txtUser.Focus();
            setIdPage(CSecurity.GERAL);
        }
    }

    // clique no botão de login
    protected void btnLogin_Click(object sender, EventArgs e)
    {

        // verifica se digitou informações
        if (this.txtUser.Value.Equals(String.Empty) || this.txtPass.Value.Equals(String.Empty))
        {
            base.alert("Digite nome de usuário e senha!");
        }
        else
        {
            // instancia um objeto de login
            CLogin login = new CLogin();

            // tenta executar login            
            if (!login.doLogin(this.txtUser.Value, this.txtPass.Value))
            {
                // senha errada
                this.ClientScript.RegisterStartupScript(this.GetType(), "wrongPass", 
                    "<script type=\"text/javascript\" language=\"javascript\">wrongPass('" + this.txtUser.Value + "');</script>");
            }
            else
            {
                // senha correta
                this.ClientScript.RegisterStartupScript(this.GetType(), "rightPass",
                    "<script type=\"text/javascript\" language=\"javascript\">rightPass();</script>");

                // acrescenta login à sessão
                Session.Add("login", login);

            }
            
        }



    }
}