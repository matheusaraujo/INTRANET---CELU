<!--
    INTRANET CELU
    App_Page/Sistema/Seguranca/ControlePermissao/listControlePerissao.aspx
    Página de listagem para controle de permissão
    # 2011-02-06
    Matheus Araújo
-->

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="listControlePermissao.aspx.cs" Inherits="App_Page_Sistema_Seguranca_ControlePermissao_listControlePermissao" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<!-- Cabeçalho -->
<head id="Head1" runat="server">
    
    <!-- Título -->
    <title>#</title>
    
    <!-- Arquivo CSS -->
    <link rel="Stylesheet" href="../../../../App_Style/Default/default.css" />
    
</head>

<!-- Corpo da página -->
<body>
    <form id="form1" runat="server">
    <div>
    
        <h1>Controle de Permissões</h1>
        <br />
        
        <table id="tblList" runat="server" style="width:60%" align="center">
            <tr style="background-color:Silver">
                <td colspan="2"><h3>Perfil</h3></td>                
            </tr>
        </table>
        <br />
        <table style="width:60%" align="center">
            <tr>
                <td align="right">
                    <input type="button" value="Inserir Novo" onclick="javascript:window.navigate('cadControlePermissao.aspx?perfil=-1;');" />
                </td>
            </tr>
        </table>
            
    
    </div>
    </form>
</body>

</html>
