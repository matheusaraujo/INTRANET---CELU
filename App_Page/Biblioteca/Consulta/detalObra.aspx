<!--
    INTRANET CELU
    App_Page/Biblioteca/Consulta/detalObra.aspx
    Página de detalhes de Obra
    # 2011-02-10
    Matheus Araújo
-->

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="detalObra.aspx.cs" Inherits="App_Page_Biblioteca_Consulta_detalObra" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<!-- Cabeçalho -->
<head id="Head1" runat="server">
    
    <!-- Título -->
    <title>Biblioteca - CELU</title>
    
    <!-- Arquivo CSS -->
    <link rel="Stylesheet" href="../../../App_Style/Default/default.css" />
    
</head>

<!-- Corpo da página -->
<body>
    <form id="form1" runat="server">
    <div>
    
        <input type="hidden" id="hdCodObra" runat="server" />
    
        <h1>Biblioteca - CELU</h1>
    
        <table align="center">
            
            <!-- Código, oculto -->
            <tr style="display:none">
                <td align="right" width="30%">Código:&nbsp;</td>                
                <td id="tdCodigo" runat="server"></td>
            </tr>
            
            <!-- Tipo de Obra -->
            <tr>
                <td align="right">Tipo de Obra:&nbsp;</td>
                <td id="tdTipoObra" runat="server"></td>
            </tr>
            
            <!-- Número chamada -->
            <tr>
                <td align="right">Número de chamada:&nbsp;</td>
                <td id="tdNumChamada" runat="server"></td>
            </tr>
            
            <!-- Título -->
            <tr>
                <td align="right">Título:&nbsp;</td>
                <td id="tdTitulo" runat="server"></td>
            </tr>
            
            <!-- Autor de Obra -->
            <tr>
                <td align="right">Autor de Obra:&nbsp;</td>
                <td id="tdAutorObra" runat="server"></td>
            </tr>
            
            <!-- Edição -->
            <tr>
                <td align="right">Edição:&nbsp;</td>
                <td id="tdEdicao" runat="server"></td>
            </tr>
            
            <!-- Publicação -->
            <tr>
                <td align="right">Publicação:&nbsp;</td>
                <td id="tdPublicacao" runat="server"></td>
            </tr>
            
            <!-- Normalização -->
            <tr>
                <td align="right">Normalização:&nbsp;</td>
                <td id="tdNormalizacao" runat="server"></td>
            </tr>
            
            <!-- Assunto de Obra -->
            <tr>
                <td align="right">Assunto de Obra:&nbsp;</td>
                <td id="tdAssuntoObra" runat="server"></td>
            </tr>
            
            <!-- Status de Obra -->
            <tr>
                <td align="right">Status:&nbsp;</td>
                <td id="tdStatusObra" runat="server"></td>
            </tr>
        </table>
        
        <br />
        <hr />
        <br />
        
        <table align="center">
            <tr>
                <td align="center">
                    <asp:Button ID="btnReserva" Text="Reservar" runat="server" onclick="btnReserva_Click" />
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
