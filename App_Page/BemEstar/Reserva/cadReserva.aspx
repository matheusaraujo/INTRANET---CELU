<!--
    INTRANET CELU
    App_Page/BemEstar/Reserva/cadReserva.aspx
    Página de cadastro de Reserva
    # 2012-03-21
    Matheus Araújo
-->

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cadReserva.aspx.cs" Inherits="App_Page_BemEstar_Reserva_cadReserva" %>

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
        <h1>Controle de Reservas</h1>
        <br />
        
        <table id="tblCadastro" runat="server" align="center" width="60%">
            
            <!-- Código, oculto -->
            <tr style="display:none">
                <td align="right" width="30%">Código:&nbsp;</td>                
                <td><asp:TextBox ID="txtCodigo" runat="server"></asp:TextBox></td>
            </tr>
            
            <!-- Espaço de Reserva -->
            <tr>
                <td align="right">Espaço de Reserva:&nbsp;</td>                
                <td><asp:DropDownList ID="slctEspacoReserva" runat="server"></asp:DropDownList></td>
            </tr>
            
            <!-- Status da Reserva -->
            <tr>
                <td align="right">Status da Reserva:&nbsp;</td>
                <td><asp:DropDownList ID="slctStatusReserva" runat="server"></asp:DropDownList></td>
            </tr>
            
            <!-- Data/hora Inicial -->
            <tr>
                <td align="right">Data/hora inicial:&nbsp;</td>
                <td>
                    <asp:TextBox ID="txtDataHoraInicial" runat="server" style="display:hidden"></asp:TextBox>
                    <asp:Calendar ID="calDataInicial" runat="server"></asp:Calendar> <br />
                    <asp:TextBox ID="txtHoraInicial" runat="server"></asp:TextBox>&nbsp; <b>*</b>Deve estar no formato hh:mm
                </td>
                
            </tr>
            
            <!-- Data/hora final -->
            <tr>
                <td align="right">Data/hora final:&nbsp;</td>
                <td>
                    <asp:TextBox ID="txtDataHoraFinal" runat="server" style="display:none"></asp:TextBox>
                    <asp:Calendar ID="calDataFinal" runat="server"></asp:Calendar> <br />
                    <asp:TextBox ID="txtHoraFinal" runat="server"></asp:TextBox>&nbsp; <b>*</b>Deve estar no formato hh:mm
                </td>
            </tr>
            
            <!-- Evento -->
            <tr>
                <td align="right">Evento:&nbsp;</td>
                <td><asp:TextBox ID="txtEvento" runat="server"></asp:TextBox></td>
            </tr>
            
            <!-- Quantidade de Pessoas -->
            <tr>
                <td align="right">Quantidade de pessoas:&nbsp;</td>
                <td><asp:TextBox ID="txtQuantidade" runat="server"></asp:TextBox></td>
            </tr>
            
            <!-- Responsável -->
            <tr>
                <td align="right">Responsável:&nbsp;</td>
                <td><asp:TextBox ID="txtResponsavel" runat="server"></asp:TextBox></td>
            </tr>
            
            <!-- Contato -->
            <tr>
                <td align="right">Contato do responsável:&nbsp;</td>
                <td><asp:TextBox ID="txtContato" runat="server"></asp:TextBox></td>
            </tr>
            
            <!-- Origem -->
            <tr>
                <td align="right">Origem:&nbsp;</td>
                <td><asp:TextBox ID="txtOrigem" runat="server"></asp:TextBox></td>
            </tr>
            
            <!-- Observação -->
            <tr>
                <td align="right">Observação:&nbsp;</td>
                <td><asp:TextBox ID="txtObservacao" TextMode="MultiLine" runat="server"></asp:TextBox></td>
            </tr>
            
            <!-- Reserva Exclusiva -->
            <tr>
                <td colspan="2" align="center" style="border-bottom: solid 1px #000"><asp:CheckBox ID="cbReservaExclusiva" runat="server" /><b>Reserva Exclusiva</b> - Essa reserva inviabiliza outras no mesmo espaço.&nbsp;</td>                
            </tr>
            
            <!-- Data de reserva -->
            <tr>
                <td align="right">Data da Reserva:&nbsp;</td>
                <td><asp:Calendar ID="calDataReserva" runat="server"></asp:Calendar></td>
            </tr>
            
            <!-- Responsável pela reserva -->
            <tr>
                <td align="right">Responsável pela Reserva:&nbsp;</td>
                <td><asp:TextBox ID="txtResponsavelReserva" runat="server"></asp:TextBox></td>
            </tr>
            
        </table>
        
        <br />
        
        <table align="center" width="60%">
            <tr>                
                <td><asp:Button ID="btnEdit" runat="server" Text="Editar"/></td>                
                <td><asp:Button ID="btnSave" runat="server" Text="Salvar" onclick="btnSave_Click" /></td>                
                <td><asp:Button ID="btnDel" runat="server" Text="Excluir" onclick="btnDel_Click" /></td>                
                <td><asp:Button ID="btnNew" runat="server" Text="Novo" /></td>
                <td><input type="button" value="Buscar" id="btnFind" runat="server" onclick="javascript:window.navigate('reserva.aspx');"/></td>
            </tr>
        </table>
        
    
    </div>
    </form>
</body>
</html>
