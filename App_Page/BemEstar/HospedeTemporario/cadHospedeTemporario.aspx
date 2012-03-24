<!--
    INTRANET CELU
    \App_Page\BemEstar\HospedeTemporario\cadHospedeTemporario.aspx
    Página de cadastro de Hóspede Temporário
    # 2012-01-23
    Matheus Araújo
-->
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cadHospedeTemporario.aspx.cs" Inherits="App_Page_BemEstar_HospedeTemporario_cadHospedeTemporario" %>

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
        <h1>Cadastro de Hóspede Temporário</h1>
        <br />
        
        <table id="tblCadastro" runat="server" align="center" width="60%">
            
            <!-- Código, oculto -->
            <tr style="display:none">
                <td align="right" width="30%" colspan="2">Código:&nbsp;</td>                
                <td><asp:TextBox ID="txtCodigo" runat="server" colspan="2"></asp:TextBox></td>
            </tr>
            
            <!-- Datas de ingresso e saída-->
            <tr>
                <td align="right">Data de entrada:&nbsp;</td>
                <td><asp:Calendar ID="calDtIngresso" runat="server"></asp:Calendar></td>
                <td align="right">Data de saída:&nbsp;</td>
                <td><asp:Calendar ID="calDtSaida" runat="server"></asp:Calendar></td>
            </tr>
            
            <!-- Evento -->
            <tr>
                <td align="right" colspan="2">Evento:&nbsp;</td>                
                <td ><asp:TextBox ID="txtEvento" runat="server" colspan="2" /> </td>
            </tr>
            
            <!-- Responsável -->
            <tr>
                <td align="right" colspan="2">Responsável:&nbsp;</td>                
                <td ><asp:TextBox ID="txtResponsavel" runat="server" colspan="2" /> </td>
            </tr>
            
            <!-- Contato -->
            <tr>
                <td align="right" colspan="2">Contato:&nbsp;</td>
                <td><asp:TextBox ID="txtContato" runat="server" colspan="2"></asp:TextBox></td>
            </tr>
            
            <!-- Quantidade de pessoas -->
            <tr>
                <td align="right" colspan="2">Quantidade de Pessoas:&nbsp;</td>
                <td><asp:TextBox ID="txtQtdPessoas" runat="server" colspan="2"></asp:TextBox></td>
            </tr>
            
            <!-- Quantidade de pernoites -->
            <tr>
                <td align="right" colspan="2">Quantidade de Pernoites:&nbsp;</td>
                <td><asp:TextBox ID="txtQtdPernoites" runat="server" colspan="2"></asp:TextBox></td>
            </tr>
            
            <!-- Valor -->
            <tr>
                <td align="right" colspan="2">Valor:&nbsp;</td>
                <td><asp:TextBox ID="txtValor" runat="server" colspan="2"></asp:TextBox></td>
            </tr>
            
            <!-- Situação -->
            <tr>
                <td align="right" colspan="2">Situação:&nbsp;</td>
                <td><asp:TextBox ID="txtSituacao" runat="server" colspan="2"></asp:TextBox></td>
            </tr>
            
            
            <!-- Observação -->
            <tr>
                <td align="right" colspan="2">Observação:&nbsp;</td>
                <td><asp:TextBox ID="txtObservacao" runat="server" colspan="2" TextMode="MultiLine"></asp:TextBox></td>
            </tr>
            
        </table>
        <br />
        <table align="center" width="60%">
            <tr>                
                <td><asp:Button ID="btnEdit" runat="server" Text="Editar"/></td>                
                <td><asp:Button ID="btnSave" runat="server" Text="Salvar" onclick="btnSave_Click" /></td>                
                <td><asp:Button ID="btnDel" runat="server" Text="Excluir" onclick="btnDel_Click" /></td>                
                <td><asp:Button ID="btnNew" runat="server" Text="Novo" /></td>
                <td><input type="button" value="Buscar" id="btnFind" runat="server" onclick="javascript:window.navigate('listHospedeTemporario.aspx');"/></td>
            </tr>
        </table>
        
    
    </div>
    </form>
</body>
</html>
