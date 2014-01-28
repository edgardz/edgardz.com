$(function() {

    var WEBGL = System.support.webgl === true;

    var WIDTH  = window.innerWidth,
        HEIGHT = window.innerHeight;


    var material = new THREE.MeshLambertMaterial({
        color: 0x000000
    });

    var size = 100;
    var def = WEBGL ? 2 : 1;
    var cube = new THREE.Mesh(new THREE.CubeGeometry(size,size,size,def,def,def), material);

    var VIEW_ANGLE = 45,
        ASPECT     = WIDTH / HEIGHT,
        NEAR       = 0.1,
        FAR        = 10000;

    var camera = new THREE.PerspectiveCamera(VIEW_ANGLE, ASPECT, NEAR, FAR);
        camera.position.z = 300;

    var pointLight1 = new THREE.PointLight(0xFFDDDD);
        pointLight1.position.x = 50;
        pointLight1.position.y = 50;
        pointLight1.position.z = 130;

    var pointLight2 = new THREE.PointLight(0xDDDDFF);
        pointLight2.position.x = -50;
        pointLight2.position.y = -50;
        pointLight2.position.z = 130;

    var scene = new THREE.Scene();
        scene.add(camera);
        scene.add(cube);
        scene.add(pointLight1);
        scene.add(pointLight2);

    var renderer = WEBGL ? new THREE.WebGLRenderer({ antialias: false, alpha: false }) : new THREE.CanvasRenderer();
        renderer.setSize(WIDTH, HEIGHT);
        renderer.autoClear = false;

    var renderTargetParameters = { minFilter: THREE.LinearFilter, magFilter: THREE.LinearFilter, format: THREE.RGBFormat, stencilBuffer: false };
    var renderTarget = new THREE.WebGLRenderTarget( WIDTH, HEIGHT, renderTargetParameters );
    var effectSave = new THREE.SavePass( new THREE.WebGLRenderTarget( WIDTH, HEIGHT, renderTargetParameters ) );
    var effectBlend = new THREE.ShaderPass( THREE.BlendShader, "tDiffuse1" );
        effectBlend.uniforms[ 'tDiffuse2' ].value = effectSave.renderTarget;
        effectBlend.uniforms[ 'mixRatio' ].value = 0.7;
    var effectVignette = new THREE.ShaderPass( THREE.VignetteShader );
        effectVignette.uniforms[ "offset" ].value = 1.05;
        effectVignette.uniforms[ "darkness" ].value = 0.8;
        effectVignette.renderToScreen = true;
    var renderModel = new THREE.RenderPass( scene, camera );
    var composer = new THREE.EffectComposer( renderer, renderTarget );

    composer.addPass( renderModel );
    // composer.addPass( effectBlend );
    // composer.addPass( effectSave );
    composer.addPass( effectVignette );

    renderer.clear();

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
        cube.applyMatrix( new THREE.Matrix4().makeRotationAxis( rotationAxis, dist*0.001 ) );

        // var mix = dist * 0.01;
        // mix = mix > 0.6 ? 0.6 : mix;
        // mix = mix < 0.2 ? 0.2 : mix;
        // effectBlend.uniforms[ 'mixRatio' ].value = mix;

        material.color.r += (targetR - material.color.r) * 0.01;
        material.color.g += (targetG - material.color.g) * 0.01;
        material.color.b += (targetB - material.color.b) * 0.01;

        // renderer.render(scene, camera);
    }, 1/30);

    var render = function(){
        renderer.clear();
        composer.render( 0.1 );
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


