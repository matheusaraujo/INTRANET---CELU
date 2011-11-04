<!--
    INTRANET CELU
    App_Page/Common/detalMorador.aspx
    Página de detalhe de moradores
    # 2011-02-07
    Matheus Araújo
-->

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="detalMorador.aspx.cs" Inherits="App_Page_Common_detalMorador" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<!-- Cabeçalho -->
<head id="Head1" runat="server">
    
    <!-- Título -->
    <title>Quadro de Moradores - CELU</title>
    
    <!-- Arquivo CSS -->
    <link rel="Stylesheet" href="../../App_Style/Default/default.css" />
    
</head>

<body>
    <form id="form1" runat="server">
    <div>
    
        <h1>Quadro de Moradores</h1>
        <br />
        
        <table width="90%" align="center">			
            <tr>
				<td rowspan="13" width="60%"><iframe src="frmFoto.aspx" id="frmFoto" runat="server" width="100%" height="600px" border="no" />
                <td align="right">Nome:&nbsp;</td>
                <td id="tdNome" runat="server"></td>
            </tr>
            <tr>
				<td align="right">Apelido:&nbsp;</td>
				<td id="tdApelido" runat="server"></td>
            </tr>
            <tr>
                <td align="right">Número Lavanderia:&nbsp;</td>
                <td id="tdNumLavanderia" runat="server"></td>
            </tr>
            <tr>
                <td align="right">Perfil:&nbsp;</td>
                <td id="tdPerfil" runat="server"></td>
            </tr>
            <tr>
                <td align="right">Status:&nbsp;</td>
                <td id="tdStatus" runat="server"></td>
            </tr>
            <tr>
                <td align="right">Instituição de Ensino:&nbsp;</td>
                <td id="tdIes" runat="server"></td>
            </tr>
            <tr>
                <td align="right">Curso:&nbsp;</td>
                <td id="tdCurso" runat="server"></td>
            </tr>
            <tr>
                <td align="right">Quarto:&nbsp;</td>
                <td id="tdQuarto" runat="server"></td>
            </tr>
            <tr>
                <td align="right">Cidade de Origem:&nbsp;</td>
                <td id="tdCidadeOrigem" runat="server"></td>
            </tr>
            <tr>
                <td align="right">Aniversário:&nbsp;</td>
                <td id="tdAniversario" runat="server"></td>
            </tr>
            <tr>
				<td align="right">Ingresso:&nbsp;</td>
				<td id="tdIngresso" runat="server"></td>
            </tr>            
            <tr>
                <td align="right">Telefone:&nbsp;</td>
                <td id="tdTelefone" runat="server"></td>
            </tr>
            <tr>
                <td align="right">E-mail:&nbsp;</td>
                <td id="tdEmail" runat="server"></td>
            </tr>
            
        </table>
    
    </div>
    </form>
</body>
</html>
