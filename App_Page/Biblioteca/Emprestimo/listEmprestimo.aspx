<!--
    INTRANET CELU
    App_Page/Biblioteca/Emprestimo/listEmprestimo.aspx
    Página de listagem de Empréstimo
    # 2011-02-11
    Matheus Araújo
-->

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="listEmprestimo.aspx.cs" Inherits="App_Page_Biblioteca_Emprestimo_listEmprestimo" %>

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

        function __table(id) {

            var id = new Array('Reserva', 'Emprestimo');

            for (var j = 0; j < id.length; j++) {
            
                var table = document.getElementById('tbl' + id[j])

                for (var i = 2; i < table.rows.length; i++) {

                    // link para morador
                    table.rows[i].cells[2].innerHTML =
                        '<a href="#" onclick="javascript:__openPopUp(\'../../Common/detalMorador.aspx?morador=' +
                        table.rows[i].cells[0].innerText + ';\', \'obra\', true, 400, 600, false, false, \'yes\');">' +
                        table.rows[i].cells[2].innerText + '</a>';

                    // link para obra
                    table.rows[i].cells[3].innerHTML =
                        '<a href="#" onclick="javascript:__openPopUp(\'../Consulta/detalObra.aspx?obra=' +
                        table.rows[i].cells[1].innerText + ';\', \'obra\', true, 400, 600, false, false, \'yes\');">' +
                        table.rows[i].cells[3].innerText + '</a>';

                    if (id[j] == 'Emprestimo') {
                        
                        var x = parseInt(table.rows[i].cells[7].innerText);

                        if (x == 0 && table.rows[i].cells[6].innerText == 'Sim') {
                            table.rows[i].cells[7].innerText = 'Vencendo hoje';
                        }
                        else if (x < 0 && table.rows[i].cells[6].innerText == 'Sim') {
                            table.rows[i].cells[7].innerText = 'Empréstimo vencido!';                            
                        }
                        else {
                            table.rows[i].cells[7].innerHTML = '&nbsp;';
                        }
                    }
                    
                    table.rows[i].deleteCell(1);
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
    
        <input type="hidden" id="hdControl" runat="server" />
        
        <input type="hidden" id="__EVENTTARGET" name="__EVENTTARGET" />
        <input type="hidden" id="__EVENTARGUMENT" name="__EVENTARGUMENT" />
    
        <h1>Controle de Empréstimos</h1>
        <br />
        
        <!-- Reservas em aberto -->
        <table id="tblReserva" runat="server" width="80%" align="center">
            <tr bgcolor="Gainsboro" style="height:20px">
                <td colspan="4"><h2>Reservas em aberto</h2></td>
            </tr>
            <tr bgcolor="Gainsboro">
                <td><h6>Morador</h6></td>
                <td><h6>Obra</h6></td>
                <td colspan="2"><h6>Data</h6></td>
            </tr>
        </table>
        
        <!-- Empréstimos em aberto -->
        <br />
        <hr />
        <br />
        
        
        <table id="tblEmprestimo" runat="server" width="95%" align="center">
            <tr bgcolor="Gainsboro">
                <td colspan="7"><h2>Empréstimos</h2></td>
            </tr>
            <tr bgcolor="Gainsboro">
                <td><h6>Morador</h6></td>
                <td><h6>Obra</h6></td>
                <td><h6>Data Empréstimo</h6></td>
                <td><h6>Data Devolução</h6></td>    
                <td><h6>Renovações</h6></td>                            
                <td colspan="2"><h6>Observação</h6></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
