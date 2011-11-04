<!--
    INTRANET CELU
    App_Page/Login/login.aspx
    Página de login
    # 2010-10-30
    Matheus Araújo
-->

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="App_Page_Login_login" %>

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

        // -------------------------------
        // -- function rightPass()
        // -- senha correta
        // -------------------------------
        
        function rightPass() {
        
            // altera as páginas dos frames
            parent.frmLeft.location = "../Common/menu.aspx"
            parent.frmMain.location = "../Common/main.aspx"
            
        }

        // -------------------------------
        // -- function wrongPass(user)
        // -- senha errada
        // -------------------------------
        
        function wrongPass(user) {
        
            // Ajusta a célula com a mensagem
            var td = document.getElementById('tdSenhaErrada');
            td.style.display = 'block';
            td.innerHTML = '<br />Nome de usuário ou senha inválidos!<br />Você forneceu <u>' + user + '</u>.';

            // limpa a caixa de texto de usuário
            document.getElementById('txtuser').value = '';
            document.getElementById('txtpass').value = '';
        }

        // -----------------------------------------------------------
        // -- function checkCapsLock(e)
        // -- verifica se usuário está com caps lock ativo e alerta
        // -----------------------------------------------------------

        function checkCapsLock(e) {
            
            var myKeyCode = 0;
            var myShiftKey = false;
            //var myMsg='Caps Lock is On.\n\nTo prevent entering your password incorrectly,\nyou should press Caps Lock to turn it off.';

            // Internet Explorer 4+
            if (document.all) {
                myKeyCode = e.keyCode;
                myShiftKey = e.shiftKey;

                // Netscape 4
            } else if (document.layers) {
                myKeyCode = e.which;
                myShiftKey = (myKeyCode == 16) ? true : false;

                // Netscape 6
            } else if (document.getElementById) {
                myKeyCode = e.which;
                myShiftKey = (myKeyCode == 16) ? true : false;

            }

            // Upper case letters are seen without depressing the Shift key, therefore Caps Lock is on
            if ((myKeyCode >= 65 && myKeyCode <= 90) && !myShiftKey) {
                //alert( myMsg );
                document.getElementById('trCapsLock').style.display = 'block'

                // Lower case letters are seen while depressing the Shift key, therefore Caps Lock is on
            } else if ((myKeyCode >= 97 && myKeyCode <= 122) && myShiftKey) {
                //alert( myMsg );
                document.getElementById('trCapsLock').style.display = 'block'
            } else {
                document.getElementById('trCapsLock').style.display = 'none'
            }

        }

        function verificaBrowser() {
            var browserName = navigator.appName;

            if (browserName != "Microsoft Internet Explorer") {
                alert("A Intranet deve ser executada no Internet Explorer!");
                window.parent.location = 'http://www.celu.com.br';
            }

        }
    
    </script>
    
</head>

<!-- Corpo da página -->
<body  onload="javascript:verificaBrowser();">
    <form id="form1" runat="server">
    <div>
    
        <table style="border-bottom:solid 1px #000000;border-top:solid 1px #000000; width:350px">
            <tr>
                <td style="width:10%" align="right">usuário:&nbsp;</td>
                <td><input type="text" id="txtUser" runat="server" /></td>
            </tr>                
            <tr>
                <td align="right">senha:&nbsp;</td>
                <td><input type="password" id="txtPass" runat="server" onkeypress="checkCapsLock(event);"/></td>
            </tr>
            <tr>
                <td></td>
                <td align="left">&nbsp;
                    <asp:Button id="btnLogin" Text="Login" runat="server" 
                        onclick="btnLogin_Click" />
                </td>
            </tr>
            <tr style="display:none;" id="trCapsLock" bgcolor="yellow">
                <td colspan="2" style="font-size:10px" width="200px">
                    <strong>Caps Lock está ativado</strong>
                    Se Caps Lock estiver ativado, isso pode fazer com você digite a senha incorretamente.
                </td>
            </tr>
            <tr>
                <td colspan="2" id="tdSenhaErrada" style="display:none" align="center"></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
