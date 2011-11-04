<!--
    INTRANET CELU
    App_Page/Sistema/Aviso/Recado/controleTipoRecado.aspx
    Página para controle de tipo de recado
    # 2011-04-09
    Matheus Araújo
-->

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="controleTipoRecado.aspx.cs" Inherits="App_Page_Sistema_Aviso_Recado_controleTipoRecado" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<!-- Cabeçalho -->
<head id="Head1" runat="server">
    
    <!-- Título -->
    <title>#</title>
    
    <!-- Arquivo CSS -->
    <link rel="Stylesheet" href="../../../../App_Style/Default/default.css" />
    
    <!-- Arquivo Script -->
    <script type="text/javascript" language="javascript" src="_script.js"></script>
    
</head>

<!-- Corpo da página -->
<body>
    <form id="form1" runat="server">
    <div>
    
        <input type="hidden" id="hdControl" runat="server" />
        <input type="hidden" id="hdTipoRecado" runat="server" />
    
        <h3>Controle de Permissões de Visualização</h3>
        <br />
        
        <table style="width:60%" align="center">
            <tr>                
                <td align="right">
                    <asp:Button ID="btnFinalize" Text="Finalizar" runat="server" 
                        onclick="btnFinalize_Click" />
                </td>
            </tr>
        </table>
        
        <br />
        
        <table id="tblList" runat="server" style="width:60%" align="center">
            <tr style="background-color:Silver">
                <td colspan="3"><h3>Perfil</h3></td>                
            </tr>
        </table>
        
    </div>
    </form>
</body>
</html>