module MolDraw.GeometryData
( GeometryData
, atoms
, bondSegments
, fromV3000Content
, maybeParseV3000
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


data GeometryData = GeometryData
    { _atoms        :: List GeometryAtom
    , _bondSegments :: List BS.BondSegment
    }


atoms :: GeometryData -> List GeometryAtom
atoms (GeometryData { _atoms }) = _atoms


bondSegments :: GeometryData -> List BS.BondSegment
bondSegments (GeometryData { _bondSegments }) = _bondSegments


fromV3000Content :: V3P.V3000Content -> GeometryData
fromV3000Content content = GeometryData
    { _atoms: V3P.atoms content
    , _bondSegments: V3P.bondSegments content
    }


maybeParseV3000 :: String -> Either String GeometryData
maybeParseV3000 string = do
    content <- V3P.parseV3000 string
    Right $ fromV3000Content content



maybeMolecule :: Array Atom -> Array Bond -> Either String GeometryData
maybeMolecule atoms' bonds = do
    bondSegments' <- foldM (addSegments atoms') Nil bonds
    Right $ GeometryData
        { _atoms: fromFoldable $
            zipWith fromAtom atoms' (0 .. (length atoms' - 1))
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
