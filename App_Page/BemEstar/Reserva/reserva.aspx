<!--
    INTRANET CELU
    \App_Page\BemEstar\Reserva\reserva.aspx
    Página geral para pagamento de Hóspede Permanente
    # 2012-01-16
    Matheus Araújo
-->

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="reserva.aspx.cs" Inherits="App_Page_BemEstar_Reserva_reserva" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<!-- Cabeçalho -->
<head id="Head1" runat="server">
    
    <!-- Título -->
    <title>#</title>
    
    <!-- Arquivo CSS -->
    <link rel="Stylesheet" href="../../../App_Style/Default/default.css" />
    
</head>

<body>
    <form id="form1" runat="server">
    <div>
    
        <h1>Reserva de Espaços Físicos</h1>
        <br />
        
        <ul>        
            <li><a href="cadReserva.aspx">Registrar reserva</a></li>            
            <li><a href="../EspacoReserva/listEspacoReserva.aspx">Cadastro de Espaço Físico</a></li>            
            <li><a href="../StatusReserva/listStatusReserva.aspx">Cadastro de Status</a></li>
            <li><a href="listReserva.aspx">Listar reservas</a></li>
        </ul>
    
    </div>
    </form>
</body>
</html>
