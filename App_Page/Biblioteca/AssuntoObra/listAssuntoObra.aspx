﻿<!--
    INTRANET CELU
    App_Page/Biblioteca/AssuntoObra/listAssuntoObra.aspx
    Página de listagem de Assunto de Obra
    # 2011-02-08
    Matheus Araújo
-->

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="listAssuntoObra.aspx.cs" Inherits="App_Page_Biblioteca_AssuntoObra_listAssuntoObra" %>

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
    
        <h1>Assunto de Obra</h1>
        <br />
        
        <table id="tblList" runat="server" style="width:60%" align="center">
            <tr style="background-color:Silver">
                <td colspan="2"><h3>Assunto</h3></td>                
            </tr>
        </table>
        <br />
        <table style="width:60%" align="center">
            <tr>
                <td align="right">
                    <input type="button" value="Inserir Novo" onclick="javascript:window.navigate('cadAssuntoObra.aspx?assuntoobra=-1;');" />
                </td>
            </tr>
        </table>
            
    
    </div>
    </form>
</body>
</html>
