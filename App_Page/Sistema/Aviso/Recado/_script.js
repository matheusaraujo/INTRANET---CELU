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
                
                if(hd.value.indexOf(formatItem(table.rows[i].cells[0].innerText)) == -1)
					hd.value += formatItem(table.rows[i].cells[0].innerText) + ';';
            }

			table.rows[i].deleteCell(2);
            table.rows[i].deleteCell(0);
            
            var cell = table.rows[i].insertCell(0);
            
            cell.innerHTML = html;
        }
    }
}

function formatItem(item){
	
	if(item < 1000)
		item = '0' + item;
	if(item < 100)
		item = '0' + item;
	if(item < 10)
		item = '0' + item;
		
	return item;
}

function doPermission(item) {

    var hd = document.getElementById('hdControl');

    if (!hd) {
        alert('Houve um erro ao carregar a página!');
    }
    else {
    
		item = formatItem(item);

        var i = hd.value.indexOf(item);

        if (i > -1) {
            hd.value = hd.value.substring(0, i) + hd.value.substring(i + 5, hd.value.length)  
        }
        else {
            hd.value += item + ';';
        }
    }
}