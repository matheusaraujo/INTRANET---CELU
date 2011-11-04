<!--
    INTRANET CELU
    App_Page/Avisos/Recado/lerRecados.aspx
    Página de listagem de recados enviados para mim
    # 2011-04-09
    Matheus Araújo
-->

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="lerRecados.aspx.cs" Inherits="App_Page_Avisos_Recado_lerRecados" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<!-- Cabeçalho -->
<head id="Head1" runat="server">
    
    <!-- Título -->
    <title>#</title>
    
    <!-- Arquivo CSS -->
    <link rel="Stylesheet" href="../../../App_Style/Default/default.css" />
    
    <!-- Script -->
    <script type="text/javascript" language="javascript" src="../../../App_Script/Script.js"></script>
    
    <!-- Script Interno -->
    <script type="text/javascript" language="javascript">
    
		function adjust(){
		
			var table = document.getElementById('tblList');
			
			for(i=1;i<table.rows.length;i++){
				
				var cell = table.rows[i].insertCell();
            
				cell.innerHTML = table.rows[i].cells[4].innerHTML;
				
				if(table.rows[i].cells[3].innerText == 'False')
					cell.innerHTML = cell.innerHTML.replace("Exibir", "Ocultar");
				else
					cell.innerHTML = cell.innerHTML.replace("Exibir", "Reexibir");
					
				cell.innerHTML = cell.innerHTML.replace("__openPopUp('viewRecado.aspx?recado=", "_hide('" );
				cell.innerHTML = cell.innerHTML.replace(";', 'aviso', true, 400, 600, false, false, 'yes');", "');");
				
				table.rows[i].deleteCell(3);
			
			}
		
		}
		
		function _hide(id){
			document.getElementById('hdControl').value = id;
			__doPostBack('','');
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
    
        <h1>Quadro de Recados</h1>
        <br />
        
		<table width="60%" style="width:60%" align="center">
			<tr>
				<td>
					<asp:Button ID="btnLoad" runat="server" onclick="btnLoad_Click"></asp:Button>
				</td>
			</tr>
		</table>
        
        <table id="tblList" runat="server" style="width:60%" align="center">
            <tr style="background-color:Silver">
                <td><h3>Assunto</h3></td>                
                <td><h3>Morador</h3></td>
                <td colspan="3"><h3>Data</h3></td>
            </tr>
        </table>
        <br />
        <table style="width:60%" align="center">
            <tr>
                <td align="right">
                    <input type="button" value="Novo recado" onclick="javascript:window.navigate('cadRecado.aspx');" />
                </td>
            </tr>
        </table>
            
    
    </div>
    </form>
</body>
</html>
