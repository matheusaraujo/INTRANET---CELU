<!--
    INTRANET CELU
    App_Page/Biblioteca/TipoObra/cadTipoObra.aspx
    Página de cadastro de Tipo de Obra
    # 2011-02-08
    Matheus Araújo
-->

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cadTipoObra.aspx.cs" Inherits="App_Page_Biblioteca_TipoObra_cadTipoObra" %>

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
        <h1>Cadastro de Tipo de Obra</h1>
        <br />
        
        <table id="tblCadastro" runat="server" align="center" width="60%">
            
            <!-- Código, oculto -->
            <tr style="display:none">
                <td align="right" width="30%">Código:&nbsp;</td>                
                <td><asp:TextBox ID="txtCodigo" runat="server"></asp:TextBox></td>
            </tr>
            
            <!-- Permite empréstimo -->
            <tr>
                <td colspan="2"><asp:CheckBox ID="cbPermiteEmprestimo" runat="server" />&nbsp;Permite empréstimo</td>
            </tr>
            
            <!-- Tipo -->
            <tr>
                <td align="right">Tipo de Obra:&nbsp;</td>                
                <td><asp:TextBox ID="txtDesc" runat="server" /> </td>
            </tr>
            
        </table>
        <br />
        <table align="center" width="60%">
            <tr>                
                <td><asp:Button ID="btnEdit" runat="server" Text="Editar"/></td>                
                <td><asp:Button ID="btnSave" runat="server" Text="Salvar" onclick="btnSave_Click" /></td>                
                <td><asp:Button ID="btnDel" runat="server" Text="Excluir" onclick="btnDel_Click" /></td>                
                <td><asp:Button ID="btnNew" runat="server" Text="Novo" /></td>
                <td><input type="button" value="Buscar" id="btnFind" runat="server" onclick="javascript:window.navigate('listTipoObra.aspx');"/></td>
            </tr>
        </table>
        
    
    </div>
    </form>
</body>
</html>
