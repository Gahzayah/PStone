var form = '#upload';
var btnAdd = "input[name='add']";
var btnFileType = "input[name='files']";

$(function() {
    var fileInput = document.getElementById('fileInput');
    var selectedOutput = $("#prevUpload");
    var count = 0;

    // Click FileInput Button
    $(btnAdd).click(function() {
        $(this).parent().find(btnFileType).click();
    });
   
    // Activate EventListener if btnAdd is called
    fileInput.addEventListener('change', function(e) {
        var reader = new FileReader();
        var file = fileInput.files[0];
        // Disable Upload Button
        $("input[name='add']").prop('type', 'hidden');
        // Template for Image Preview
        var tpl = $('<img id="target" src="#" alt="">');
        $(selectedOutput).prepend(tpl);
        // Preview Image
        reader.onload = function(e) {
            $("#target").attr('src', e.target.result);
        };
        reader.readAsDataURL(file);
    });
});


function formatFileSize(bytes) {
    if (typeof bytes !== 'number') {
        return '';
    }
    if (bytes >= 1000000000) {
        return (bytes / 1000000000).toFixed(2) + ' GB';
    }
    if (bytes >= 1000000) {
        return (bytes / 1000000).toFixed(2) + ' MB';
    }
    return (bytes / 1000).toFixed(2) + ' KB';
}


function checkFileName(filename, filetype, length) {
    if (filename.length > length) {
        filename = filename.substring(0, length) + "...";
    }
    return filename;
}
;

function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            $('#target').attr('src', e.target.result);
        };
        reader.readAsDataURL(input.files[0]);
    }
}

/*
 * Testfunction: for native Javascript x-www-form-urlencoded Transport
 */
function xhrFunc(data) {

    var http = new XMLHttpRequest();
    var formData = new FormData();
    var file = data;

    var url = "http://localhost:8084/Sandbox/databasetest";
    var params = "lorem=ipsum&name=binny"; // String Pair Value

    http.open("POST", url, true);

    //Send the proper header information along with the request
    http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    http.setRequestHeader("Content-length", params.length);
    http.setRequestHeader("Connection", "close");

    http.onreadystatechange = function() {//Call a function when the state changes.
        if (http.status === 200) {
            alert(http.responseText);
        }
    };



    formData.append("thefile", file);
    http.send(formData);

}
/**
 * Test: Click Function for xhrFunction
 */
$("input[name='uploadXhr']").click(function() {
    xhrFunc();
});