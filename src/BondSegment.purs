module MolDraw.BondSegment
( BondSegment
) where

import Prelude
import Data.List (List)
import MolDraw.Position (Position ( Position ))
import MolDraw.Atom as Atom


data BondSegment = BondSegment
    { position :: Position
    , chemicalSymbol :: Atom.ChemicalSymbol
    }


-- bondSegments :: Int -> Atom.Atom -> Atom.Atom -> List BondSegment
