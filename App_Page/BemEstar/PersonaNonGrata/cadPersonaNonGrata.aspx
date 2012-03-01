<!--
    INTRANET CELU
    \App_Page\BemEstar\PersonaNonGrata\cadPersonaNonGrata.aspx
    Página de cadastro de Persona Non Grata
    # 2012-01-03
    Matheus Araújo
-->

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cadPersonaNonGrata.aspx.cs" Inherits="App_Page_BemEstar_PersonaNonGrata_cadPersonaNonGrata" %>

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
        <h1>Cadastro de Persona Non Grata</h1>
        <br />
        
        <table id="tblCadastro" runat="server" align="center" width="60%">
            
            <!-- Código, oculto -->
            <tr style="display:none">
                <td colspan="2" align="right" width="30%">Código:&nbsp;</td>                
                <td colspan="2"><asp:TextBox ID="txtCodigo" runat="server"></asp:TextBox></td>
            </tr>
            
            <!-- Data de Entrada / Data de Saída -->
            <tr>
                <td align="right">Data de Entrada:&nbsp;</td>
                <td><asp:Calendar ID="calDtEntrada" runat="server"></asp:Calendar></td>
            
                <td align="right">Data de Saída:&nbsp;</td>
                <td><asp:Calendar ID="calDtSaida" runat="server"></asp:Calendar></td>
            </tr>
            
            <!-- Quarto -->
            <tr>
                <td colspan="2" align="right">Quarto:&nbsp;</td>                
                <td colspan="2"><asp:TextBox ID="txtQuarto" runat="server" /> </td>
            </tr>
            
            <!-- Nome -->
            <tr>
                <td colspan="2" align="right">Nome:&nbsp;</td>                
                <td colspan="2"><asp:TextBox ID="txtNome" runat="server" /> </td>
            </tr>
            
            <!-- Período em Aberto -->
            <tr>
                <td colspan="2" align="right">Período em Aberto:&nbsp;</td>                
                <td colspan="2"><asp:TextBox ID="txtPeriodoAberto" runat="server" /> </td>
            </tr>
            
            
            <!-- Débito -->
            <tr>
                <td colspan="2" align="right">Débito:&nbsp;</td>                
                <td colspan="2"><asp:TextBox ID="txtDebito" runat="server" /> </td>
            </tr>
            
            <!-- Observação -->
            <tr>
                <td colspan="2" align="right">Observação:&nbsp;</td>                
                <td colspan="2"><asp:TextBox ID="txtObservacao" runat="server" TextMode="MultiLine" /> </td>
            </tr>
            
            <!-- Em Aberto -->
            <tr>
                <td colspan="4" align="center">
                    <asp:CheckBox ID="cbEmAberto" runat="server" /> &nbsp; Em Aberto 
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
                <td><input type="button" value="Buscar" id="btnFind" runat="server" onclick="javascript:window.navigate('listPersonaNonGrata.aspx');"/></td>
            </tr>
        </table>
        
    
    </div>
    </form>
</body>
</html>
