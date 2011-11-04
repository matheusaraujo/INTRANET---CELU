/***************************************************
 * INTRANET CELU
 * App_Page/Login/changePass.aspx.cs
 * Página para trocar senha
 * # 2011-02-05
 * Matheus Araújo 
 ***************************************************/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Celu.Library.Security;

public partial class App_Page_Login_changePass : Celu.Library.WebPage.CPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            setIdPage(CSecurity.GERAL);
            loadPage();
        }

    }
    protected void btnChange_Click(object sender, EventArgs e)
    {
        alert(((CLogin)Session["login"]).changePass(this.txtOld.Text, this.txtNew.Text, this.txtNew2.Text));
    }
}
