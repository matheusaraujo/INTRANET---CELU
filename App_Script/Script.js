// -------------------------------------------------------
// -- \App_Code\Library\JavaScript\App_Code\Script.js
// -- Arquivo Script genérico
// -- Matheus Araújo
// -- 2010-12-18
// -------------------------------------------------------

// --------------------------------------------------------
// -- function __doPostBack(eventTarget, eventArgument)
// -- executa o postback na página
// --------------------------------------------------------

function __doPostBack(eventTarget, eventArgument) {
    var theForm = document.forms('form1');
    if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
        theForm.__EVENTTARGET.value = eventTarget;
        theForm.__EVENTARGUMENT.value = eventArgument;
        theForm.submit();
    }
}

// --------------------------------------------------
// -- function __openPopUp(page, name, center, h, w, menubar, resizable, scrollbars)
// -- abre um popUp, centralizado ou não
// --------------------------------------------------

function __openPopUp(page, name, center, h, w, menubar, resizable, scrollbars) {

    // parâmetros para o popup
    var settings = 'height=' + h + ', width=' + w;

    // centraliza se for o caso
    if (center) {
        var leftPos = (screen.width) ? (screen.width - w) / 2 : 0;
        var topPos = (screen.height) ? (screen.height - h) / 2 : 0;
        settings += ', left=' + leftPos + ', top=' + topPos;
    }

    // parâmetros para abrir a página
    if (menubar.toString() != 'undefined') settings += ', menubar=' + menubar.toString();
    if (resizable.toString() != 'undefined') settings += ', resizable=' + resizable.toString();
    if (scrollbars.toString() != 'undefined') settings += ', scrollbars=' + scrollbars.toString();

    // abre o popup
    window.open(page, name, settings);
}

// --------------------------------------------------
// -- function __formatmonth(par)
// -- retorna nome dos meses
// --------------------------------------------------

function __formatmonth(par) {
    if (par == 1)
        return '1 - Janeiro';
    else if (par == 2)
        return '2 - Fevereiro';
    else if (par == 3)
        return '3 - Março';
    else if (par == 4)
        return '4 - Abril';
    else if (par == 5)
        return '5 - Maio';
    else if (par == 6)
        return '6 - Junho';
    else if (par == 7)
        return '7 - Julho';
    else if (par == 8)
        return '8 - Agosto';
    else if (par == 9)
        return '9 - Setembro';
    else if (par == 10)
        return '10 - Outubro';
    else if (par == 11)
        return '11 - Novembro';
    else if (par == 12)
        return '12 - Dezembro';
    else
        return '#0 - Error#';
}