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
// -- function __openPopUp(page, name, center, h, w, menubar, resizable, scrollbars) {
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