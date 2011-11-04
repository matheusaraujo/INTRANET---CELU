<!--
    INTRANET CELU
    App_Page/Diretoria/Morador/cadMorador.aspx
    Página de menu
    # 2010-12-17
    Matheus Araújo
-->

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cadMorador.aspx.cs" Inherits="App_Page_Diretoria_Morador_cadMorador" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">


<!-- Cabeçalho -->
<head runat="server">
    
    <!-- Título -->
    <title>#</title>
    
    <!-- Arquivo CSS -->
    <link rel="Stylesheet" href="../../../App_Style/Default/default.css" />
    
</head>

<!-- Corpo da página -->
<body>
    <form id="form1" runat="server">
    <div>
            
        <h1>Cadastro de Moradores</h1>
        <br />
        
        <table id="tblCadastro" runat="server" align="center" width="80%">
            
            <tr>
                <td colspan="2"><h3>Informações Gerais</h3></td>
            </tr>
            
            <!-- Código, oculto -->
            <tr style="display:none">
                <td align="right" width="30%">Código:&nbsp;</td>                
                <td><asp:TextBox ID="txtCodigo" runat="server"></asp:TextBox></td>
            </tr>
            
            <!-- Ativo -->
            <tr>
                <td></td>
                <td><asp:CheckBox ID="cbAtivo" runat="server" />&nbsp;Ativo</td>
            </tr>
            
            <!-- Login -->
            <tr>
                <td align="right">Login:&nbsp;</td>                
                <td><asp:TextBox ID="txtLogin" runat="server" style="width:60%" /> </td>
            </tr>
            
            <!-- Nome -->
            <tr>
                <td align="right">Nome:&nbsp;</td>                
                <td><asp:TextBox ID="txtNome" runat="server" style="width:80%" /> </td>
            </tr>
            
            <!-- Apelido -->
            <tr>
				<td align="right">Apelido:&nbsp;</td>                
                <td><asp:TextBox ID="txtApelido" runat="server" style="width:60%" /> </td>
            </tr>
            
            <!-- Número lavanderia -->
            <tr>
                <td align="right">Número Lavanderia:</td>
                <td><asp:TextBox ID="txtNumLavanderia" runat="server"></asp:TextBox></td>
            </tr>
            
            <!-- Quarto -->
            <tr>
                <td align="right">Quarto:&nbsp;</td>
                <td><asp:DropDownList ID="slctQuarto" runat="server"></asp:DropDownList></td>
            </tr>
            
            <!-- Perfil -->
            <tr>
                <td align="right">Perfil:&nbsp;</td>                
                <td><asp:DropDownList ID="slctPerfil" runat="server"></asp:DropDownList></td>
            </tr>
            
            <!-- Status -->
            <tr>
                <td align="right">Status:&nbsp;</td>                
                <td><asp:DropDownList ID="slctStatus" runat="server"></asp:DropDownList></td>
            </tr>
            
            <!-- IES -->
            <tr>
                <td align="right">Instituição:&nbsp;</td>
                <td><asp:DropDownList ID="slctIes" runat="server"></asp:DropDownList></td>
            </tr>
            
            <!-- Curso -->
            <tr>
                <td align="right">Curso:&nbsp;</td>
                <td><asp:DropDownList ID="slctCurso" runat="server"></asp:DropDownList></td>
            </tr>
            
            <tr>
                <td colspan="2"><h3>Informações Pessoais</h3></td>
            </tr>
            
            <!-- Cidade de Origem -->
            <tr>
                <td align="right">Cidade de origem:&nbsp;</td>
                <td><asp:TextBox ID="txtCidadeOrigem" runat="server"></asp:TextBox></td>
            </tr>
            
            <!-- Celular -->
            <tr>
                <td align="right">Celular:</td>
                <td><asp:TextBox ID="txtCelular" runat="server"></asp:TextBox></td>
            </tr>
            
            <!-- E-mail -->
            <tr>
                <td align="right">E-mail:&nbsp;</td>
                <td><asp:TextBox ID="txtEmail" runat="server" Width="80%"></asp:TextBox></td>
            </tr>
            
            <!-- Endereço de Contato -->
            <tr>
                <td align="right">Endereço de Contato:&nbsp;</td>
                <td><asp:TextBox ID="txtEnderecoContato" runat="server" TextMode="MultiLine" Height="50px" Width="90%"></asp:TextBox></td>
            </tr>
            
            <!-- Telefone de Contato -->
            <tr>
                <td align="right">Telefone de Contato:&nbsp;</td>
                <td><asp:TextBox ID="txtTelefoneContato" runat="server"></asp:TextBox></td>
            </tr>
            
            <!-- Aniversário -->
            <tr>
                <td align="right">Aniversário:&nbsp;</td>
                <td><asp:TextBox ID="txtAniversario" runat="server"></asp:TextBox></td>
            </tr>
            
            <!-- Ingresso -->
            <tr>
				<td align="right">Ingresso(Semestre/Ano)&nbsp;</td>
				<td>
					<asp:DropDownList ID="slctSemestreIngresso" runat="server">
						<asp:ListItem Value="1">1</asp:ListItem>
						<asp:ListItem Value="2">2</asp:ListItem>
					</asp:DropDownList>
					&nbsp;
					<asp:TextBox ID="txtAnoIngresso" runat="server"></asp:TextBox>
				</td>
            </tr>
            
            <!-- RG -->
            <tr>
                <td align="right">RG:&nbsp;</td>
                <td><asp:TextBox ID="txtRg" runat="server"></asp:TextBox></td>
            </tr>
            
            <!-- CPF -->
            <tr>
                <td align="right">CPF:&nbsp;</td>
                <td><asp:TextBox ID="txtCpf" runat="server"></asp:TextBox></td>
            </tr>
            
            
        </table>
        <br />
        
        <table align="center" width="60%">
            <tr>                
                <td><asp:Button ID="btnEdit" runat="server" Text="Editar"/></td>                
                <td><asp:Button ID="btnSave" runat="server" Text="Salvar" onclick="btnSave_Click" /></td>                
                <td><asp:Button ID="btnDel" runat="server" Text="Excluir" onclick="btnDel_Click" /></td>                
                <td><asp:Button ID="btnNew" runat="server" Text="Novo" /></td>
                <td><input type="button" value="Buscar" id="btnFind" runat="server" onclick="javascript:window.navigate('listMorador.aspx');"/></td>
            </tr>
			<tr>
				<td colspan="5" align="right">
					<asp:Button ID="btnResetPass" runat="server" Text="Resetar senha" onclick="btnResetPass_Click" /></td>
				</td>
			</tr>
        </table>
    
    </div>
    </form>
</body>
</html>
