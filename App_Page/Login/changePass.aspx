<!--
    INTRANET CELU
    App_Page/Login/changePass.aspx
    Página para trocar senha
    # 2011-02-05
    Matheus Araújo
-->

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="changePass.aspx.cs" Inherits="App_Page_Login_changePass" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<!-- Cabeçalho -->
<head id="Head1" runat="server">

    <!-- Título -->
    <title>#</title>
    
    <!-- Arquivo CSS -->
    <link rel="Stylesheet" href="../../App_Style/Default/default.css" />
    
</head>

<body>
    <form id="form1" runat="server">
    <div>
    
        <h1>Trocar senha</h1>
        <table>
            <tr>
                <td>Senha antiga:</td>
                <td><asp:TextBox ID="txtOld" runat="server" TextMode="Password"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Senha nova:</td>
                <td><asp:TextBox ID="txtNew" runat="server" TextMode="Password"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Repetir senha nova:</td>
                <td><asp:TextBox ID="txtNew2" runat="server" TextMode="Password"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2"><asp:Button ID="btnChange" runat="server" Text="Trocar" 
                        onclick="btnChange_Click" /></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
