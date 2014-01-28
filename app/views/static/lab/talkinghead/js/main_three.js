$(function() {
    var WEBGL = System.support.webgl === true;
    var WIDTH  = window.innerWidth,
        HEIGHT = window.innerHeight;

    var material = new THREE.MeshLambertMaterial({
        color: 0xaaaaaa
    });

    var video = document.getElementById('videoel');
    var videoImage = document.createElement( 'canvas' );
    videoImage.width = 640;
    videoImage.height = 480;

    var videoImageContext = videoImage.getContext( '2d' );
    videoImageContext.fillStyle = '#ffffff';
    videoImageContext.fillRect( 0, 0, videoImage.width, videoImage.height );

    var videoTexture = new THREE.Texture( videoImage );
    videoTexture.minFilter = THREE.LinearFilter;
    videoTexture.magFilter = THREE.LinearFilter;
    var movieMaterial = new THREE.MeshBasicMaterial( { map: videoTexture, overdraw: true } );

    var VIEW_ANGLE = 45,
        ASPECT     = WIDTH / HEIGHT,
        NEAR       = 0.1,
        FAR        = 10000;

    var camera = new THREE.PerspectiveCamera(VIEW_ANGLE, ASPECT, NEAR, FAR);
        camera.position.z = 5;
        camera.position.y = 1;

    var pointLight1 = new THREE.PointLight(0xFFDDDD);
        pointLight1.position.x = 100;
        pointLight1.position.y = 200;
        pointLight1.position.z = 300;

    var pointLight2 = new THREE.PointLight(0xDDDDFF);
        pointLight2.position.x = -50;
        pointLight2.position.y = -50;
        pointLight2.position.z = 300;

    var scene = new THREE.Scene();
        scene.add(camera);
        scene.add(pointLight1);
        scene.add(pointLight2);

    // Load in the mesh and add it to the scene.
    var mesh;
    var loader = new THREE.JSONLoader();
    loader.load( "models/Head-Mesh-2.js", function(geometry){
        mesh = new THREE.Mesh(geometry, movieMaterial);
        mesh.scale.x = mesh.scale.y = mesh.scale.z = 100;
        scene.add(mesh);

        mesh.applyMatrix( new THREE.Matrix4().makeRotationAxis( rotationAxis, dist*0.001 ) );
    });

    var renderer = WEBGL ? new THREE.WebGLRenderer({ antialias: false, alpha: false }) : new THREE.CanvasRenderer();
        renderer.setSize(WIDTH, HEIGHT);

    var $container = $('#container');
        $container.append(renderer.domElement);


    var startX = 0;
    var startY = 0;
    var targetR = 0.8;
    var targetG = 0;
    var targetB = 0;
    var rotationAxis = new THREE.Vector3(0.4, 0.4, 0.2);
    var dist = -93;

    var leftButtonDown = false;
    $container.mousedown(function(e){
        if(e.which === 1) {
            leftButtonDown = true;
            startX = e.pageX;
            startY = e.pageY;
        } else {
            // if(camera.position.z = 500) {
            //     camera.position.z = 5;
            //     camera.position.y = 1;
            // } else {
            //     camera.position.z = 500;
            //     camera.position.y = 100;
            // }
        }
    });
    $container.mouseup(function(e){if(e.which === 1) leftButtonDown = false;});
    $container.mouseleave(function(e){if(e.which === 1) leftButtonDown = false;});
    $container.mousemove(function(e){
        if(leftButtonDown) {
            dist = distance(startX, startY, e.pageX, e.pageY);

            rotationAxis.x = -(startY - e.pageY);
            rotationAxis.y = -(startX - e.pageX);
            rotationAxis.normalize();

            startX = e.pageX;
            startY = e.pageY;
        }

        targetR = e.pageX / WIDTH;
        targetG = e.pageY / HEIGHT;
        targetB = 1-(e.pageY / HEIGHT);
    });

    var tick = setInterval( function(){
        dist += (0 - dist) * 0.01;
        if(mesh) {
            mesh.applyMatrix( new THREE.Matrix4().makeRotationAxis( rotationAxis, dist*0.001 ) );
        }
    }, 1/30);


    var render = function(){
        // if(mesh) {
        //     mesh.rotation.z = -difX * 0.03;
        // }
        //
        if ( video.readyState === video.HAVE_ENOUGH_DATA ) {
            videoImageContext.drawImage( video, 0, 0 );
            if ( videoTexture )
                videoTexture.needsUpdate = true;
        }

        renderer.render(scene, camera);
        requestAnimationFrame(render);
    };
    render();

    $( window ).resize(function() {
        WIDTH  = window.innerWidth;
        HEIGHT = window.innerHeight;

        renderer.setSize(WIDTH, HEIGHT);
        camera.aspect = WIDTH / HEIGHT;
        camera.updateProjectionMatrix();
    });

});

function distance( x1, y1, x2, y2 ) {
  var xs = 0;
  var ys = 0;
  xs = x2 - x1;
  xs = xs * xs;
  ys = y2 - y1;
  ys = ys * ys;
  return Math.sqrt( xs + ys );
}


