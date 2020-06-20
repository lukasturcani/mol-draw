module Test.MolDraw.BondSegment
where

import Prelude

import Effect (Effect)
import Effect.Class.Console (log)

import MolDraw.GeometryData.BondSegment (bondSegments)
import MolDraw.GeometryData.Atom (atom)
import MolDraw.GeometryData.ChemicalSymbol (ChemicalSymbol (..))
import MolDraw.GeometryData.Position (Position (Position))

main :: Effect Unit
main = do

    let atom1 = atom C (Position 0.0 0.0 0.0)
        atom2 = atom N (Position 1.0 0.0 0.0)
        segments = bondSegments 1 atom1 atom2
    log $ show $ segments
