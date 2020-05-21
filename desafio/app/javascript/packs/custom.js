
document.getElementById('file').addEventListener("change", function(e) {                                                                 
    return document.getElementById('filename').value = e.target.files[0].name;                                                           
}); 
