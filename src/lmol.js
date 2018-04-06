let LMOL = (function() {
    let backgroundColor = 0xFFFFFF;
    let sphereScale = 0.5;
    let elementColors = {
        "H": 0xFFFFFF,
        "He": 0xD9FFFF,
        "Li": 0xCC80FF,
        "Be": 0xC2FF00,
        "B": 0xFFB5B5,
        "C": 0x909090,
        "N": 0x3050F8,
        "O": 0xFF0D0D,
        "F": 0x90E050,
        "Ne": 0xB3E3F5,
        "Na": 0xAB5CF2,
        "Mg": 0x8AFF00,
        "Al": 0xBFA6A6,
        "Si": 0xF0C8A0,
        "P": 0xFF8000,
        "S": 0xFFFF30,
        "Cl": 0x1FF01F,
        "Ar": 0x80D1E3,
        "K": 0x8F40D4,
        "Ca": 0x3DFF00,
        "Sc": 0xE6E6E6,
        "Ti": 0xBFC2C7,
        "V": 0xA6A6AB,
        "Cr": 0x8A99C7,
        "Mn": 0x9C7AC7,
        "Fe": 0xE06633,
        "Co": 0xF090A0,
        "Ni": 0x50D050,
        "Cu": 0xC88033,
        "Zn": 0x7D80B0,
        "Ga": 0xC28F8F,
        "Ge": 0x668F8F,
        "As": 0xBD80E3,
        "Se": 0xFFA100,
        "Br": 0xA62929,
        "Kr": 0x5CB8D1,
        "Rb": 0x702EB0,
        "Sr": 0x00FF00,
        "Y": 0x94FFFF,
        "Zr": 0x94E0E0,
        "Nb": 0x73C2C9,
        "Mo": 0x54B5B5,
        "Tc": 0x3B9E9E,
        "Ru": 0x248F8F,
        "Rh": 0x0A7D8C,
        "Pd": 0x006985,
        "Ag": 0xC0C0C0,
        "Cd": 0xFFD98F,
        "In": 0xA67573,
        "Sn": 0x668080,
        "Sb": 0x9E63B5,
        "Te": 0xD47A00,
        "I": 0x940094,
        "Xe": 0x429EB0,
        "Cs": 0x57178F,
        "Ba": 0x00C900,
        "Hf": 0x4DC2FF,
        "Ta": 0x4DA6FF,
        "W": 0x2194D6,
        "Re": 0x267DAB,
        "Os": 0x266696,
        "Ir": 0x175487,
        "Pt": 0xD0D0E0,
        "Au": 0xFFD123,
        "Hg": 0xB8B8D0,
        "Tl": 0xA6544D,
        "Pb": 0x575961,
        "Bi": 0x9E4FB5,
        "Po": 0xAB5C00,
        "At": 0x754F45,
        "Rn": 0x428296,
        "Fr": 0x420066,
        "Ra": 0x007D00,
        "Rf": 0xCC0059,
        "Db": 0xD1004F,
        "Sg": 0xD90045,
        "Bh": 0xE00038,
        "Hs": 0xE6002E,
        "Mt": 0xEB0026,
        "La": 0x70D4FF,
        "Ce": 0xFFFFC7,
        "Pr": 0xD9FFC7,
        "Nd": 0xC7FFC7,
        "Pm": 0xA3FFC7,
        "Sm": 0x8FFFC7,
        "Eu": 0x61FFC7,
        "Gd": 0x45FFC7,
        "Tb": 0x30FFC7,
        "Dy": 0x1FFFC7,
        "Ho": 0x00FF9C,
        "Er": 0x00E675,
        "Tm": 0x00D452,
        "Yb": 0x00BF38,
        "Lu": 0x00AB24,
        "Ac": 0x70ABFA,
        "Th": 0x00BAFF,
        "Pa": 0x00A1FF,
        "U": 0x008FFF,
        "Np": 0x0080FF,
        "Pu": 0x006BFF,
        "Am": 0x545CF2,
        "Cm": 0x785CE3,
        "Bk": 0x8A4FE3,
        "Cf": 0xA136D4,
        "Es": 0xB31FD4,
        "Fm": 0xB31FBA,
        "Md": 0xB30DA6,
        "No": 0xBD0D87,
        "Lr": 0xC70066};

    // E Clementi, D L Raimondi, W P Reinhardt (1963) J Chem Phys. 38:2686
    let elementSizes = {
        "H": 0.53,
        "He": 0.31,
        "Li": 1.67,
        "Be": 1.12,
        "B": 0.87,
        "C": 0.67,
        "N": 0.56,
        "O": 0.48,
        "F": 0.42,
        "Ne": 0.38,
        "Na": 1.90,
        "Mg": 1.45,
        "Al": 1.18,
        "Si": 1.11,
        "P": 0.98,
        "S": 0.88,
        "Cl": 0.79,
        "Ar": 0.71,
        "K": 2.43,
        "Ca": 1.94,
        "Sc": 1.84,
        "Ti": 1.76,
        "V": 1.71,
        "Cr": 1.66,
        "Mn": 1.61,
        "Fe": 1.56,
        "Co": 1.52,
        "Ni": 1.49,
        "Cu": 1.45,
        "Zn": 1.42,
        "Ga": 1.36,
        "Ge": 1.25,
        "As": 1.14,
        "Se": 1.03,
        "Br": 0.94,
        "Kr": 0.88,
        "Rb": 2.65,
        "Sr": 2.19,
        "Y": 2.12,
        "Zr": 2.06,
        "Nb": 1.98,
        "Mo": 1.90,
        "Tc": 1.83,
        "Ru": 1.78,
        "Rh": 1.73,
        "Pd": 1.69,
        "Ag": 1.65,
        "Cd": 1.61,
        "In": 1.56,
        "Sn": 1.45,
        "Sb": 1.33,
        "Te": 1.23,
        "I": 1.15,
        "Xe": 1.08,
        "Cs": 2.98,
        "Ba": 2.53,
        "La": 1.95,
        "Ce": 1.85,
        "Pr": 2.47,
        "Nd": 2.06,
        "Pm": 2.05,
        "Sm": 2.38,
        "Eu": 2.31,
        "Gd": 2.33,
        "Tb": 2.25,
        "Dy": 2.28,
        "Ho": 2.26,
        "Er": 2.26,
        "Tm": 2.22,
        "Yb": 2.22,
        "Lu": 2.17,
        "Hf": 2.08,
        "Ta": 2.00,
        "W": 1.93,
        "Re": 1.88,
        "Os": 1.85,
        "Ir": 1.80,
        "Pt": 1.77,
        "Au": 1.74,
        "Hg": 1.71,
        "Tl": 1.56,
        "Pb": 1.54,
        "Bi": 1.43,
        "Po": 1.35,
        "At": 1.27,
        "Rn": 1.20,
        "Ac": 1.95,
        "Th": 1.80,
        "Pa": 1.80,
        "U": 1.75,
        "Np": 1.75,
        "Pu": 1.75,
        "Am": 1.75};

    let atomGeo = {};
    let materials = {};

    class Atom {
        constructor(id, element, x, y, z) {
            this.id = id;
            this.element = element;
            this.x = x;
            this.y = y;
            this.z = z;
        }
    }


    class Bond {
        constructor(id, atom1, atom2, order) {
            this.id = id;
            this.atom1 = atom1;
            this.atom2 = atom2;
            this.order = order;
            this.x = (atom1.x+atom2.x)/2
            this.y = (atom1.y+atom2.y)/2
            this.z = (atom1.z+atom2.z)/2
        }

        length() {
            return Math.sqrt((this.atom1.x - this.atom2.x)**2 +
                             (this.atom1.y - this.atom2.y)**2 +
                             (this.atom1.z - this.atom2.z)**2)
        }

        direction() {
            return new THREE.Vector3(this.atom1.x - this.atom2.x,
                                     this.atom1.y - this.atom2.y,
                                     this.atom1.z - this.atom2.z).normalize();
        }



    }


    class Molecule {
        constructor(atoms, bonds) {
            this.atoms = atoms;
            this.bonds = bonds;
        }
    }


    function parseMOL3000(molStr) {
        let lines = molStr.split('\n')
        let atoms = [];
        let bonds = [];
        let atomBlock = false;
        let bondBlock = false;

        for (let i = 0; i < lines.length; ++i) {
            lines[i] = lines[i].trim();

            if (lines[i].includes("M  V30 BEGIN ATOM")) {
    			atomBlock = true;
    			continue;
    		}
    		if (lines[i].includes("M  V30 END ATOM")) {
    			atomBlock = false;
    			continue
    		}
    		if (lines[i].includes("M  V30 BEGIN BOND")) {
    			bondBlock = true;
    			continue;
    		}
    		if (lines[i].includes("M  V30 END BOND")) {
    			bondBlock = false;
    			continue
    		}

            if (atomBlock) {
                let lineData = lines[i].split(/(?: )+/g);
                atoms.push(new Atom(parseInt(lineData[2]),
                                    lineData[3],
                                    parseFloat(lineData[4]),
                                    parseFloat(lineData[5]),
                                    parseFloat(lineData[6])));
                continue;
            }

            if (bondBlock) {
                let lineData = lines[i].split(/(?: )+/g);
                bonds.push(new Bond(parseInt(lineData[2]),
                                    atoms[parseInt(lineData[4])-1],
                                    atoms[parseInt(lineData[5])-1],
                                    parseInt(lineData[3])));
                continue;
            }
        }

        return new Molecule(atoms, bonds);
    }


    function drawAtoms(mol, scene) {

        for (let atom of mol.atoms) {
            if (!atomGeo.hasOwnProperty(atom.element)) {
                atomGeo[atom.element] = new THREE.SphereBufferGeometry(elementSizes[atom.element]*sphereScale, 30, 30);
                materials[atom.element] = new THREE.MeshToonMaterial({color: elementColors[atom.element]});
            }

            let mesh = new THREE.Mesh(atomGeo[atom.element], materials[atom.element]);
            mesh.position.x = atom.x;
            mesh.position.y = atom.y;
            mesh.position.z = atom.z;
            scene.add(mesh);
        }
    }


    function drawBonds(mol, scene) {
        let gapSize = 0.2;

        for (let bond of mol.bonds) {
            let bondSize = 0.1/bond.order;
            let geo = new THREE.CylinderBufferGeometry(bondSize, bondSize, bond.length()/2, 30)
            geo.rotateX(Math.PI/2);

            let meshes = [];
            for (let i = 0; i < bond.order; i++) {
                meshes.push(new THREE.Mesh(geo, materials[bond.atom1.element]));
                meshes.push(new THREE.Mesh(geo, materials[bond.atom2.element]));
            }

            let offsets = [];
            for (let i = 1; i < Math.floor(bond.order/2)+1; i++) {
                offsets.push(i, -i)
            }

            if (bond.order % 2 !== 0) {
                offsets.push(0);
            }

            let offsetAxis = new THREE.Vector3(1, 0, 0);
            for (let i = 0; i < meshes.length; i += 2) {

                meshes[i].position.x = (bond.x + bond.atom1.x)/2;
                meshes[i].position.y = (bond.y + bond.atom1.y)/2;
                meshes[i].position.z = (bond.z + bond.atom1.z)/2;
                meshes[i].lookAt(bond.atom1.x, bond.atom1.y, bond.atom1.z);
                meshes[i].translateOnAxis(offsetAxis, gapSize*offsets[i/2]);

                meshes[i+1].position.x = (bond.x + bond.atom2.x)/2;
                meshes[i+1].position.y = (bond.y + bond.atom2.y)/2;
                meshes[i+1].position.z = (bond.z + bond.atom2.z)/2;
                meshes[i+1].lookAt(bond.atom1.x, bond.atom1.y, bond.atom1.z);
                meshes[i+1].translateOnAxis(offsetAxis, gapSize*offsets[i/2]);

            }

            for (let mesh of meshes) {
                scene.add(mesh);
            }
        }
    }


    function drawMol(molStr, elementId) {
        let mol = parseMOL3000(molStr);

        let scene = new THREE.Scene();
        scene.background = new THREE.Color(backgroundColor);

        let container = document.getElementById(elementId);
        let aspectRatio = container.clientWidth / container.clientHeight;
        let camera = new THREE.PerspectiveCamera(75, aspectRatio, 0.1, 1000);
        let light = new THREE.DirectionalLight(0xFFFFFF);
        light.position.set(0, 1, 1).normalize();
        scene.add(light);

        let renderer = new THREE.WebGLRenderer({antialias: true, alpha: true, canvas: document.getElementById(elementId)});
        renderer.setSize(container.clientWidth, container.clientHeight);


		controls = new THREE.TrackballControls( camera );
		controls.rotateSpeed = 3.0;
		controls.zoomSpeed = 3;
		controls.panSpeed = 2;
		controls.staticMoving = true;
		controls.addEventListener( 'change', render);


        let effect = new THREE.OutlineEffect(renderer);

        drawAtoms(mol, scene);
        drawBonds(mol, scene);

        camera.position.z = 5;

        function render() {
            renderer.render(scene, camera);
            effect.render(scene, camera);
        }

        function animate() {
            requestAnimationFrame(animate);
            controls.update();
        }
        animate();

    }

    return {drawMol: drawMol};
}());
