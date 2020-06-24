module Test.MolDraw.BondSegment
where

import Prelude

import Effect (Effect)
import Effect.Class.Console (log)

import MolDraw.BondSegment (bondSegments)
import MolDraw.GeometryAtom (atom)
import MolDraw.ChemicalSymbol (ChemicalSymbol (..))
import MolDraw.Position (Position (Position))

main :: Effect Unit
main = do

    let atom1 = atom C (Position 0.0 0.0 0.0) 0
        atom2 = atom N (Position 1.0 0.0 0.0) 1
        segments = bondSegments 1 atom1 atom2
    log $ show $ segments
