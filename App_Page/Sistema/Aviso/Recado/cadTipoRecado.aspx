<!--
    INTRANET CELU
    App_Page/Sistema/Aviso/Recado/cadTipoRecado.aspx
    Página de cadastro de Tipo de Recado
    # 2011-04-09
    Matheus Araújo
-->

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cadTipoRecado.aspx.cs" Inherits="App_Page_Sistema_Aviso_Recado_cadTipoRecado" %>

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
        <h1>Cadastro de Tipo de Recado</h1>
        <br />
        
        <table id="tblCadastro" runat="server" align="center" width="90%">
            
            <!-- Código, oculto -->
            <tr style="display:none">
                <td align="right" width="30%">Código:&nbsp;</td>                
                <td><asp:TextBox ID="txtCodigo" runat="server"></asp:TextBox></td>
            </tr>
            
            <!-- Descrição -->
            <tr>
                <td align="right">Tipo de Recado:&nbsp;</td>                
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
                <td><input type="button" value="Buscar" id="btnFind" runat="server" onclick="javascript:window.navigate('listTipoRecado.aspx');"/></td>
            </tr>
        </table>
        
        <table width="100%">
			<!-- Controle de visualização -->
			<tr>
				<td>				
					<a href="#" onclick="javascript:document.getElementById('iframecontrole').src='controleTipoRecado.aspx?tiporecado=' + document.getElementById('txtCodigo').value + ';';" />Controle de Visualização</a>
				</td>
			</tr>
			<tr>
				<td>
					<iframe frameborder="0" width="100%" id="iframecontrole" scrolling="auto" height="600px" />				
				</td>
			</tr>
		</table>
        
    
    </div>
    </form>
</body>
</html>
