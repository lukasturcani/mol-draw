module MolDraw.GeometryData
( GeometryData
, atoms
, bondSegments
, fromV3000Content
, maybeParseV3000
) where

import Prelude
import Data.List (List)
import Data.Either (Either (Right))
import MolDraw.GeometryAtom (GeometryAtom)
import MolDraw.BondSegment (BondSegment)
import MolDraw.Parsers.V3000 as V3P


data GeometryData = GeometryData
    { _atoms        :: List GeometryAtom
    , _bondSegments :: List BondSegment
    }


atoms :: GeometryData -> List GeometryAtom
atoms (GeometryData { _atoms }) = _atoms


bondSegments :: GeometryData -> List BondSegment
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

--maybeMolecule :: Array Atom -> Array Bond -> Either String GeometryData
--maybeMolecule atoms' bonds = GeometryData
--    { atoms: fromFoldable atoms'
--    , bondSegments: foldM (bondSegmentsFromBond atoms') bonds
--    }
--
--
--bondSegmentsFromBond
--    :: Array Atom -> Bond-> Either String (List BondSegment)
--bondSegmentsFromBond atoms' bond = do

--    atom1 <- toEither
--        ("Atom with id " <> show  (atom1Id bond) <> " not found.") $
--        atoms' !! (atom1Id bond)
--
--    atom2 <- toEither
--        ("Atom with id " <> show  (atom2Id bond) <> " not found.") $
--        atoms' !! (atom2Id bond)
--
--    Right $ BS.bondSegments (order bond) atom1 atom2
