$(function() {
    var preview = document.getElementById('preview');

    navigator.getMedia = (
        navigator.getUserMedia ||
        navigator.webkitGetUserMedia ||
        navigator.mozGetUserMedia ||
        navigator.msGetUserMedia
    );

    if(navigator.getMedia) {
        navigator.getMedia({
            video: true,
            audio: false
        } , function(stream) {
            preview.src = window.URL.createObjectURL(stream);
            preview.play();
        }, function(e) {
            console.log(e);
            alert('tente outro browser!');
        });
    } else {
        alert('tente outro browser!');
    }



});


