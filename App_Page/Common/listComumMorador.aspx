<!--
    INTRANET CELU
    App_Page/Common/listComumMorador.aspx
    Página de listagem do quadro de moradores
    # 2011-02-07
    Matheus Araújo
-->

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="listComumMorador.aspx.cs" Inherits="App_Page_Common_listComumMorador" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<!-- Cabeçalho -->
<head id="Head1" runat="server">
    
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
    
        <h1>Quadro de Moradores</h1>
        <br />
        
        <a href="listMoradorResumida.aspx">Lista Resumida</a>
        <br />
        
        <table id="tblList" runat="server" style="width:60%" align="center">
            <tr style="background-color:Silver">
                <td><h3>Morador</h3></td>
                <td colspan="2"><h3>Perfil</h3></td>
            </tr>
        </table>
        <br />
    
    </div>
    </form>
</body>
</html>
