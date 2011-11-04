<!--
    INTRANET CELU
    App_Page/Biblioteca/Consulta/myHistory.aspx
    Página de histórico do morador
    # 2011-02-10
    Matheus Araújo
-->

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="myHistory.aspx.cs" Inherits="App_Page_Biblioteca_Consulta_myHistory" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<!-- Cabeçalho -->
<head id="Head1" runat="server">
    
    <!-- Título -->
    <title>#</title>
    
    <!-- Arquivo CSS -->
    <link rel="Stylesheet" href="../../../App_Style/Default/default.css" />
    
    <!-- Arquivo Script -->
    <script type="text/javascript" language="javascript" src="../../../App_Script/Script.js"></script>
    
    <!-- Script comum -->
    <script type="text/javascript" language="javascript">

        function __action(action, id) {

            document.getElementById('hdControl').value = action + ';' + id;
            __doPostBack('', '');
        }

        function __table() {
        
            var id = new Array('Reserva', 'Emprestimo');
        
            for(var j = 0; j < id.length; j++) {
        
                var table = document.getElementById('tbl' + id[j]);

                for (var i = 2; i < table.rows.length; i++) {

                    table.rows[i].cells[1].innerHTML =
                        '<a href="#" onclick="javascript:__openPopUp(\'detalObra.aspx?obra=' +
                        table.rows[i].cells[0].innerText + ';\', \'obra\', true, 400, 600, false, false, \'yes\');">' +
                        table.rows[i].cells[1].innerText + '</a>';

                    if (table.rows[i].cells[3].innerText != 'Sim' && id[j] == 'Reserva') {
                        table.rows[i].cells[4].innerHTML = '&nbsp;';
                    }
                    else if (table.rows[i].cells[4].innerText == '3' && id[j] == 'Emprestimo') {
                        table.rows[i].cells[7].innerHTML = '&nbsp;';
                    }

                    if (id[j] == 'Emprestimo') {

                        var x = parseInt(table.rows[i].cells[6].innerText);

                        if (x == 0) {
                            table.rows[i].cells[6].innerText = 'Vencendo hoje';
                        }
                        else if (x < 0) {
                            table.rows[i].cells[6].innerText = 'Empréstimo vencido!';
                            table.rows[i].cells[7].innerHTML = '&nbsp;';
                        }
                        else {
                            table.rows[i].cells[6].innerHTML = '&nbsp;';
                        }

                        if (table.rows[i].cells[5].innerText == 'Não') {
							table.rows[i].cells[6].innerHTML = '&nbsp;';
                            table.rows[i].cells[7].innerHTML = '&nbsp;';
                        }
                    }

                    table.rows[i].deleteCell(0);
                }
            }
            
        }
    
    </script>
    
</head>

<!-- Corpo da página -->
<body>
    <form id="form1" runat="server">
    <div>
    
        <input type="hidden" id="hdMorador" runat="server" />
        <input type="hidden" id="hdControl" runat="server" />
        
        <input type="hidden" id="__EVENTTARGET" name="__EVENTTARGET" />
        <input type="hidden" id="__EVENTARGUMENT" name="__EVENTARGUMENT" />
    
        <h1>Meu Histórico na Biblioteca</h1>
        
        <br />
        
        <h2>Reservas</h2>
        <table id="tblReserva" runat="server" width="80%" align="center">            
            <tr>
                <td colspan="4" align="right">
                    <asp:Button ID="btnReserva" runat="server" onclick="btnReserva_Click" Width="350px" />
                </td>
            </tr>
            <tr bgcolor="Gainsboro">
                <td><h6>Obra</h6></td>
                <td><h6>Data</h6></td>
                <td colspan="2"><h6>Aberto</h6></td>
            </tr>
        </table>
        
        <br />
        <hr />
        <br />
        
        <h2>Empréstimos</h2>
        <table id="tblEmprestimo" runat="server" width="80%" align="center">
            <tr>
                <td colspan="6" align="right">
                    <asp:Button ID="btnEmprestimo" runat="server" onclick="btnEmprestimo_Click" Width="350px" />
                </td>
            </tr>
            <tr bgcolor="Gainsboro">
                <td><h6>Obra</h6></td>
                <td><h6>Data Empréstimo</h6></td>
                <td><h6>Data Devolução</h6></td>    
                <td><h6>Renovações</h6></td>            
                <td><h6>Aberto</h6></td>
                <td colspan="2"><h6>Observação</h6></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
