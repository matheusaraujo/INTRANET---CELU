<!--
    INTRANET CELU
    \App_Page\BemEstar\HospedePermanentePagamento\cadHospedePermanentePagamento.aspx
    Página de registro de pagamento de Hóspede Permanente
    # 2012-01-16
    Matheus Araújo
-->

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cadHospedePermanentePagamento.aspx.cs" Inherits="App_Page_BemEstar_HospedePermanentePagamento_cadHospedePermanentePagamento" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<!-- Cabeçalho -->
<head id="Head1" runat="server">
    
    <!-- Título -->
    <title>#</title>
    
    <!-- Arquivo CSS -->
    <link rel="Stylesheet" href="../../../App_Style/Default/default.css" />
    
</head>

<!-- Corpo da Página -->
<body>
    <form id="form1" runat="server">
    <div>
        
        <h1>Registro de Pagamento de Hóspede Permanente</h1>
        <br />
        
        <table id="tblCadastro" runat="server" align="center" width="60%">
            
            <!-- Hóspede -->
            <tr>
                <td align="right" style="width:30%">Hóspede:&nbsp;</td>
                <td><asp:DropDownList ID="slctHospede" runat="server"></asp:DropDownList></td>
            </tr>
            
            <!-- Mês -->
            <tr>
                <td align="right">Mês:&nbsp;</td>
                <td>
                    <asp:DropDownList ID="slctMes" runat="server">
                        <asp:ListItem Value="1" Text="1 - Janeiro"></asp:ListItem>
                        <asp:ListItem Value="2" Text="2 - Fevereiro"></asp:ListItem>
                        <asp:ListItem Value="3" Text="3 - Março"></asp:ListItem>
                        <asp:ListItem Value="4" Text="4 - Abril"></asp:ListItem>
                        <asp:ListItem Value="5" Text="5 - Maio"></asp:ListItem>
                        <asp:ListItem Value="6" Text="6 - Junho"></asp:ListItem>
                        <asp:ListItem Value="7" Text="7 - Julho"></asp:ListItem>
                        <asp:ListItem Value="8" Text="8 - Agosto"></asp:ListItem>
                        <asp:ListItem Value="9" Text="9 - Setembro"></asp:ListItem>
                        <asp:ListItem Value="10" Text="10 - Outubro"></asp:ListItem>
                        <asp:ListItem Value="11" Text="11 - Novembro"></asp:ListItem>
                        <asp:ListItem Value="12" Text="12 - Dezembro"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            
            <!-- Ano -->
            <tr>
                <td align="right">Ano:&nbsp;</td>
                <td><asp:TextBox ID="txtAno" runat="server"></asp:TextBox></td>
            </tr>
            
            <!-- Valor -->
            <tr>
                <td align="right">Valor pago:&nbsp;</td>
                <td><asp:TextBox ID="txtValor" runat="server"></asp:TextBox></td>
            </tr>
            
            <!-- Data de pagamento -->
            <tr>
                <td align="right">Data de pagamento:&nbsp;</td>
                <td><asp:Calendar ID="calDtPagamento" runat="server"></asp:Calendar></td>
            </tr>
            
            <!-- Observação -->
            <tr>
                <td align="right">Observação:&nbsp;</td>
                <td><asp:TextBox ID="txtObservacao" runat="server" TextMode="MultiLine"></asp:TextBox></td>
            </tr>
            
        </table>
        
        <br />
        <table align="center" width="60%">
            <tr>                
                <td><asp:Button ID="btnEdit" runat="server" Text="Editar" style="visibility:hidden"/></td>                
                <td><asp:Button ID="btnSave" runat="server" Text="Inserir" onclick="btnSave_Click" /></td>                
                <td><asp:Button ID="btnDel" runat="server" Text="Excluir" onclick="btnDel_Click" style="visibility:hidden" /></td>                
                <td><asp:Button ID="btnNew" runat="server" Text="Novo" /></td>
            </tr>
            <tr>
                <td colspan="4" align="center"><input type="button" value="Controle de Pagamento" id="btnFind" runat="server" onclick="javascript:window.navigate('hospedePermanentePagamento.aspx');"/></td>
            </tr>
        </table>
        
    </div>
    </form>
</body>
</html>
