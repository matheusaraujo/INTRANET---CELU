<!--
    INTRANET CELU
    App_Page/BemEstar/Reserva/listReserva.aspx
    Página de listagem de Reserva
    # 2012-03-21
    Matheus Araújo
-->

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="listReserva.aspx.cs" Inherits="App_Page_BemEstar_Reserva_listReserva" %>

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
    
        <h1>Cadastro de Status de Reserva</h1>
        <br />
        
        <table align="center" width="50%">
        
            <tr>
                <td align="center" colspan="4" align="center">
                    <asp:DropDownList ID="slctTipoLista" runat="server">
                        <asp:ListItem Value="1" Text="Listar por espaço físico"></asp:ListItem>
                        <asp:ListItem Value="2" Text="Listar por data"></asp:ListItem>                        
                    </asp:DropDownList>
                </td>
            </tr>
            
            <tr>
                <td align="right" width="30%" colspan="2">Espaço físico:&nbsp;</td>
                <td><asp:DropDownList ID="slctEspacoFisico" runat="server" colspan="2"></asp:DropDownList></td>
                
            </tr>
            
            <tr>
                <td align="right">Data inicial:&nbsp;</td>
                <td><asp:Calendar ID="calDataInicial" runat="server"></asp:Calendar></td>
            
                <td align="right">Data final:&nbsp;</td>
                <td><asp:Calendar ID="calDataFinal" runat="server"></asp:Calendar></td>
            </tr>
            
            <tr>
                <td colspan="4" align="center" style="border-top:solid 1px #000">
                <br />
                    <asp:Button ID="btnList" Text="Listar" runat="server" onclick="btnList_Click" />
                </td>
            </tr>
        
        </table>
        
        <br />
        
        <table id="tblList" runat="server" style="width:80%" align="center">
            <tr style="background-color:Silver">
                <td><h3>Evento</h3></td>
                <td><h3>Espaço</h3></td>
                <td><h3>Responsável</h3></td>                
                <td><h3>Data/Hora Início</h3></td>
                <td><h3>Data/Hora Fim</h3></td>                
                <td colspan="2"><h3>Status</h3></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
