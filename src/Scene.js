"use strict";



const THREE = require('three');



exports.scene = (sceneOptions) => (meshes) =>
{
    const scene = getScene(sceneOptions.backgroundColor);
    const container = getContainer(scene, sceneOptions.containerId);
    const camera = getCamera(scene, container)
    addLight(scene, camera, getCentroid(meshes));
    const renderer = getRenderer(scene, container);
    const controls = getControls(scene, container);
    addOutlineEffect(scene, renderer);
    addMeshes(scene, meshes);
    autoFitTo(getBoundingBox(meshes), camera, controls)
    return scene;
}


function getScene(backgroundColor)
{
    const scene = new THREE.Scene();
    scene.background = new THREE.Color(backgroundColor);
    return scene;
}


function getContainer(scene, containerId)
{
    const container = document.getElementById(containerId);
    scene.userData.container = container;
    return container;
}


function getCamera(scene, container)
{
    const camera = new THREE.PerspectiveCamera(
        20,
        container.clientWidth / container.clientHeight,
        0.1,
        10000
    );
    scene.userData.camera = camera;
    return camera;
}



function addLight(scene, camera, target)
{
    const light = new THREE.DirectionalLight(0xFFFFFF);
    light.position.copy(camera.position.clone().normalize());
    light.position.z *= 2;
    light.position.x *= 5;
    light.position.normalize();
    light.target.position.copy(target);
    scene.add(light);
    scene.userData.light = light;
}



function getRenderer(scene, container)
{
    const renderer = new THREE.WebGLRenderer({
        antialias: true,
        alpha: true
    });
    renderer.setSize(container.clientWidth, container.clientHeight);
    container.appendChild(renderer.domElement);
    scene.userData.renderer = renderer;
    return renderer;
}



function getControls(scene, container)
{
    const controls = new THREE.TrackballControls(camera, container);
    controls.rotateSpeed = 3.0;
    controls.zoomSpeed = 3;
    controls.panSpeed = 2;
    controls.staticMoving = true;
    controls.addEventListener('change', render(scene));
    scene.userData.controls = controls;
    return controls;
}



function addOutlineEffect(scene, renderer)
{
    const outline = new THREE.OutlineEffect(renderer);
    scene.userData.outline = outline;
}



function addMeshes(scene, meshes)
{
    for (const mesh of meshes)
    {
        scene.add(mesh);
    }
}



function getCentroid(meshes)
{
    const centroid = THREE.Vector3(0, 0, 0);
    for (const mesh of meshes)
    {
        centroid.add(mesh.matrix.getWorldPosition());
    }
    return centroid.divide(meshes.length);
}



function render(scene)
{
    function inner()
    {
        scene.userData.light.position.copy(
            scene.userData.camera.position.clone().normalize()
        );
        scene.userData.light.position.z *= 2;
        scene.userData.light.position.x *= 5;
        scene.userData.light.position.normalize();
        scene.userData.renderer.render(scene, scene.userData.camera);
        scene.userData.outline.render(scene, scene.userData.camera);
    }
    return inner;
}

/**
 * Fits molecule into camera view.
 * @author { smcllns }
 *
 * https://github.com/mrdoob/three.js/issues/6784
 */
function autoFitTo(boundingBox, camera, controls) {
    const boundingSphere = new THREE.Sphere();
    boundingBox.getBoundingSphere(boundingSphere);
    const scale = 2.5; // object size / display size
    const objectAngularSize = (camera.fov * Math.PI / 180) * scale;

    const distanceToCamera
        = boundingSphere.radius / Math.tan(objectAngularSize / 2);

    const len = Math.sqrt(
        Math.pow(distanceToCamera, 2)
        +
        Math.pow(distanceToCamera, 2)
    );

    camera.position.set(len, len, len);
    controls.update();

    camera.lookAt(boundingSphere.center);
    controls.target.set(
        boundingSphere.center.x,
        boundingSphere.center.y,
        boundingSphere.center.z
    );

    camera.updateProjectionMatrix();

}


function getBoundingBox(meshes) {
    meshes[0].geometry.computeBoundingBox();
    let bb = meshes[0].geometry.boundingBox.clone();
    for (let mesh of meshes.slice(1)) {
        mesh.geometry.computeBoundingBox();
        bb.union(mesh.geometry.boundingBox);

    }
    return bb;
}
