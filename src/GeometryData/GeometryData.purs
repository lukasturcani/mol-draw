module MolDraw.GeometryData.GeometryData
( GeometryData
, atoms
, bondSegments
, fromV3000Content
, atom
, bond
, molecule
) where


import Data.List (List, fromFoldable)
import Data.Map (Map)
import MolDraw.GeometryData.Atoms (Atom, GeometryAtom)
import MolDraw.GeometryData.BondSegment (BondSegment)
import MolDraw.GeometryData.Bond (Bond)
import MolDraw.Parsers.V3000 as V3P


data GeometryData = GeometryData
    { atoms        :: List GeometryAtom
    , bondSegments :: List BondSegment
    }


atoms :: GeometryData -> List GeometryAtom
atoms (GeometryData { atoms: atoms' }) = atoms'


bondSegments :: GeometryData -> List BondSegment
bondSegments (GeometryData { bondSegments: segments }) = segments


fromV3000Content :: V3P.V3000Content -> GeometryData
fromV3000Content content = GeometryData
    { atoms: V3P.atoms content
    , bondSegments: V3P.bondSegments content
    }


maybeMolecule :: Array Atom -> Array Bond -> Maybe GeometryData
maybeMolecule atoms' bonds = GeometryData
    { atoms: fromFoldable atoms'
    , bondSegments: fromFoldable bondSegments'
    }
  where
    atomMap =
    bondSegments' = do
        bond <- bonds
        let atom1 = lookup (atom1Id bond) atomMap
            segments = bondSegments (order bond) atom1 atom2

