<!--
    INTRANET CELU
    App_Page/Avisos/Recado/meusRecados.aspx
    Página de listagem de recados enviados por mim
    # 2011-04-09
    Matheus Araújo
-->

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="meusRecados.aspx.cs" Inherits="App_Page_Avisos_Recado_meusRecados" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<!-- Cabeçalho -->
<head id="Head1" runat="server">
    
    <!-- Título -->
    <title>#</title>
    
    <!-- Arquivo CSS -->
    <link rel="Stylesheet" href="../../../App_Style/Default/default.css" />
    
    <!-- Script -->
    <script type="text/javascript" language="javascript" src="../../../App_Script/Script.js"></script>
    
</head>

<!-- Corpo da página -->
<body>
    <form id="form1" runat="server">
    <div>
    
        <h1>Quadro de Recados</h1>
        <br />
        
        <table id="tblList" runat="server" style="width:60%" align="center">
            <tr style="background-color:Silver">
                <td><h3>Assunto</h3></td>                
                <td colspan="2"><h3>Data</h3></td>
            </tr>
        </table>
        <br />
        <table style="width:60%" align="center">
            <tr>
                <td align="right">
                    <input type="button" value="Novo recado" onclick="javascript:window.navigate('cadRecado.aspx');" />
                </td>
            </tr>
        </table>
            
    
    </div>
    </form>
</body>
</html>
