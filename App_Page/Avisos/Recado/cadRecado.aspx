<!--
    INTRANET CELU
    App_Page/Avisos/Recado/cadRecado.aspx
    Página de cadastro de recado
    # 2011-04-09
    Matheus Araújo
-->

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cadRecado.aspx.cs" Inherits="App_Page_Avisos_Recado_cadRecado" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<!-- Cabeçalho -->
<head id="Head1" runat="server">
    
    <!-- Título -->
    <title>#</title>
    
    <!-- Arquivo CSS -->
    <link rel="Stylesheet" href="../../../App_Style/Default/default.css" />
    
    <!-- Script -->
    <script type="text/javascript" language="javascript">

        // ----------------------------------------------
        // -- function contText(id, max)
        // -- conta os caracteres na caixa de texto
        // ----------------------------------------------

        function contText(id, max) {

            var textbox = document.getElementById(id);
            var dif = max - textbox.value.length;
            var cell = document.getElementById('td' + id);

            if (dif > 0) {
                cell.innerText = 'Caracteres disponíveis: ' + dif;
            }
            else {
                cell.innerHTML = '<b>Limite atingido! (' + max + ')</b>';
            }

        }
    
    </script>
    
</head>

<!-- Corpo da página -->
<body>
    <form id="form1" runat="server">
    <div>
            
        <h1>Quadro de Recados</h1>
        <br />
        
        <table id="tblCadastro" align="center" width="90%">
        
			<tr>
				<td colspan="3"><a href="meusRecados.aspx">Recados enviados por mim</a></td>				
			</tr>
			<tr>
				<td colspan="3"><a href="lerRecados.aspx">Recados enviados para mim</a><br/>&nbsp;</td>				
			</tr>
			
			<!-- Assunto -->
			<tr>
				<td align="rigth" width="15%">Assunto:&nbsp;</td>
				<td colspan="2">
					<asp:DropDownList id="ddlAssunto" runat="server" AutoPostBack="true" onselectedindexchanged="ddlAssunto_Change" /></asp:DropDownList>
				</td>	
			</tr>
			
			<tr>
				<td alight="right">Quem visualiza:&nbsp;</td>
				<td id="tdQuem" runat="server" colspan="2"></td>
			</tr>
            
            <!-- Mensagem -->
            <tr>
                <td align="right">Mensagem&nbsp;</td>            
                <td><asp:TextBox ID="txtMsg" runat="server" TextMode="MultiLine" style="width:90%;height:200px"></asp:TextBox></td>                
                <td style="width:15%">
                    <b>[b]Negrito[/b]</b><br />
                    <i>[i]Itálico[/i]</i><br />
                    <u>[u]Sublinhado[/u]</u><br />
                    Nova Linha: [br]
                </td>
            </tr>
            
            <tr>
                <td id="tdtxtMsg" colspan="3"></td>
            </tr>
            
        </table>
        
        <table align="center" width="30%">
            <tr>
                <td><asp:Button ID="btnSave" runat="server" Text="Enviar" onclick="btnEnviar_Click" /></td>                
            </tr>
        </table>
          
    </div>
    </form>
</body>
</html>
