<!--
    INTRANET CELU
    App_Page/Avisos/listAvisos.aspx
    Página de quadro de avisos
    # 2011-02-07
    Matheus Araújo
-->

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="detalAviso.aspx.cs" Inherits="App_Page_Avisos_detalAviso" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<!-- Cabeçalho -->
<head id="Head1" runat="server">
    
    <!-- Título -->
    <title>Quadro de Avisos - CELU</title>
    
    <!-- Arquivo CSS -->
    <link rel="Stylesheet" href="../../App_Style/Default/default.css" />
    
</head>

<!-- Corpo da página -->
<body>
    <form id="form1" runat="server">
    <div>
    
        <h1>Quadro de Avisos - CELU</h1>
        <br />
    
        <table width="90%" align="center">
            
            <!-- Morador -->
            <tr>
                <td style="width:15%" align="right">Morador:&nbsp;</td>
                <td id="tdMorador" runat="server"></td>
            </tr>
            
            <!-- Data -->
            <tr>
                <td align="right">Data:&nbsp;</td>
                <td id="tdData" runat="server"></td>
            </tr>
            
            <!-- Assunto -->
            <tr>
                <td align="right">Assunto:&nbsp;</td> 
                <td id="tdAssunto" runat="server"></td>
            </tr>
            
            <!-- Mensagem -->            
            <tr>
                <td id="tdMensagem" runat="server" colspan="2" bgcolor="Gainsboro"></td>
            </tr>
            
        </table>
    
    </div>
    </form>
</body>
</html>
