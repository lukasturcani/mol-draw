import { molecule1 } from './molecule1';
import { molecule2 } from './molecule2';


import * as md from '../../output/MolDraw';


// Live preview molecules.
md.drawMol({
    backgroundColor: 0xFFFFFF,
    containerId: 'container1',
})(molecule1);

md.drawMol({
    backgroundColor: 0xFFFFFF,
    containerId: 'container2',
})(molecule2);


// readme.rst example 1.
const eg1 = md.maybeParseV3000(`
  0  0  0  0  0  0  0  0  0  0999 V3000
M  V30 BEGIN CTAB
M  V30 COUNTS 4 3 0 0 0
M  V30 BEGIN ATOM
M  V30 1 Br -0.0328 1.8852 0.0012 0
M  V30 2 C 0.0054 -0.0185 -0.0002 0 CHG=1
M  V30 3 Br 1.6829 -0.9147 -0.0823 0
M  V30 4 Br -1.6555 -0.9520 0.0814 0
M  V30 END ATOM
M  V30 BEGIN BOND
M  V30 1 1 1 2
M  V30 2 1 2 3
M  V30 3 1 2 4
M  V30 END BOND
M  V30 END CTAB
M  END
`);

if (md.isLeft(eg1))
{
    console.log('There was an issue with your V3000 file content.');
    console.log(md.fromLeft(eg1));
}
else
{
    md.drawMol({
        backgroundColor: 0xFFFFFF,
        // Id of the div, in which the molecule should be rendered.
        containerId: 'container3'
    })(md.fromRight(eg1));
}

