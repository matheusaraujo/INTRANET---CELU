<!--
    INTRANET CELU
    \App_Page\BemEstar\HospedePermanentePagamento\listHistoricoHospede.aspx
    Página para listagem de histórico por hóspede
    # 2012-01-16
    Matheus Araújo
-->

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="listHistoricoHospede.aspx.cs" Inherits="App_Page_BemEstar_HospedePermanentePagamento_listHistoricoHospede" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<!-- Cabeçalho -->
<head id="Head1" runat="server">
    
    <!-- Título -->
    <title>#</title>
    
    <!-- Arquivo CSS -->
    <link rel="Stylesheet" href="../../../App_Style/Default/default.css" />
    
    <!-- Script geral -->
    <script type="text/javascript" language="javascript" src="../../../App_Script/Script.js"></script>
    
    <!-- Script -->
    <script type="text/javascript" language="javascript" src="listHistoricoHospede.js" ></script>
    
</head>

<!-- Corpo da página -->
<body>
    <form id="form1" runat="server">
        <div>
        
        	<input type="hidden" id="hdControl" runat="server" />
		        
            <input type="hidden" id="__EVENTTARGET" name="__EVENTTARGET" />
            <input type="hidden" id="__EVENTARGUMENT" name="__EVENTARGUMENT" />
            
            <h1>Pagamento de Hóspede Permanente - Histórico por Hóspede</h1>
            
            <br />
            <br />
            
            <table align="center" width="60%">
                <tr>
                    <td align="right" width="30%" style="border-bottom:solid 1px #000; border-top: solid 1px #000">Hóspede:&nbsp;</td>
                    <td style="border-bottom:solid 1px #000; border-top: solid 1px #000">
                        <asp:DropDownList ID="slctHospede" runat="server" 
                            onselectedindexchanged="slctHospede_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList></td>
                </tr>
            </table>
            
            <table id="tblList" runat="server" style="width:80%; visibility:hidden;" align="center"></table>
            
            <br />
            
            <table style="width:80%;border: solid 1px #000" align="center">
                <tr>
                    <td width="30%" align="right">Ingresso:&nbsp;</td>
                    <td id="tdIngresso"></td>
                </tr>
                <tr>
                    <td align="right">Situação:&nbsp;</td>
                    <td id="tdSituacao"></td>
                </tr>
                <tr>
                    <td align="right">Saída:&nbsp;</td>
                    <td id="tdSaida"></td>
                </tr>
            </table>
            
            <br />
            
            <table id="tblListOut" style="width:80%" align="center">
                <tr style="background-color:Silver">
                    <td><h3>Ano</h3></td>
                    <td><h3>Mês</h3></td>
                    <td><h3>Pago</h3></td>
                    <td><h3>Valor</h3></td>
                    <td><h3>Data de Pagamento</h3></td>
                    <td colspan="2"><h3>Observação</h3></td>
                </tr>
            </table>
            
            <br />
            <br />
            
            <table style="width:80%" align="center">
                <tr><td align="center">
                    <input type="button" value="Controle de Pagamento" id="btnFind" runat="server" onclick="javascript:window.navigate('hospedePermanentePagamento.aspx');"/>
                </td></tr>
            </table>
    
        </div>
    </form>
</body>
</html>
