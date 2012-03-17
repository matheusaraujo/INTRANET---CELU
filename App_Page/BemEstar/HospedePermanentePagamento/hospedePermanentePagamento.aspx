<!--
    INTRANET CELU
    \App_Page\BemEstar\HospedePermanentePagamento\hospedePermanentePagamento.aspx
    Página geral para pagamento de Hóspede Permanente
    # 2012-01-16
    Matheus Araújo
-->

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="hospedePermanentePagamento.aspx.cs" Inherits="App_Page_BemEstar_HospedePermanentePagamento_hospedePermanentePagamento" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<!-- Cabeçalho -->
<head id="Head1" runat="server">
    
    <!-- Título -->
    <title>#</title>
    
    <!-- Arquivo CSS -->
    <link rel="Stylesheet" href="../../../App_Style/Default/default.css" />
    
</head>

<!-- Corpo da Página -->
<body>
    <form id="form1" runat="server">
    <div>
        
        <h1>Pagamento de Hóspede Permanente</h1>
        <br />
        
        <ul>        
            <li><a href="cadHospedePermanentePagamento.aspx">Registrar pagamento</a></li>            
            <li><a href="listMesAtual.aspx">Mês atual</a></li>            
            <li><a href="listHistoricoHospede.aspx">Histórico por Hóspede</a></li>
        </ul>
    </div>
    </form>
</body>
</html>
