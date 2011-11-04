<!--
    INTRANET CELU
    App_Page/Biblioteca/StatusObra/listStatusObra.aspx
    Página de listagem de Status de Obra
    # 2011-02-08
    Matheus Araújo
-->

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="listStatusObra.aspx.cs" Inherits="App_Page_Biblioteca_StatusObra_listStatusObra" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<!-- Cabeçalho -->
<head id="Head1" runat="server">
    
    <!-- Título -->
    <title>#</title>
    
    <!-- Arquivo CSS -->
    <link rel="Stylesheet" href="../../../App_Style/Default/default.css" />
    
</head>

<!-- Corpo da página -->
<body>
    <form id="form1" runat="server">
    <div>
    
        <h1>Status de Obra</h1>
        <br />
        
        <table id="tblList" runat="server" style="width:60%" align="center">
            <tr style="background-color:Silver">
                <td colspan="2"><h3>Status de Obra</h3></td>                
            </tr>
        </table>
        <br />

            
    
    </div>
    </form>
</body>
</html>
