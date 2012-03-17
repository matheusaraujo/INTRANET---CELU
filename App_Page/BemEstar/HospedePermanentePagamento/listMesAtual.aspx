<!--
    INTRANET CELU
    \App_Page\BemEstar\HospedePermanentePagamento\listMesAtual.aspx
    Página para listagem de mês atual
    # 2012-01-16
    Matheus Araújo
-->

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="listMesAtual.aspx.cs" Inherits="App_Page_BemEstar_HospedePermanentePagamento_listMesAtual" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<!-- Cabeçalho -->
<head id="Head1" runat="server">
    
    <!-- Título -->
    <title>#</title>
    
    <!-- Arquivo CSS -->
    <link rel="Stylesheet" href="../../../App_Style/Default/default.css" />
    
    <!-- Javascript -->
    <script type="text/javascript" language="javascript">

        function adjust() {
            var table = document.getElementById('tblList');
            var today = new Date();

            for (i = 1; i < table.rows.length; i++) {

                var cell = table.rows[i].insertCell();

                if (table.rows[i].cells[2].innerText == 'Sim') {
                    cell.innerText = '';
                }
                else {
                    if (Number(table.rows[i].cells[1].innerText) <= today.getDay()) {
                        cell.innerText = '';
                    }
                    else {
                        cell.innerText = 'Vencido!';
                    }
                }
            }
            
        }
    
    </script>
    
</head>

<!-- Corpo da página -->
<body>
    <form id="form1" runat="server">
    <div>
            
        <h1>Pagamento de Hóspede Permanente - Verificar mês atual</h1>
        
        <br />
        <br />
        
        <table id="tblList" runat="server" style="width:80%" align="center">
            <tr style="background-color:Silver">
                <td>Hóspede</td>
                <td>Dia do vencimento</td>
                <td>Pago</td>
                <td>-</td>
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
