<!--
    INTRANET CELU
    \App_Page\BemEstar\HospedePermanente\cadHospedePermanente.aspx
    Página de cadastro de Hóspede Permanente
    # 2012-01-16
    Matheus Araújo
-->

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cadHospedePermanente.aspx.cs" Inherits="App_Page_BemEstar_HospedePermanente_cadHospedePermanente" %>

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
        <h1>Cadastro de Hóspede Permanente</h1>
        <br />
        
        <table id="tblCadastro" runat="server" align="center" width="60%">
            
            <!-- Código, oculto -->
            <tr style="display:none">
                <td align="right" width="30%" colspan="2">Código:&nbsp;</td>                
                <td><asp:TextBox ID="txtCodigo" runat="server" colspan="2"></asp:TextBox></td>
            </tr>
            
            <!-- Quarto -->
            <tr>
                <td align="right" colspan="2">Quarto:&nbsp;</td>
                <td><asp:DropDownList ID="slctQuarto" runat="server" colspan="2"></asp:DropDownList></td>
            </tr>
            
            <!-- Nome -->
            <tr>
                <td align="right" colspan="2">Nome:&nbsp;</td>                
                <td ><asp:TextBox ID="txtNome" runat="server" colspan="2 /> </td>
            </tr>
            
            <!-- RG -->
            <tr>
                <td align="right" colspan="2">RG:&nbsp;</td>
                <td><asp:TextBox ID="txtRg" runat="server" colspan="2"></asp:TextBox></td>
            </tr>
            
            <!-- CPF -->
            <tr>
                <td align="right" colspan="2">CPF:&nbsp;</td>
                <td><asp:TextBox ID="txtCpf" runat="server" colspan="2"></asp:TextBox></td>
            </tr>
            
            <!-- Cidade de Origem -->
            <tr>
                <td align="right" colspan="2">Cidade de Origem:&nbsp;</td>
                <td><asp:DropDownList ID="slctCidade" runat="server" colspan="2></asp:DropDownList></td>
            </tr>
            
            <!-- Curso -->
            <tr>
                <td align="right" colspan="2">Curso:&nbsp;</td>
                <td><asp:TextBox ID="txtCurso" runat="server" colspan="2"></asp:TextBox></td>
            </tr>
            
            <!-- Recepção -->
            <tr>
                <td align="right" colspan="2">Recepção:&nbsp;</td>
                <td><asp:TextBox ID="txtRecepcao" runat="server" colspan="2"></asp:TextBox></td>
            </tr>
            
            <!-- Dia de vencimento -->
            <tr>
                <td align="right" colspan="2">Dia (do mês) de vencimento:&nbsp;</td>
                <td><asp:TextBox ID="txtDiaVencimento" runat="server" colspan="2"></asp:TextBox></td>
            </tr>
            
            <!-- Datas de ingresso e saída-->
            <tr>
                <td align="right">Data de ingresso:&nbsp;</td>
                <td><asp:Calendar ID="calDtIngresso" runat="server"></asp:Calendar></td>
                <td align="right">Data de saída:&nbsp;</td>
                <td><asp:Calendar ID="calDtSaida" runat="server"></asp:Calendar></td>
            </tr>
            
            <!-- Ativo -->
            <tr>
                <td colspan="4" align="center">
                    <asp:CheckBox ID="cbAtivo" runat="server" /> &nbsp; Ativo 
                </td>
            </tr>
            
        </table>
        <br />
        <table align="center" width="60%">
            <tr>                
                <td><asp:Button ID="btnEdit" runat="server" Text="Editar"/></td>                
                <td><asp:Button ID="btnSave" runat="server" Text="Salvar" onclick="btnSave_Click" /></td>                
                <td><asp:Button ID="btnDel" runat="server" Text="Excluir" onclick="btnDel_Click" /></td>                
                <td><asp:Button ID="btnNew" runat="server" Text="Novo" /></td>
                <td><input type="button" value="Buscar" id="btnFind" runat="server" onclick="javascript:window.navigate('listHospedePermanente.aspx');"/></td>
            </tr>
        </table>
        
    
    </div>
    </form>
</body>
</html>

