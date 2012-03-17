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
    
</head>

<!-- Corpo da página -->
<body>
    <form id="form1" runat="server">
        <div>
            
            <h1>Pagamento de Hóspede Permanente - Histórico por Hóspede</h1>
            
            <br />
            <br />
            
            <table align="center" width="60%">
                <tr>
                    <td align="right" width="30%" style="border-bottom:solid 1px #000; border-top: solid 1px #000">Hóspede:&nbsp;</td>
                    <td style="border-bottom:solid 1px #000; border-top: solid 1px #000"><asp:DropDownList ID="slctHospede" runat="server"></asp:DropDownList></td>
                </tr>
            </table>
            
            <br />
            <br />
    
        </div>
    </form>
</body>
</html>
