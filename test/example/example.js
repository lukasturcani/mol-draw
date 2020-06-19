import { molecule1 } from './molecule1';
import { molecule2 } from './molecule2';


import * as molDraw from '../../output/MolDraw.DrawMol';


molDraw.drawMol({
    backgroundColor: 0xFFFFFF,
    containerId: 'container1',
})(molecule1);

molDraw.drawMol({
    backgroundColor: 0xFFFFFF,
    containerId: 'container2',
})(molecule2);
