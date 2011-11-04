<!--
    INTRANET CELU
    App_Page/Common/foto.aspx
    Página para usuário enviar sua foto
    # 2011-04-16
    Matheus Araújo
-->

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="foto.aspx.cs" Inherits="App_Page_Common_foto" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<!-- Cabeçalho -->
<head id="Head1" runat="server">
    
    <!-- Título -->
    <title>#</title>
    
    <!-- Arquivo CSS -->
    <link rel="Stylesheet" href="../../App_Style/Default/default.css" />
    
    <! -- Script -->
    <script type="text/javascript"  language="javascript" src="../../App_Script/Script.js"></script>
    
</head>

<body>

    <form id="form1" runat="server">
    <div><table class="style1">
            <tr>
                <td bgcolor="#FFFFCA" class="style1" colspan="2" style="text-align: center">
                    Envie somente arquivos no formato .GIF ou .JPG</td>
            </tr>			
            <!-- <tr>
                <td class="style3">Nome do Arquivo</td>
                <td class="style2"><asp:TextBox ID="txtNomeArquivo" runat="server" Width="214px"></asp:TextBox></td>
            </tr> -->
            <tr>
                <td class="style3">Arquivo a Enviar</td>
                <td class="style2"><asp:FileUpload ID="fupld" runat="server" Width="226px" /></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="style2"><asp:Button ID="btnEnviar" runat="server" Text="Enviar" 
                        Width="125px" onclick="btnEnviar_Click" /></td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblmsg" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    </form>

</body>
</html>
