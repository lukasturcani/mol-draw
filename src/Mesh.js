"use strict";


let THREE = require('three');


exports.meshes =
    ({
        atomElement,
        atomChemicalSymbol,
        atomPosition,
        atomSize,
        bondSegmentElement,
        bondSegmentPosition,
        bondSegmentWidth,
        bondSegmentLength,
        bondSegmentGapSize,
        bondSegmentAlignmentPoint,
    })                              =>
    meshData                        =>
{
    let atomGeometries = {};
    let geometries = {};
    let materials = {};
    let matrix = new THREE.Matrix4();

    for (let atom of meshData.atoms)
    {

        let { value0: { x, y, z } } = atomPosition(atom);
        matrix.makeTranslation(x, y, z);

        let element = atomElement(atom);
        if (!geometries.hasOwnProperty(element))
        {
            geometries[element] = new THREE.Geometry();
        }
        if (!atomGeometries.hasOwnProperty(element))
        {
            atomGeometries[element] = new THREE.SphereGeometry(
                atomSize(atom)*meshData.atomScale,
                meshData.atomWidthSegments,
                meshData.atomHeightSegments,
            );
            materials[element] = new THREE.Material({
                color:
                    meshData.elementColors(atomChemicalSymbol(atom)),
            });
        }

        geometries[element].merge(atomGeometries[element], matrix);
    }

    let offsetAxis = new THREE.Vector3(1, 0, 0);
    for (let bondSegment of meshData.bondSegments)
    {
        let width = bondSegmentWidth(bondSegment);
        let geometry = new THREE.CylinderGeometry(
            width,
            width,
            bondSegmentLength(bondSegment),
            meshData.bondRadialSegments,
            meshData.bondHeightSegments,
            true,
        );
        geometry.rotateX(Math.PI/2);

        let element = bondSegmentElement(bondSegment);
        let mesh = new THREE.Mesh(geometry, materials[element]);
        let { x, y, z } = bondSegmentPosition(bondSegment).value0;
        mesh.position.set(x, y, z);

        let { alignmentX, alignmentY, alignmentZ }
            = bondSegmentAlignmentPoint(bondSegment).value0;

        mesh.lookAt(alignmentX, alignmentY, alignmentZ);
        mesh.translateOnAxis(
            offsetAxis,
            bondSegmentGapSize(bondSegment),
        );
        geometries[element].mergeMesh(mesh)
    }

    let meshes = [];
    for (let [element, geometry] of Object.entries(geometries))
    {
        meshes.push(new THREE.Mesh(geometry, materials[element]));
    }
    return meshes;
};
