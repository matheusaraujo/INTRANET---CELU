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
        cell.innerText = __formatmonth(dt.getMonth());

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
                cell.innerHTML = "<a href=\"#\" onclick=\"javascript:deletereg('" + table.rows[i].cells[0].innerText + "');\">Excluir Registro</a>";
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

function deletereg(par) {
    document.getElementById('hdControl').value = 'delete;' + par;
    __doPostBack('', '');
}

