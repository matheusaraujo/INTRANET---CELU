<!--
    INTRANET CELU
    App_Page/Biblioteca/Obra/cadObra.aspx
    Página de cadastro de Obra
    # 2011-02-08
    Matheus Araújo
-->

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cadObra.aspx.cs" Inherits="App_Page_Biblioteca_Obra_cadObra" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<!-- Cabeçalho -->
<head id="Head1" runat="server">
    
    <!-- Título -->
    <title>#</title>
    
    <!-- Arquivo CSS -->
    <link rel="Stylesheet" href="../../../App_Style/Default/default.css" />
    
</head>

<body>
    <form id="form1" runat="server">
    <div>
        <h1>Cadastro Obra</h1>
        <br />
        
        <table id="tblCadastro" runat="server" align="center" width="80%">
            
            <!-- Código, oculto -->
            <tr style="display:none">
                <td align="right" width="30%">Código:&nbsp;</td>                
                <td><asp:TextBox ID="txtCodigo" runat="server"></asp:TextBox></td>
            </tr>
            
            <!-- Tipo de Obra -->
            <tr>
                <td align="right">Tipo de Obra:&nbsp;</td>
                <td><asp:DropDownList ID="slctTipoObra" runat="server"></asp:DropDownList></td>
            </tr>
            
            <!-- Número chamada -->
            <tr>
                <td align="right">Número de chamada:&nbsp;</td>
                <td><asp:TextBox ID="txtNumChamada" runat="server"></asp:TextBox></td>
            </tr>
            
            <!-- Título -->
            <tr>
                <td align="right">Título:&nbsp;</td>
                <td><asp:TextBox ID="txtTitulo" runat="server" Width="90%"></asp:TextBox></td>
            </tr>
            
            <!-- Autor de Obra -->
            <tr>
                <td align="right">Autor de Obra:&nbsp;</td>
                <td><asp:DropDownList ID="slctAutorObra" runat="server"></asp:DropDownList></td>
            </tr>
            
            <!-- Edição -->
            <tr>
                <td align="right">Edição:&nbsp;</td>
                <td><asp:TextBox ID="txtEdicao" runat="server"></asp:TextBox></td>
            </tr>
            
            <!-- Publicação -->
            <tr>
                <td align="right">Publicação:&nbsp;</td>
                <td><asp:TextBox ID="txtPublicacao" runat="server"></asp:TextBox></td>
            </tr>
            
            <!-- Normalização -->
            <tr>
                <td align="right">Normalização:&nbsp;</td>
                <td><asp:TextBox ID="txtNormalizacao" runat="server"></asp:TextBox></td>
            </tr>
            
            <!-- Assunto de Obra -->
            <tr>
                <td align="right">Assunto de Obra:&nbsp;</td>
                <td><asp:DropDownList ID="slctAssuntoObra" runat="server"></asp:DropDownList></td>
            </tr>
            
            <!-- Status de Obra -->
            <tr>
                <td align="right">Status:&nbsp;</td>
                <td><asp:TextBox ID="txtStatusObra" runat="server"></asp:TextBox></td>
            </tr>
            
        </table>
        
        <br />
        <table align="center" width="60%">
            <tr>                
                <td><asp:Button ID="btnEdit" runat="server" Text="Editar"/></td>                
                <td><asp:Button ID="btnSave" runat="server" Text="Salvar" onclick="btnSave_Click" /></td>                
                <td><asp:Button ID="btnDel" runat="server" Text="Excluir" onclick="btnDel_Click" /></td>                
                <td><asp:Button ID="btnNew" runat="server" Text="Novo" /></td>
                <td><input type="button" value="Buscar" id="btnFind" runat="server" onclick="javascript:window.navigate('listObra.aspx');"/></td>
            </tr>
        </table>
        
    
    </div>
    </form>
</body>

</html>
