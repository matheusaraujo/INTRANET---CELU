<!--
    INTRANET CELU
    App_Page/Avisos/listAvisos.aspx
    Página de quadro de avisos
    # 2011-02-07
    Matheus Araújo
-->


<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cadAviso.aspx.cs" Inherits="App_Page_Avisos_cadAviso" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<!-- Cabeçalho -->
<head id="Head1" runat="server">
    
    <!-- Título -->
    <title>#</title>
    
    <!-- Arquivo CSS -->
    <link rel="Stylesheet" href="../../App_Style/Default/default.css" />
    
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
            
        <h1>Cadastro de Avisos</h1>
        <br />
        
        <table id="tblCadastro" runat="server" align="center" width="90%">
            
            <!-- Código, oculto -->
            <tr style="display:none">
                <td align="right">Código:&nbsp;</td>                
                <td colspan="2"><asp:TextBox ID="txtCodigo" runat="server"></asp:TextBox></td>
            </tr>
            
            <!-- Código morador, oculto -->
            <tr style="display:none">
                <td align="right">Código morador:&nbsp;</td>                
                <td colspan="2"><asp:TextBox ID="txtMorador" runat="server"></asp:TextBox></td>
            </tr>
            
            <!-- Ativo -->
            <tr>
                <td></td>
                <td colspan="2"><asp:CheckBox ID="cbAtivo" runat="server" Checked="true" />&nbsp;Ativo</td>
            </tr>
            
            <!-- Assunto -->
            <tr>
                <td align="right">Assunto:&nbsp;</td>                
                <td colspan="2"><asp:TextBox ID="txtAssunto" runat="server" style="width:60%" /> </td>                
            </tr>
            
            <tr>
                <td id="tdtxtAssunto" colspan="3"></td>
            </tr>
            
            <!-- Mensagem -->
            <tr>
                <td style="width:10%" align="right">Mensagem&nbsp;</td>
                <td style="width:75%"><asp:TextBox ID="txtMsg" runat="server" TextMode="MultiLine" style="width:90%;height:200px"></asp:TextBox></td>
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
                <td><asp:Button ID="btnEdit" runat="server" Text="Editar"/></td>                
                <td><asp:Button ID="btnSave" runat="server" Text="Salvar" onclick="btnSave_Click" /></td>                
                <td style="display:none"><asp:Button ID="btnDel" runat="server" Text="Excluir" /></td>                
                <td><asp:Button ID="btnNew" runat="server" Text="Novo" /></td>
                <td><input type="button" value="Buscar" id="btnFind" runat="server" onclick="javascript:window.navigate('listAutoAvisos.aspx');"/></td>
            </tr>
        </table>
          
    </div>
    </form>
</body>
</html>
