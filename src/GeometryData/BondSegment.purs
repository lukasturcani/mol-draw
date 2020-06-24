-- | Defines and deals with bond segments.
-- |
-- | To draw a molecule, each bond of the molecule is split in half,
-- | creating two bond segments. This is necessary, because each half
-- | of the bond has a different color, the same as that of the atom it
-- | is connected to.

module MolDraw.BondSegment
( BondSegment
, atom
, position
, bondSegments
, gapSize
, length
, width
) where


import Prelude
import Math (sqrt)
import Data.List (List ( Nil ), (:))
import Data.Int (toNumber)
import MolDraw.Position (Position ( Position ))
import MolDraw.GeometryAtom as GA


type BondOrder = Int


-- | Represents a segment of a bond, of a single color.
data BondSegment = BondSegment
    { _position       :: Position
    , _atom           :: GA.GeometryAtom
    , _length         :: Number
    , _order          :: BondOrder
    , _offset         :: Int
    }


instance showBondSegment :: Show BondSegment where
    show segment
        =  "(BondSegment { position: "
        <> show (position segment)
        <> ", atom: "
        <> show (atom segment)
        <> ", length: "
        <> show (length segment)
        <> ", order: "
        <> show (order segment)
        <> ", offset: "
        <> show (offset segment)
        <> " })"

-- | Get the position of a `BondSegment`.
position :: BondSegment -> Position
position (BondSegment { _position }) = _position

-- | Get the atom to which the segment is attached.
atom :: BondSegment -> GA.GeometryAtom
atom (BondSegment { _atom }) = _atom

-- | Get the length of the segment.
length :: BondSegment -> Number
length (BondSegment { _length }) = _length

-- | Get the bond order of the segment.
order :: BondSegment -> BondOrder
order (BondSegment { _order }) = _order

-- | Get the offset used for positining the segment.
-- |
-- |
offset :: BondSegment -> Int
offset (BondSegment { _offset }) = _offset


width :: BondSegment -> Number
width segment = 0.1 / (toNumber $ order segment)


gapSize :: BondSegment -> Number
gapSize segment = 0.2 * (toNumber $ offset segment)


bondSegments
    :: Int
    -> GA.GeometryAtom
    -> GA.GeometryAtom
    -> List BondSegment

bondSegments order' atom1 atom2 = do
    offset' <- offsets order'
    (BondSegment
        { _position:          segment1Position
        , _atom:              atom1
        , _length:            segmentLength
        , _order:             order'
        , _offset:            offset'
        }
    ) : (BondSegment
            { _position:          segment2Position
            , _atom:              atom2
            , _length:            segmentLength
            , _order:             order'
            , _offset:            offset'
            }
        ) : Nil
  where
    atom1Position@(Position x1 y1 z1) = GA.position atom1
    (Position x2 y2 z2) = GA.position atom2
    displacement = Position (x2-x1) (y2-y1) (z2-z1)
    segmentLength = (sqrt $ selfDot displacement) / 2.0
    bx = (x1+x2) / 2.0
    by = (y1+y2) / 2.0
    bz = (z1+z2) / 2.0
    segment1Position = Position
        ((bx+x1) / 2.0)
        ((by+y1) / 2.0)
        ((bz+z1) / 2.0)
    segment2Position = Position
        ((bx+x2) / 2.0)
        ((by+y2) / 2.0)
        ((bz+z2) / 2.0)


selfDot :: Position -> Number
selfDot (Position x y z) = (x*x) + (y*y) + (z*z)


biRange :: Int -> Int -> List Int
biRange start stop
    | start < stop = -start : start : biRange (start+1) stop
    | otherwise    = Nil


offsets :: Int -> List Int
offsets order'
    | order' `mod` 2 == 0 = biRange 1 (order'/2 + 1)
    | otherwise          = 0 : biRange 1 (order'/2 + 1)
