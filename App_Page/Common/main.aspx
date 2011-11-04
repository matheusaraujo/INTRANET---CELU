<!--
    INTRANET CELU
    App_Page/Common/main.aspx
    Página de login
    # 2010-10-30
    Matheus Araújo
-->

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="main.aspx.cs" Inherits="App_Page_Common_main" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<!-- Cabeçalho -->
<head runat="server">

    <!-- Título -->
    <title>#</title>
    
    <!-- Arquivo CSS -->
    <link rel="Stylesheet" href="../../App_Style/Default/default.css" />
    
    <!-- Arquivo Script -->
    <script type="text/javascript" language="javascript" src="../../App_Script/Script.js"></script>
    
</head>

<!-- Corpo da página -->
<body>
    <form id="form1" runat="server">
    <div>
    
        <h1>Seja bem vindo à Intranet CELU!</h1>
        
        <br />
        <hr />
        <br />
        
        <h2>Aniversários do Mês</h2>
        <br />
        <table id="tblAniversario" runat="server" width="60%">
            <tr bgcolor="Gainsboro">
                <td><h3>Morador</h3></td>
                <td colspan="2"><h3>Dia</h3></td>
            </tr>            
        </table>
        
        <br />
        <hr />
        <br />
        
        <h2>Mural de Avisos</h2>
        <br />
        <table id="tblAvisos" runat="server" width="60%">
            <tr bgcolor="Gainsboro">
                <td><h3>Aviso</h3></td>
                <td><h3>Morador</h3></td>
                <td colspan="2"><h3>Data</h3></td>
            </tr>
        </table>
        
    </div>
    </form>
</body>
</html>
