-- | Deals with the geometry which you want to draw.

module MolDraw.GeometryData
( GeometryData
, atoms
, bondSegments
, fromV3000Content
, maybeParseV3000
, maybeMolecule
) where

import Prelude
import Data.List (List (Nil), fromFoldable)
import Data.Either (Either (Right))
import Data.Foldable (foldM)
import Data.Array ((!!), zipWith, (..), length)
import MolDraw.Atom (Atom)
import MolDraw.Bond (Bond, atom1Id, atom2Id, order)
import MolDraw.GeometryAtom (GeometryAtom, fromAtom)
import MolDraw.BondSegment as BS
import MolDraw.Parsers.V3000 as V3P
import MolDraw.Utils (toEither)


-- | Contains the atoms and bond segments which should be drawn.
data GeometryData = GeometryData
    { _atoms        :: List GeometryAtom
    , _bondSegments :: List BS.BondSegment
    }

-- | Get the atoms which should be drawn.
atoms :: GeometryData -> List GeometryAtom
atoms (GeometryData { _atoms }) = _atoms

-- | Get the bond segments which should be drawn.
bondSegments :: GeometryData -> List BS.BondSegment
bondSegments (GeometryData { _bondSegments }) = _bondSegments

-- | Create `GeometryData` from V3000 MDL file content.
fromV3000Content :: V3P.Content -> GeometryData
fromV3000Content content = GeometryData
    { _atoms: V3P.atoms content
    , _bondSegments: V3P.bondSegments content
    }

-- | Create `GeometryData` by trying to parse V3000 MDL file content.
maybeParseV3000 :: String -> Either String GeometryData
maybeParseV3000 string = do
    content <- V3P.parseV3000 string
    Right $ fromV3000Content content

-- | Create `GeometryData` from explicit atoms and bonds.
-- |
-- | The reason this returns an `Either`, is that the provided bonds
-- | maybe be invalid. For example, if you have 3 atoms, but
-- | also a bond, which says its connected to an atom with id 50.
-- | This is clearly invalid input.
maybeMolecule :: Array Atom -> Array Bond -> Either String GeometryData
maybeMolecule atoms' bonds = do
    bondSegments' <- foldM (addSegments atoms') Nil bonds
    Right $ GeometryData
        { _atoms: fromFoldable
            $ zipWith fromAtom atoms' (0 .. (length atoms' - 1))
        , _bondSegments: bondSegments'
        }


addSegments
    :: Array Atom
    -> List BS.BondSegment
    -> Bond
    -> Either String (List BS.BondSegment)

addSegments atoms' segments bond = do

    atom1' <- toEither
        ("Atom id " <> show (atom1Id bond) <> " is not valid.")
        $ atoms' !! atom1Id bond

    atom2' <- toEither
        ("Atom id " <> show (atom2Id bond) <> " is not valid.")
        $ atoms' !! atom2Id bond

    let atom1 = fromAtom atom1' (atom1Id bond)
        atom2 = fromAtom atom2' (atom2Id bond)

    Right $  BS.bondSegments (order bond) atom1 atom2 <> segments
