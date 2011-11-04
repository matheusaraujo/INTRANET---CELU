<!--
    INTRANET CELU
    App_Page/Common/myinfo.aspx
    Página para usuário preencher as próprias informações
    # 2011-02-05
    Matheus Araújo
-->

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="myinfo.aspx.cs" Inherits="App_Page_Common_myinfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<!-- Cabeçalho -->
<head id="Head1" runat="server">
    
    <!-- Título -->
    <title>#</title>
    
    <!-- Arquivo CSS -->
    <link rel="Stylesheet" href="../../App_Style/Default/default.css" />
    
    <! -- Script -->
    <script type="text/javascript"  language="javascript" src="../../App_Script/Script.js"></script>
    
</head>

<!-- Corpo da página -->
<body>
    <form id="form1" runat="server">
    <div>
        
        <h1>Minhas informações</h1>
        <br />
        
        <table id="tblCadastro" runat="server" align="center" width="80%">
        
			<tr>
				<td colspan="2" align="right"><a href="foto.aspx">Enviar foto</a></td>
			</tr>
            
            <tr>
                <td colspan="2"><h3>Informações Gerais</h3></td>
            </tr>
            
            <!-- Código, oculto -->
            <tr style="display:none">
                <td align="right" width="30%">Código:&nbsp;</td>                
                <td><asp:TextBox ID="txtCodigo" runat="server"></asp:TextBox></td>
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
                <td><asp:TextBox ID="txtQuarto" runat="server"></asp:TextBox></td>
            </tr>
            
            <!-- Perfil -->
            <tr>
                <td align="right">Perfil:&nbsp;</td>                
                <td><asp:TextBox ID="txtPerfil" runat="server" style="width:60%" ></asp:TextBox></td>
            </tr>
            
            <!-- Status -->
            <tr>
                <td align="right">Status:&nbsp;</td>                
                <td><asp:TextBox ID="txtStatus" runat="server" style="width:60%" ></asp:TextBox></td>
            </tr>
            
            <!-- IES -->
            <tr>
                <td align="right">Instituição:&nbsp;</td>
                <td><asp:TextBox ID="txtIes" runat="server" style="width:80%" ></asp:TextBox></td>
            </tr>
            
            <!-- Curso -->
            <tr>
                <td align="right">Curso:&nbsp;</td>
                <td><asp:TextBox ID="txtCurso" runat="server" style="width:80%" ></asp:TextBox></td>
            </tr>
            
            <tr>
                <td colspan="2"><h3>Informações Pessoais</h3></td>
            </tr>
            
            <!-- Cidade de Origem -->
            <tr>
                <td align="right">Cidade de origem:&nbsp;</td>
                <td>
					<asp:DropDownList ID="slctCidadeOrigem" runat="server"></asp:DropDownList>&nbsp;
					<a href="#" onclick="javascript:__openPopUp('miniCadCidade.aspx', 'cidade', true, 200, 300, false, false, false);">Inserir</a>
				</td>
            </tr>
            
            <!-- Celular -->
            <tr>
                <td align="right">Celular:&nbsp;</td>
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
                <td>
                    <asp:DropDownList ID="slctDiaAniversario" runat="server">
                        <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                        <asp:ListItem Value="5">5</asp:ListItem>
                        <asp:ListItem Value="6">6</asp:ListItem>
                        <asp:ListItem Value="7">7</asp:ListItem>
                        <asp:ListItem Value="8">8</asp:ListItem>
                        <asp:ListItem Value="9">9</asp:ListItem>
                        <asp:ListItem Value="10">10</asp:ListItem>
                        <asp:ListItem Value="11">11</asp:ListItem>
                        <asp:ListItem Value="12">12</asp:ListItem>
                        <asp:ListItem Value="13">13</asp:ListItem>
                        <asp:ListItem Value="14">14</asp:ListItem>
                        <asp:ListItem Value="15">15</asp:ListItem>
                        <asp:ListItem Value="16">16</asp:ListItem>
                        <asp:ListItem Value="17">17</asp:ListItem>
                        <asp:ListItem Value="18">18</asp:ListItem>
                        <asp:ListItem Value="19">19</asp:ListItem>
                        <asp:ListItem Value="20">20</asp:ListItem>
                        <asp:ListItem Value="21">21</asp:ListItem>
                        <asp:ListItem Value="22">22</asp:ListItem>
                        <asp:ListItem Value="23">23</asp:ListItem>
                        <asp:ListItem Value="24">24</asp:ListItem>
                        <asp:ListItem Value="25">25</asp:ListItem>
                        <asp:ListItem Value="26">26</asp:ListItem>
                        <asp:ListItem Value="27">27</asp:ListItem>
                        <asp:ListItem Value="28">28</asp:ListItem>
                        <asp:ListItem Value="29">29</asp:ListItem>
                        <asp:ListItem Value="30">30</asp:ListItem>
                        <asp:ListItem Value="31">31</asp:ListItem>
                    </asp:DropDownList>&nbsp;
                    <asp:DropDownList ID="slctMesAniversario" runat="server">
                        <asp:ListItem Value="1">Janeiro</asp:ListItem>
                        <asp:ListItem Value="2">Fevereiro</asp:ListItem>
                        <asp:ListItem Value="3">Março</asp:ListItem>
                        <asp:ListItem Value="4">Abril</asp:ListItem>
                        <asp:ListItem Value="5">Maio</asp:ListItem>
                        <asp:ListItem Value="6">Junho</asp:ListItem>
                        <asp:ListItem Value="7">Julho</asp:ListItem>
                        <asp:ListItem Value="8">Agosto</asp:ListItem>
                        <asp:ListItem Value="9">Setembro</asp:ListItem>
                        <asp:ListItem Value="10">Outubro</asp:ListItem>
                        <asp:ListItem Value="11">Novembro</asp:ListItem>
                        <asp:ListItem Value="12">Dezembro</asp:ListItem>
                    </asp:DropDownList>
                </td>
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
                <td style="display:none"><asp:Button ID="btnDel" runat="server" Text="Excluir" onclick="btnDel_Click" /></td>                
                <td style="display:none"><asp:Button ID="btnNew" runat="server" Text="Novo" /></td>
                <td style="display:none"><input type="button" value="Buscar" id="btnFind" runat="server" onclick="javascript:window.navigate('listMorador.aspx');"/></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
