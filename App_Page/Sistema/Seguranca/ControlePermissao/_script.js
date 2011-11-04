function adjustTable() {

    var table = document.getElementById('tblList');
    
    var hd = document.getElementById('hdControl');

    if (!table || !hd) {
        alert('Houve um erro ao carregar a página!');
    }
    else {

        for (var i = 1; i < table.rows.length; i++) {

            var html = '<input type="checkbox" onclick="javascript:doPermission(\'' +
                table.rows[i].cells[0].innerText + '\');"';
                
            if (table.rows[i].cells[2].innerText == '0') {
                html += ' />';
            }
            else {
                html += ' checked=checked />';
                
                hd.value += table.rows[i].cells[0].innerText + ';';
            }

            table.rows[i].deleteCell(2);
            
            var cell = table.rows[i].insertCell(0);
            
            cell.innerHTML = html;
        }
    }
}

function doPermission(item) {

    var hd = document.getElementById('hdControl');

    if (!hd) {
        alert('Houve um erro ao carregar a página!');
    }
    else {
    
        var i = hd.value.indexOf(item);

        if (i > -1) {
            hd.value = hd.value.substring(0, i) + hd.value.substring(i + 5, hd.value.length)  
        }
        else {
            hd.value += item + ';';
        }
    }
}