var form = '#upload';                                // Define the FORM-Selector
var btnAdd = "input[name='add']";                      // Define the ADD-Button
var btnFileType = "input[name='files']";                    // Define the FILE-TYPE-Button
var btnUpload = "input[name='upload']";                     // Define the UPLOAD-Button
var selectedOutput = '#upload #prevUpload';                    // Define the Output of <ul>
var filenameLength = 35;
var data_ = null;



$(function() {
    var count = 0;

    $(btnAdd).click(function() {
        $(this).parent().find(btnFileType).click();
    });

    $(form).fileupload({
        async: true,
        dataType: 'json',
        processData: false, // Don't process the files

        start: function(e) {
            //   $(btnUpload).unbind('click');       // Unbind Click Event 
        },
        add: function(e, data) {
            // Form Is not submitted in Chrome and IE.. for firefox it submits the from to same url that i am in.
            var reader = new FileReader();
            count = count + 1;
            $(btnUpload).unbind()
            // clear Server-Messages
            $('#uploadMessage').empty();

            // Preview Images and Information
            var tpl = $('<div class="beforeUpload">\n\
                            <div class="image"><img id="target' + count + '" src="#" alt="' + data.files[0].name + '"></div>\n\
                        </div>');
            // Add the HTML to the DIV element
            tpl.appendTo(selectedOutput);
            $("input[name='add']").prop('type', 'hidden')

            // Preview Image
            reader.onload = function(e) {
                $("#target" + count).attr('src', e.target.result);
            };
            reader.readAsDataURL(data.files[0]);

            // Wenn nicht benutzt wird application/octect-stream verschickt
            $(btnUpload).click(function() {
                var error = 0;
                var gal = $("#upload select option:first-child").text();
                var cat = $("#upload input[name='newCategory']").text();

                if (gal === null || gal === "" || gal === "Gallery wählen") {
                    $("main").prepend("<p class='warning'>Wählen sie eine Gallery aus!</p>");
                    error = 1;
                }
                if (cat === null || cat === "" || cat === "Neue Kategorie") {
                    $("main").prepend("<p class='warning'>Tragen sie eine Kategorie ein!</p>");
                    error = 2;
                }

                if (error === 0) {
                    data.submit();
                } else {
                    data.abort();
                    e.unbind();
                }
            });



        },
        success: function(data) {
            console.log(data);
            $(selectedOutput).empty();

        },
        error: function(data) {
            console.log(data);
            alert("Error : " + data.statusText + " Status: " + data.status);
        }
    });
});

function validate() {
    var error = 0;
//    $(".warning").remove();
    var gal = $("#upload select option:first-child").text();
    var cat = $("#upload input[name='newCategory']").text();
    var desc = $("#upload input[name='newDescription']").text();
    var img = $("#upload #prevUpload").html();


    if (gal === null || gal === "" || gal === "Gallery wählen") {
        $("main").prepend("<p class='warning'>Wählen sie eine Gallery aus!</p>");
        error = 1;
    }
    if (cat === null || cat === "" || cat === "Neue Kategorie") {
        $("main").prepend("<p class='warning'>Tragen sie eine Kategorie ein!</p>");
        error = 2;
    }
    if (desc === null || desc === "" || desc === "Beschreibung") {
        $("main").prepend("<p class='warning'>Tragen sie eine Beschreibung ein!</p>");
        error = 3;
    }
    if (img === null || img === "") {
        $("main").prepend("<p class='warning'>Bitte wählen sie ein Kategorie Bild aus!</p>");
    }
    return error;
}


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