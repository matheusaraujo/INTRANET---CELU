<!--
    INTRANET CELU
    App_Page/Common/menu.aspx
    Página de menu
    # 2010-10-30
    Matheus Araújo
-->

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="menu.aspx.cs" Inherits="App_Page_Common_menu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<!-- Cabeçalho -->
<head runat="server">

    <!-- Título -->
    <title>#</title>
    
    <!-- Arquivo CSS -->
    <link rel="Stylesheet" href="../../App_Style/Default/default.css" />
    
</head>

<!-- Corpo da página -->
<body style="background-image:url(../../App_Images/back.png);">
    <form id="form1" runat="server">
    <div>
    
        <table width="100%">
        
            <!-- MENU GERAL -->
            <tr><td style="background-color:Gainsboro">&nbsp;</td></tr>
            <tr><td><ul>
                <li><a href="main.aspx" target="frmMain">Início</a></li>
                <li><a href="myinfo.aspx" target="frmMain">Minhas Informações</a></li>
                <li><a href="../Avisos/Recado/cadRecado.aspx" target="frmMain">Quadro de Recados</a></li>
                <li><a href="../Avisos/listAvisos.aspx" target="frmMain">Quadro de Avisos</a></li>
                <li><a href="listComumMorador.aspx" target="frmMain">Quadro de Moradores</a></li>
                <li><a href="../Login/changePass.aspx" target="frmMain">Trocar Senha</a></li>
                <li><a href="about.htm" target="frmMain">Sobre</a></li>
                <li><asp:LinkButton Text="Logoff" runat="server" ID="linkLogOff" onclick="linkLogOff_Click"></asp:LinkButton></li>
            </ul></td></tr>
            
            <!-- MENU BIBLIOTECA -->
            <tr><td bgcolor="Gainsboro"><h3>BIBLIOTECA</h3></td></tr>
            <tr><td><ul>
                <li><a href="../Biblioteca/Consulta/listObra.aspx" target="frmMain">CONSULTA AO ACERVO</a></li>
                <li><a href="../Biblioteca/Consulta/myHistory.aspx" target="frmMain">MEU HISTÓRICO</a></li>
            </ul></td></tr>    
            <tr><td bgcolor="Gainsboro"><h3>BIBLIOTECA - ADMINISTRATIVO</h3></td></tr>
            <tr><td><ul>
                <li><a href="../Biblioteca/Obra/listObra.aspx" target="frmMain">Controle do Acervo</a></li>
                <li><a href="../Biblioteca/Emprestimo/listEmprestimo.aspx" target="frmMain">Controle de Empréstimo</a></li>
                <li><a href="../Biblioteca/AssuntoObra/listAssuntoObra.aspx" target="frmMain">Cadastro de Assunto</a></li>
                <li><a href="../Biblioteca/AutorObra/listAutorObra.aspx" target="frmMain">Cadastro de Autor</a></li>
                <li><a href="../Biblioteca/TipoObra/listTipoObra.aspx" target="frmMain">Cadastro de Tipo de Obra</a></li>
                <li><a href="../Biblioteca/StatusObra/listStatusObra.aspx" target="frmMain">Cadastro de Status de Obra</a></li>
            </ul></td></tr>
            
            <!-- MENU DIRETORIA -->
            <tr><td bgcolor="Gainsboro"><h3>DIRETORIA</h3></td></tr>
            <tr><td><ul>
                <li><a href="../Diretoria/Morador/listMorador.aspx" target="frmMain">Cadastro de Moradores</a></li>
            </ul></td></tr>
            
            <!-- MENU BEM-ESTAR -->
            <tr><td style="background-color:Gainsboro"><h3>BEM-ESTAR</h3></td></tr>
            <tr><td><ul>
                <li><a href="../BemEstar/PersonaNonGrata/listPersonaNonGrata.aspx" target="frmMain">Persona Non Grata</a></li>
                <li><a href="../BemEstar/HospedePermanente/listHospedePermanente.aspx" target="frmMain">Hóspede Permanente</a></li>
                <li><a href="../BemEstar/HospedePermanentePagamento/cadHospedePermanentePagamento.aspx" target="frmMain">Hóspede Permanente - Pagamento</a></li>
            </ul></td></tr>
            
            <!-- MENU SISTEMA -->
            <tr><td style="background-color:Gainsboro"><h3>SISTEMA</h3></td></tr>
            <tr><td><ul>
                <li><a href="../Sistema/Seguranca/Perfil/listPerfil.aspx" target="frmMain">Cadastro de Perfis</a></li>  
                <li><a href="../Sistema/Seguranca/ControlePermissao/listControlePermissao.aspx" target="frmMain">Controle de Permissões</a></li>                  
                <li><a href="../Sistema/Utilidade/StatusMorador/listStatusMorador.aspx" target="frmMain">Cadastro de Status de Morador</a></li>                    
                <li><a href="../Sistema/Utilidade/Ies/listIes.aspx" target="frmMain">Cadastro de Instituição de Ensino Superior</a></li>                                        
                <li><a href="../Sistema/Utilidade/Curso/listCurso.aspx" target="frmMain">Cadastro de Curso</a></li>
                <li><a href="../Sistema/Utilidade/Quarto/listQuarto.aspx" target="frmMain">Cadastro de Quartos</a></li>
                <li><a href="../Sistema/Utilidade/Cidade/listCidade.aspx" target="frmMain">Cadastro de Cidades</a></li>
                <li><a href="../Sistema/Aviso/Recado/listTipoRecado.aspx" target="frmMain">Cadastro de Tipo de Recado</a></li>
            </ul></td></tr>
            
        </table>
    
    </div>
    </form>
</body>

</html>
