<!--
    INTRANET CELU
    App_Page/Sistema/Seguranca/ControlePermissao/cadControlePerissao.aspx
    Página para controle de permissão
    # 2011-02-06
    Matheus Araújo
-->

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cadControlePermissao.aspx.cs" Inherits="App_Page_Sistema_Seguranca_ControlePermissao_cadControlePermissao" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<!-- Cabeçalho -->
<head id="Head1" runat="server">
    
    <!-- Título -->
    <title>#</title>
    
    <!-- Arquivo CSS -->
    <link rel="Stylesheet" href="../../../../App_Style/Default/default.css" />
    
    <!-- Arquivo Script -->
    <script type="text/javascript" language="javascript" src="_script.js"></script>
    
</head>

<!-- Corpo da página -->
<body>
    <form id="form1" runat="server">
    <div>
    
        <input type="hidden" id="hdControl" runat="server" />
        <input type="hidden" id="hdPerfil" runat="server" />
    
        <h1>Controle de Permissões</h1>
        <br />
        
        <table id="tblList" runat="server" style="width:60%" align="center">
            <tr style="background-color:Silver">
                <td colspan="3"><h3>Item</h3></td>                
            </tr>
        </table>
        <br />
        <table style="width:60%" align="center">
            <tr>
                <td>
                    <a href="listControlePermissao.aspx">Perfis</a>
                </td>
                <td align="right">
                    <asp:Button ID="btnFinalize" Text="Finalizar" runat="server" 
                        onclick="btnFinalize_Click" />
                </td>
            </tr>
        </table>
            
    
    </div>
    </form>
</body>
</html>
