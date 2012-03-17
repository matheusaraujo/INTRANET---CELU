/***************************************************
* INTRANET CELU
* \App_Page\BemEstar\HospedePermanentePagamento\listHistoricoHospede.js
* Script para controle da página de histórico por hóspede
* # 2012-03-17
* Matheus Araújo 
***************************************************/

function adjust() {

    var table = document.getElementById('tblList');
    var tableOut = document.getElementById('tblListOut');

    // get the dates
    var dtI = (table.rows[0].cells[1].innerText);
    var dtF = (table.rows[0].cells[2].innerText);

    // basic information
    document.getElementById('tdSituacao').innerText = table.rows[0].cells[8].innerText == 'True' ? 'Ativo' : 'Desligado';
    document.getElementById('tdIngresso').innerText = dtI.substring(6, 8) + '/' + dtI.substring(4, 6) + '/' + dtI.substring(0, 4);
    
    if (table.rows[0].cells[8].innerText != 'True') {
        document.getElementById('tdSaida').innerText = dtF.substring(6, 8) + '/' + dtF.substring(4, 6) + '/' + dtF.substring(0, 4);
    }
    else {
        document.getElementById('tdSaida').innerText = '-';
    }
    

    dtI = new Date(dtI.substring(0, 4), dtI.substring(4, 6), dtI.substring(6, 8), 0, 0, 0, 0);
    dtF = new Date(dtF.substring(0, 4), dtF.substring(4, 6), dtF.substring(6, 8), 0, 0, 0, 0);

    var dt = dtI;

    while (true) {

        var row = tableOut.insertRow();
        
        // year
        var cell = row.insertCell();
        cell.innerText = dt.getFullYear();

        // month
        var cell = row.insertCell();
        cell.innerText = formatmonth(dt.getMonth());

        // get the pay information
        // this a fuck implementation!!
        // i can do it better, but not now, john
        
        flag = false;

        for (i = 0; i < table.rows.length; i++) {
            if (table.rows[i].cells[3].innerText == dt.getFullYear() && table.rows[i].cells[4].innerText == dt.getMonth()) {
                flag = true;
                var cell = row.insertCell();
                cell.innerText = 'Sim';

                var cell = row.insertCell();
                cell.innerText = table.rows[i].cells[5].innerText;

                var cell = row.insertCell();
                cell.innerText = table.rows[i].cells[6].innerText;

                var cell = row.insertCell();
                cell.innerText = table.rows[i].cells[7].innerText;
                if (cell.innerText == '') cell.innerText = '-';

                // delete
                var cell = row.insertCell();
                cell.innerHTML = "<a href=\"#\" onclick=\"javascript:alert('" + table.rows[i].cells[0].innerText + "');\">Excluir Registro</a>";
            }
        }

        // information for not paid
        if (!flag) {
            var cell = row.insertCell();
            cell.innerText = 'Não';
            
            var cell = row.insertCell();
            cell.innerText = '-';

            var cell = row.insertCell();
            cell.innerText = '-';

            var cell = row.insertCell();
            cell.innerText = '-';

            var cell = row.insertCell();
            cell.innerText = '';
        }
        
        // break condiction
        if (dt.getFullYear() == dtF.getFullYear() && dt.getMonth() == dtF.getMonth())
            break;

        // month ++
        if (dt.getMonth() == 11) {
            dt.setMonth(1);
            dt.setFullYear(dt.getFullYear() + 1);
        }
        else {
            dt.setMonth(dt.getMonth() + 1);
        }

    }

    table.visible = false;


}

function formatmonth(par) {
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