module MolDraw.BondSegment
( BondSegment
, chemicalSymbol
, position
, bondSegments
, gapSize
, alignmentPoint
, length
, width
) where

import Prelude
import Math (sqrt)
import Data.List (List ( Nil ), (:))
import Data.Int (toNumber)
import MolDraw.Position (Position ( Position ))
import MolDraw.Atom as Atom
import MolDraw.ChemicalSymbol (ChemicalSymbol)



data BondSegment = BondSegment
    { position       :: Position
    , chemicalSymbol :: ChemicalSymbol
    , length         :: Number
    , order          :: Int
    , offset         :: Int
    , alignmentPoint :: Position
    }



instance showBondSegment :: Show BondSegment where
    show
        (BondSegment
            { position: position'
            , chemicalSymbol: symbol
            , length: length'
            , order
            , offset
            }
        )
        =  "(BondSegment { position: "
        <> show position'
        <> ", chemicalSymbol: "
        <> show symbol
        <> ", length: "
        <> show length'
        <> ", order: "
        <> show order
        <> ", offset: "
        <> show offset
        <> " })"



position :: BondSegment -> Position
position (BondSegment { position: position' }) = position'



chemicalSymbol :: BondSegment -> ChemicalSymbol
chemicalSymbol (BondSegment { chemicalSymbol: symbol }) = symbol



length :: BondSegment -> Number
length (BondSegment { length: length' }) = length'



alignmentPoint :: BondSegment -> Position
alignmentPoint (BondSegment { alignmentPoint: point }) = point



width :: BondSegment -> Number
width (BondSegment { order }) = 0.1 / (toNumber order)



gapSize :: BondSegment -> Number
gapSize (BondSegment { offset }) = 0.2 * (toNumber offset)



selfDot :: Position -> Number
selfDot (Position x y z) = (x*x) + (y*y) + (z*z)



biRange :: Int -> Int -> List Int
biRange start stop
    | start < stop = -start : start : biRange (start+1) stop
    | otherwise    = Nil



offsets :: Int -> List Int
offsets order
    | order `mod` 2 == 0 = biRange 1 (order/2 + 1)
    | otherwise          = 0 : biRange 1 (order/2 + 1)



bondSegments :: Int -> Atom.Atom -> Atom.Atom -> List BondSegment
bondSegments order atom1 atom2 = do
    offset <- offsets order
    (BondSegment
        { position:          segment1Position
        , chemicalSymbol:    Atom.chemicalSymbol atom1
        , length:            length'
        , order:             order
        , offset:            offset
        , alignmentPoint:    atom1Position
        }
    ) : (BondSegment
            { position:          segment2Position
            , chemicalSymbol:    Atom.chemicalSymbol atom2
            , length:            length'
            , order:             order
            , offset:            offset
            , alignmentPoint:    atom1Position
            }
        ) : Nil
  where
    atom1Position@(Position x1 y1 z1) = Atom.position atom1
    (Position x2 y2 z2) = Atom.position atom2
    displacement = Position (x2-x1) (y2-y1) (z2-z1)
    length' = (sqrt $ selfDot displacement) / 2.0
    bx = (x1+x2) / 2.0
    by = (y1+y2) / 2.0
    bz = (z1+z2) / 2.0
    segment1Position = Position
        ((bx+x1) / 2.0)
        ((by+y1) / 2.0)
        ((bz+y1) / 2.0)
    segment2Position = Position
        ((bx+x2) / 2.0)
        ((by+y2) / 2.0)
        ((bz+y2) / 2.0)
