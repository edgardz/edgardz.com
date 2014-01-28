
var difX = 0;

$(function() {
    var vid = document.getElementById('videoel');
    var overlay = document.getElementById('overlay');
    var overlayCC = overlay.getContext('2d');

    // var ctrack = new clm.tracker({useWebGL : true});
    // ctrack.init(pModel);

    navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.msGetUserMedia;
    window.URL = window.URL || window.webkitURL || window.msURL || window.mozURL;

    var videoSelector = {video : true};
    navigator.getUserMedia(videoSelector, function( stream ) {
        if (vid.mozCaptureStream) {
            vid.mozSrcObject = stream;
        } else {
            vid.src = (window.URL && window.URL.createObjectURL(stream)) || stream;
        }

        vid.play();

        // ctrack.start(vid);
        drawLoop();

    }, function() {
        alert("Tente outro navegador");
    });

    function drawLoop() {
        // requestAnimFrame(drawLoop);
        // overlayCC.clearRect(0, 0, 400, 300);

        // var pos = ctrack.getCurrentPosition()
        // if (pos) {
        //     ctrack.draw(overlay);

        //     difX = pos[33][0] - pos[62][0];
        // }
    }

});


