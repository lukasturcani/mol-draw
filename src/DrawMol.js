"use strict";


const THREE = require('three');



exports.drawMolImpl = scene =>
{
    render(scene);
    window.addEventListener('resize', onWindowResize(scene), false);
};



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



function onWindowResize(scene) {
    function inner()
    {
        scene.userData.renderer.setSize(
            scene.userData.container.clientWidth,
            scene.userData.container.clientHeight
        );
        scene.userData.camera.aspect = (
            scene.userData.container.clientWidth
            /
            scene.userData.container.clientHeight
        );
        scene.userData.camera.updateProjectionMatrix();
        render(scene);
    }
    return inner;
}
