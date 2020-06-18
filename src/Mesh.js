"use strict";


const THREE = require('three');


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
    const atomGeometries = {};
    const geometries = {};
    const materials = {};
    const matrix = new THREE.Matrix4();

    for (const atom of meshData.atoms)
    {

        const { value0: { x, y, z } } = atomPosition(atom);
        matrix.makeTranslation(x, y, z);

        const element = atomElement(atom);
        if (!geometries.hasOwnProperty(element))
        {
            geometries[element] = new THREE.Geometry();
        }
        if (!atomGeometries.hasOwnProperty(element))
        {
            atomGeometries[element] = new THREE.SphereGeometry(
                atomSize(atom)*meshData.atomScale,
                meshData.atomWidthSegments,
                meshData.atomHeightSegments
            );
            materials[element] = new THREE.Material({
                color:
                    meshData.elementColors(atomChemicalSymbol(atom)),
            });
        }

        geometries[element].merge(atomGeometries[element], matrix);
    }

    const offsetAxis = new THREE.Vector3(1, 0, 0);
    for (const bondSegment of meshData.bondSegments)
    {
        const width = bondSegmentWidth(bondSegment);
        const geometry = new THREE.CylinderGeometry(
            width,
            width,
            bondSegmentLength(bondSegment),
            meshData.bondRadialSegments,
            meshData.bondHeightSegments,
            true
        );
        geometry.rotateX(Math.PI/2);

        const element = bondSegmentElement(bondSegment);
        const mesh = new THREE.Mesh(geometry, materials[element]);
        const { x, y, z } = bondSegmentPosition(bondSegment).value0;
        mesh.position.set(x, y, z);

        const { alignmentX, alignmentY, alignmentZ }
            = bondSegmentAlignmentPoint(bondSegment).value0;

        mesh.lookAt(alignmentX, alignmentY, alignmentZ);
        mesh.translateOnAxis(
            offsetAxis,
            bondSegmentGapSize(bondSegment)
        );
        geometries[element].mergeMesh(mesh)
    }

    const meshes = [];
    for (const entry of Object.entries(geometries))
    {
        const [element, geometry] = entry;
        meshes.push(new THREE.Mesh(geometry, materials[element]));
    }
    return meshes;
};
