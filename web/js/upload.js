var form = '#upload';                                // Define the FORM-Selector
var btnAdd = "input[name='add']";                      // Define the ADD-Button
var btnFileType = "input[name='files']";                    // Define the FILE-TYPE-Button
var btnUpload = "input[name='upload']";                   // Define the UPLOAD-Button
var selectedOutput = '#upload #prevUpload';                    // Define the Output of <ul>
var filenameLength = 35;
var data_ = null;



$(function() {
    $(btnAdd).click(function() {
        $(this).parent().find(btnFileType).click();
    });
    var count = 0;

    $(form).fileupload({
        url: 'http://localhost:8080/psg/admin/images/upload',
        async: true,
        type: 'POST',
        dataType: 'json',
        processData: false, // Don't process the files

        start: function(e) {

            $(btnUpload).unbind('click');       // Unbind Click Event 
        },
        add: function(e, data) {
            // Form Is not submitted in Chrome and IE.. for firefox it submits the from to same url that i am in.

            var filetype = data.files[0].type.split('/');
            var filename = checkFileName(data.files[0].name, filetype, filenameLength);
            var filesize = formatFileSize(data.files[0].size);
            var reader = new FileReader();
            count=count+1;


            // clear Server-Messages
            $('#uploadMessage').empty();

            // Preview Images and Information


            var tpl = $('<div class="beforeUpload">\n\
                            <div class="image"><img id="target'+count+'" src="#"></div>\n\
                            <input type="text" name="name" placeholder="Bildname"/>\n\
                            <input type="text" name="desc" placeholder="Short Description"/>\n\
                            <span class="filename" title="' + data.files[0].name + '"></span>\n\
                            <span class="closebtn"><i class="fa fa-times-circle"></i></span>\n\
                        </div>');

            // Append the file name and file size
            tpl.find('.filename').text(filename + " ("+filesize +" , "+count+")");
            // Add the HTML to the DIV element
            tpl.appendTo(selectedOutput);
            
            // Preview Image
            reader.onload = function(e) {                 
                $("#target"+count).attr('src', e.target.result);
            };
            reader.readAsDataURL(data.files[0]);

            
            $(btnUpload).click(function() {
                data.submit();
            });

        },
        success: function(data) {

            console.log(data);
            // Upload-Button hidden and clear Information
            $(btnUpload).prop('type', 'hidden');
            $(selectedOutput).empty();
            // If Response successfully print out Image Name
            $.each(data, function(key, value) {
                var message = $('<p style="color:green">' + value + ' wurde erfolgreich hochgeladen !</p>');
                message.appendTo('#uploadMessage');
            });
        },
        error: function(data) {
            console.log(data);
            alert("Error : " + data.statusText + " Status: " + data.status);

        }
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