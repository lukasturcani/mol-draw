"use strict";


const THREE = require('three');


exports.meshesImpl =
    ({
        atomPosition,
        defaultAtomSize,
        defaultAtomColor,
        bondSegmentPosition,
        bondSegmentAtom,
        bondSegmentWidth,
        bondSegmentLength,
        bondSegmentGapSize,
    })                              =>
    (meshData)                      =>
{

    const {
        atoms,
        atomSize,
        atomColor,
        atomScale,
        atomWidthSegments,
        atomHeightSegments,
        bondSegments,
        bondRadialSegments,
        bondHeightSegments,
        material
    } = meshDataWithDefaults(
        meshData,
        defaultAtomSize,
        defaultAtomColor
    );

    const geometries = {};
    const matrix = new THREE.Matrix4();

    for (const atom of atoms)
    {

        const {
            value0: x,
            value1: y,
            value2: z
        } = atomPosition(atom);
        matrix.makeTranslation(x, y, z);

        const color = atomColor(atom);
        if (!geometries.hasOwnProperty(color))
        {
            geometries[color] = new THREE.Geometry();
        }

        const geometry = new THREE.SphereGeometry(
            atomSize(atom)*atomScale,
            atomWidthSegments,
            atomHeightSegments
        );
        geometries[color].merge(geometry, matrix);
    }

    const offsetAxis = new THREE.Vector3(1, 0, 0);
    // A throwaway material used to create a mesh.
    const throwawayMaterial = new THREE.Material();
    for (const bondSegment of bondSegments)
    {
        const width = bondSegmentWidth(bondSegment);
        const geometry = new THREE.CylinderGeometry(
            width,
            width,
            bondSegmentLength(bondSegment),
            bondRadialSegments,
            bondHeightSegments,
            true
        );
        geometry.rotateX(Math.PI/2);

        const color = atomColor(bondSegmentAtom(bondSegment));
        const mesh = new THREE.Mesh(geometry, throwawayMaterial);
        const {
            value0: x,
            value1: y,
            value2: z
        } = bondSegmentPosition(bondSegment);
        mesh.position.set(x, y, z);

        const {
            value0: alignmentX,
            value1: alignmentY,
            value2: alignmentZ
        } = atomPosition(bondSegmentAtom(bondSegment));

        mesh.lookAt(alignmentX, alignmentY, alignmentZ);
        mesh.translateOnAxis(
            offsetAxis,
            bondSegmentGapSize(bondSegment)
        );
        geometries[color].mergeMesh(mesh)
    }

    const meshes = [];
    for (const entry of Object.entries(geometries))
    {
        const [color, geometry] = entry;
        meshes.push(
            new THREE.Mesh(geometry, material(parseInt(color)))
        );
    }
    return meshes;
};


function meshDataWithDefaults(
    meshData,
    defaultAtomSize,
    defaultAtomColor
)
{
    const obj =  assignDefined({
        atomSize: defaultAtomSize,
        atomColor: defaultAtomColor,
        atomScale: 0.5,
        atomWidthSegments: 16,
        atomHeightSegments: 14,
        bondRadialSegments: 10,
        bondHeightSegments: 1,
        material: (color) => new THREE.MeshToonMaterial({
            color: color
        })
    }, meshData);
    return obj;
}


function assignDefined(target, source)
{
    for (const entry of Object.entries(source))
    {
        const [key, value] = entry;
        if (value !== undefined)
        {
            target[key] = value;
        }
    }
    return target;
}
