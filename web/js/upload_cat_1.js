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
        // Enable Save Button
        $("input[name='upload']").prop('type', 'submit');
        // Template for Image Preview
        var tpl = $('<img id="target" src="#" alt="" class="left">\n\
                     <input type="text" name="name" placeholder="Bildname"/>\n\
                     <input type="text" name="desc" placeholder="Kurze Beschreibung"/><br class="clear"/>');
                            
        $(selectedOutput).prepend(tpl);
        // Preview Image
        reader.onload = function(e) {
            $("#target").attr('src', e.target.result);
        };
        reader.readAsDataURL(file);
    });
});
