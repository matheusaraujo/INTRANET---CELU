<!--
    INTRANET CELU
    App_Page/BemEstar/PersonaNonGrata/listPersonaNonGrata.aspx
    Página de listagem de persona non grata
    # 2012-03-01
    Matheus Araújo
-->


<%@ Page Language="C#" AutoEventWireup="true" CodeFile="listPersonaNonGrata.aspx.cs" Inherits="App_Page_BemEstar_PersonaNonGrata_listPersonaNonGrata" %>

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
    
        <h1>Lista de Persona Non Grata</h1>
        
        <br />
        
        <table style="width:80%" align="center">
            <tr>
                <td align="right">
                    <asp:CheckBox ID="cbListAll" TextAlign="Right"  runat="server" 
                        oncheckedchanged="cbListAll_CheckedChanged" AutoPostBack="true" /> Listar todos (Os que estão 'em aberto' e os que não estão)
                </td>
            </tr>
            <tr>
                <td align="right">
                    <asp:CheckBox ID="cbListDetal" TextAlign="Right" runat="server" 
                        oncheckedchanged="cbListDetal_CheckedChanged" AutoPostBack="true" /> Lista Detalhada (Exibir todas as informações de toda a lista)
                </td>
            </tr>
        </table>
        
        <table id="tblList" runat="server" style="width:80%" align="center">
            <tr style="background-color:Silver">
                <td><h3>Data Entrada</h3></td>
                <td><h3>Data Saída</h3></td>
                <td><h3>Quarto</h3></td>
                <td><h3>Nome</h3></td>
                <td><h3>Período em Aberto</h3></td>
                <td><h3>Débito</h3></td>
                <td><h3>Observação</h3></td>
                <td><h3>Em aberto</h3></td>
                <td colspan="2"><h3>Observação</h3></td>
            </tr>
        </table>
        
        <br />
        
        <table style="width:80%" align="center">
            <tr>
                <td align="right">
                    <input type="button" value="Inserir Novo" onclick="javascript:window.navigate('CadPersonaNonGrata.aspx?personanongrata=-1;');" />
                </td>
            </tr>
        </table>
            
    
    </div>
    </form>
</body>
</html>
