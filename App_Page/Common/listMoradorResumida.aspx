<%@ Page Language="C#" AutoEventWireup="true" CodeFile="listMoradorResumida.aspx.cs" Inherits="App_Page_Common_listMoradorResumida" %>

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
        
        <table style="width:80%;border-top:2px solid #000" align="center">
			<tr>
				<td><asp:CheckBox ID="cbApelido" runat="server" />&nbsp;Apelido</td>
				<td><asp:CheckBox ID="cbNumLavanderia" runat="server" />&nbsp;Número Lavanderia</td>
				<td><asp:CheckBox ID="cbPerfil" runat="server" />&nbsp;Perfil</td>
				<td><asp:CheckBox ID="cbStatus" runat="server" />&nbsp;Status</td>
				<td><asp:CheckBox ID="cbIes" runat="server" />&nbsp;Instituição de Ensino</td>
				<td><asp:CheckBox ID="cbCurso" runat="server" />&nbsp;Curso</td>
			</tr>
			<tr style="border-bottom:1px solid #000;">
				<td><asp:CheckBox ID="cbQuarto" runat="server" />&nbsp;Quarto</td>
				<td><asp:CheckBox ID="cbCidadeOrigem" runat="server" />&nbsp;Cidade de Origem</td>
				<td><asp:CheckBox ID="cbAniversario" runat="server" />&nbsp;Aniversário</td>
				<td><asp:CheckBox ID="cbIngresso" runat="server" />&nbsp;Ingresso</td>
				<td><asp:CheckBox ID="cbTelefone" runat="server" />&nbsp;Telefone</td>
				<td><asp:CheckBox ID="cbEmail" runat="server" />&nbsp;E-mail</td>
			</tr>
			<tr>
				<td colspan="6" align="center" style="border-bottom:2px solid #000;">
					&nbsp;<br />
					<asp:Button ID="btnList" runat="server" Text="Listar" onclick="btnList_Click" />
					<br />&nbsp;
				</td>
			</tr>
        </table>
        
        <br />
        <br />
        
        <table id="tblList" runat="server" style="width:95%;display:none" align="center">
            <tr style="background-color:Silver">                           
            </tr>
        </table>
        <br />
    
    </div>
    </form>
</body>
