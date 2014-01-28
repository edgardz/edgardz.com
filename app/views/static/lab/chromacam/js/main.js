$(function() {
    //https://www.webrtc-experiment.com/RecordRTC/
    //
    var preview = document.getElementById('preview');
    var record = document.getElementById('record');
    var stop = document.getElementById('stop');

    var width = 320;
    var height = 240;

    var recordAudio, recordVideo;

    var keyDataNormal;

    record.onclick = function() {
        record.disabled = true;

        var video_constraints = {
            mandatory: { },
            optional: []
        };

        navigator.getUserMedia({
            audio: true,
            video: video_constraints
        }, function(stream) {

            preview.src = window.URL.createObjectURL(stream);
            preview.play();

            setTimeout(function(){
                var canvas = document.getElementById("videokey");
                if (canvas.getContext) {
                    var context = canvas.getContext('2d');
                    context.drawImage(preview, 0, 0, width, height);
                    keyDataNormal = context.getImageData(0, 0, width, height);
                }
            }, 1000);


            // var legalBufferValues = [256, 512, 1024, 2048, 4096, 8192, 16384];
            // sample-rates in at least the range 22050 to 96000.
            recordAudio = RecordRTC(stream, {
                //bufferSize: 16384,
                //sampleRate: 45000
            });

            recordVideo = RecordRTC(stream, {
                type: 'video'
            });

            recordAudio.startRecording();
            recordVideo.startRecording();

            stop.disabled = false;
        });
    };


    var audioBlob, videoBlob, audioBlobURL, videoBlobURL;

    stop.onclick = function() {
        record.disabled = false;
        stop.disabled = true;

        recordAudio.stopRecording(function(url) {
            audioBlobURL = url;
            audioBlob = recordAudio.getBlob();
        });

        recordVideo.stopRecording(function(url) {
            videoBlobURL = url;
            videoBlob = recordVideo.getBlob();
        });

        preview.src = videoBlobURL;
        preview.play();

        draw();
    };

    function draw() {
        if (window.requestAnimationFrame) window.requestAnimationFrame(draw);
        // IE implementation
        else if (window.msRequestAnimationFrame) window.msRequestAnimationFrame(draw);
        // Firefox implementation
        else if (window.mozRequestAnimationFrame) window.mozRequestAnimationFrame(draw);
        // Chrome implementation
        else if (window.webkitRequestAnimationFrame) window.webkitRequestAnimationFrame(draw);
        // Other browsers that do not yet support feature
        else setTimeout(draw, 16.7);
        drawVideoOnCanvas();
    }

    function drawVideoOnCanvas() {
        var object = preview;

        // var backgroundObject;
        // if (isBackgroundVideo) {
        //     backgroundObject = document.getElementById("videoBackgrounddata");
        // } else {
        //     backgroundObject = document.getElementById("imageBackgrounddata");
        // }

        var keyObject = document.getElementById("videokey");

        var canvas = document.getElementById("videoscreen");
        canvas.setAttribute('width', width);
        canvas.setAttribute('height', height);
        if (canvas.getContext) {
            var context = canvas.getContext('2d');
            // context.drawImage(backgroundObject, 0, 0, width, height);
                context.rect(0,0,width,height);
                context.fillStyle="white";
                context.fill();

            var imgBackgroundData = context.getImageData(0, 0, width, height);
            context.drawImage(object, 0, 0, width, height);
            imgDataNormal = context.getImageData(0, 0, width, height);
            var imgData = context.createImageData(width, height);

            for (i = 0; i < imgData.width * imgData.height * 4; i += 4) {

                var kr = keyDataNormal.data[i + 0];
                var kg = keyDataNormal.data[i + 1];
                var kb = keyDataNormal.data[i + 2];

                var r = imgDataNormal.data[i + 0];
                var g = imgDataNormal.data[i + 1];
                var b = imgDataNormal.data[i + 2];
                var a = imgDataNormal.data[i + 3];

                // compare rgb levels for green and set alphachannel to 0;
                // selectedR = 25;
                // selectedG = 90
                // selectedB = 60;
                // if (r <= selectedR && b <= selectedB && g >= selectedG) {
                //     a = 0;
                // }


                var vr = r-kr;
                var vg = g-kg;
                var vb = b-kb;



                var t = 50;

                if (   (vr < t && vr > -t)
                    && (vg < t && vg > -t)
                    && (vb < t && vb > -t) ) {
                    a = 0;
                }

                if (a != 0) {
                    imgData.data[i + 0] = r;
                    imgData.data[i + 1] = g;
                    imgData.data[i + 2] = b;
                    imgData.data[i + 3] = a;
                }
            }

            for (var y = 0; y < imgData.height; y++) {
                for (var x = 0; x < imgData.width; x++) {

                    var d = ((imgData.width * y) + x) * 4;

                    var r = imgData.data[d + 0];
                    var g = imgData.data[d + 1];
                    var b = imgData.data[d + 2];
                    var a = imgData.data[d + 3];

                    if (imgData.data[d + 3] != 0) {
                        offsetYup = y - 1;
                        offsetYdown = y + 1;
                        offsetXleft = x - 1;
                        offsetxRight = x + 1;

                        var change = false;

                        if(offsetYup > 0) {
                            if(imgData.data[((imgData.width * (y-1) ) + (x)) * 4 + 3] == 0) {
                                change=true;
                            }
                        }

                        if (offsetYdown < imgData.height) {
                            if (imgData.data[((imgData.width * (y + 1)) + (x)) * 4 + 3] == 0) {
                                change = true;
                            }
                        }

                        if (offsetXleft > -1) {
                            if (imgData.data[((imgData.width * y) + (x -1)) * 4 + 3] == 0) {
                                change = true;
                            }
                        }

                        if (offsetxRight < imgData.width) {
                            if (imgData.data[((imgData.width * y) + (x + 1)) * 4 + 3] == 0) {
                                change = true;
                            }
                        }

                        if (change) {
                            var gray = (imgData.data[d + 0] * .393) + (imgData.data[d + 1] * .769) + (imgData.data[d + 2] * .189);
                            imgData.data[d + 0] = (gray * 0.2) + (imgBackgroundData.data[d + 0] *0.9);
                            imgData.data[d + 1] = (gray * 0.2) + (imgBackgroundData.data[d + 1]*0.9);
                            imgData.data[d + 2] = (gray * 0.2) + (imgBackgroundData.data[d + 2] * 0.9);
                            imgData.data[d + 3] = 255;
                        }
                    }

                }
            }

            for (i = 0; i < imgData.width * imgData.height * 4; i += 4) {
                var r = imgData.data[i + 0];
                var g = imgData.data[i + 1];
                var b = imgData.data[i + 2];
                var a = imgData.data[i + 3];
                if (a == 0) {
                        imgData.data[i + 0] = imgBackgroundData.data[i + 0];
                        imgData.data[i + 1] = imgBackgroundData.data[i + 1];
                        imgData.data[i + 2] = imgBackgroundData.data[i + 2];
                        imgData.data[i + 3] = imgBackgroundData.data[i + 3];
                }
            }
            context.putImageData(imgData, 0, 0);

        }
    }

});


