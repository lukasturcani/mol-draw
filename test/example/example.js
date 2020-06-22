import { molecule1 } from './molecule1';
import { molecule2 } from './molecule2';


import * as md from '../../output/MolDraw';


md.drawMol({
    backgroundColor: 0xFFFFFF,
    containerId: 'container1',
})(molecule1);

md.drawMol({
    backgroundColor: 0xFFFFFF,
    containerId: 'container2',
})(molecule2);
