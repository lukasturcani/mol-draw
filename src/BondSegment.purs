module MolDraw.BondSegment
( BondSegment
) where

import Prelude
import Math (sqrt)
import Data.List (List ( Nil ), (:), (..))
import MolDraw.Position (Position ( Position ))
import MolDraw.Atom as Atom
import MolDraw.ChemicalSymbol (ChemicalSymbol)



data BondSegment = BondSegment
    { position       :: Position
    , chemicalSymbol :: ChemicalSymbol
    , length         :: Number
    , order          :: Int
    , offset         :: Int
    }



selfDot :: Position -> Number
selfDot (Position { x, y, z }) = (x*x) + (y*y) + (z*z)



offsets :: Int -> List Int
offsets order
    | order `mod` 2 == 0 = (1 .. (order/2))
    | otherwise          = 0 : (1 .. (order/2))



bondSegments :: Int -> Atom.Atom -> Atom.Atom -> List BondSegment
bondSegments order atom1 atom2 = do
    offset <- offsets order
    (BondSegment
        { position: segment1Position
        , chemicalSymbol: Atom.chemicalSymbol atom1
        , length: length
        , order: order
        , offset: offset
        }
    ) : (BondSegment
            { position: segment2Position
            , chemicalSymbol: Atom.chemicalSymbol atom2
            , length: length
            , order: order
            , offset: offset
            }
        ) : Nil
  where
    (Position { x: x1, y: y1, z: z1 }) = Atom.position atom1
    (Position { x: x2, y: y2, z: z2 }) = Atom.position atom2
    displacement = Position
        { x: (x2-x1)
        , y: (y2-y1)
        , z: (z2-z1)
        }
    length = (sqrt $ selfDot displacement) / 2.0
    bx = (x1+x2) / 2.0
    by = (y1+y2) / 2.0
    bz = (z1+z2) / 2.0
    segment1Position = Position
        { x: (bx+x1) / 2.0
        , y: (by+y1) / 2.0
        , z: (bz+y1) / 2.0
        }
    segment2Position = Position
        { x: (bx+x2) / 2.0
        , y: (by+y2) / 2.0
        , z: (bz+y2) / 2.0
        }
