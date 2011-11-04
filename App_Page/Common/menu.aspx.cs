/***************************************************
 * INTRANET CELU
 * App_Page/Common/menu.aspx.cs
 * Página de menu
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

public partial class App_Page_Common_menu : Celu.Library.WebPage.CPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            setIdPage(CSecurity.GERAL);
        }
    }
 
    protected void linkLogOff_Click(object sender, EventArgs e)
    {

        Session.Remove("login");

        this.ClientScript.RegisterStartupScript(this.GetType(), "logoff",
            "<script type=\"text/javascript\" language=\"javascript\">" +
            "parent.frmLeft.location = \"../../left.htm\";" +
            "parent.frmMain.location = \"../Login/login.aspx\";</script>",
            false);
    }
}