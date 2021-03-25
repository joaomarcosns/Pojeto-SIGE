var selectSugestion;
var btnSugestion;

function showSugestions(value) {

    switch (value) {
        case 'rem':
            btnSugestion = document.getElementById("btn-sugestion-rem");
            selectSugestion = document.getElementById("select-sugestion-rem");
            btnSugestion.style.display = "none";
            selectSugestion.style.display = "block";
            break;
        case 'dest':
            btnSugestion = document.getElementById("btn-sugestion-dest");
            selectSugestion = document.getElementById("select-sugestion-dest");
            btnSugestion.style.display = "none";
            selectSugestion.style.display = "block";
            break;
        default:
            break;
    }

}

function hideSugestions() {
    btnSugestion.style.display = "block";
    selectSugestion.style.display = "none";
}