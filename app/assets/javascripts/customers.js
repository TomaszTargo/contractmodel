function showForm() {
    document.getElementById("overlay").style.display = "block";
}

function hideForm() {
    document.getElementById("overlay").style.display = "none";
}


function addAnotherResponse() {

    var div = document.createElement("div");
    div.className += ' response';

    var responsesCount = $('.response').size();

    var mi = document.createElement("input");
    mi.setAttribute('id', 'response');
    mi.setAttribute('type', 'text');
    mi.setAttribute('name', 'term[responses_attributes]['+responsesCount+'][response]');
    mi.setAttribute('placeholder', 'Response');
    div.appendChild(mi);

    var mi = document.createElement("input");
    mi.setAttribute('id', 'points');
    mi.setAttribute('type', 'text');
    mi.setAttribute('name', 'term[responses_attributes]['+responsesCount+'][points]');
    mi.setAttribute('placeholder', 'Numerical Points');
    div.appendChild(mi);


    document.getElementById("responses-box").appendChild(div);
}
