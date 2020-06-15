module MolDraw.BondSegment
( Bond
) where

import Prelude
import MolDraw.Position (Position ( Position ))
import MolDraw.Atom as Atom


data BondSegment = BondSegment
    { position :: Position
    , chemicalSymbol :: Atom.ChemicalSymbol
    }


bondSegments :: Int -> Atom.Atom -> Atom.Atom -> [BondSegment]
bond order atom1 atom2 = Bond { position: bondPosition }
  where
        (Position { x: x1, y: y1, z: z1 }) = Atom.position atom1
        (Position { x: x2, y: y2, z: z2 }) = Atom.position atom2
        bondPosition = Position
            { x: (x1+x2) / 2.0
            , y: (y1+y2) / 2.0
            , z: (z1+z2) / 2.0
            }
