<!--
    INTRANET CELU
    App_Page/Biblioteca/Obra/listObra.aspx
    Página de listagem de Obra
    # 2011-02-08
    Matheus Araújo
-->

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="listObra.aspx.cs" Inherits="App_Page_Biblioteca_Obra_listObra" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<!-- Cabeçalho -->
<head id="Head1" runat="server">
    
    <!-- Título -->
    <title>#</title>
    
    <!-- Arquivo CSS -->
    <link rel="Stylesheet" href="../../../App_Style/Default/default.css" />
    
</head>

<!-- Corpo da página -->
<body>
    <form id="form1" runat="server">
    <div>
    
        <h1>Controle de Acervo</h1>
        <br />
        
        <table style="width:60%" align="center">
            <tr>
                <td align="right">Tipo:&nbsp;</td>
                <td><asp:DropDownList ID="slctTipoObra" runat="server"></asp:DropDownList></td>  
                <td align="right">Palvra Chave:&nbsp;</td>
                <td><asp:TextBox ID="txtTexto" runat="server"></asp:TextBox></td>
            </tr>
            
            <tr>
                <td colspan="4" align="center">
                    <asp:Button ID="btnFind" Text="Buscar" runat="server" onclick="btnFind_Click" />
                </td>
            </tr>
            
        </table>
            
        <br />
        
        <table id="tblList" runat="server" style="width:80%" align="center">
            <tr>
                <td align="right" colspan="4">
                    <input type="button" value="Inserir Novo" onclick="javascript:window.navigate('cadObra.aspx?obra=-1;');" />
                </td>
            </tr>
            <tr style="background-color:Silver">
                <td><h3>Número de Chamada</h3></td>                
                <td><h3>Título</h3></td>
                <td colspan="2"><h3>Autor</h3></td>
            </tr>
        </table>
        <br />
        
        <table style="width:60%" align="center">
            <tr>
        
            </tr>
        </table>
    
    </div>
    </form>
</body>

</html>
