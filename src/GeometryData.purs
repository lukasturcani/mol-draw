module MolDraw.GeometryData
( GeometryData
, atoms
, bondSegments
, fromV3000Content
) where


import Data.List (List)
import MolDraw.Atom (Atom)
import MolDraw.BondSegment (BondSegment)
import MolDraw.V3000Parser as V3P



data GeometryData = GeometryData
    { atoms        :: List Atom
    , bondSegments :: List BondSegment
    }


atoms :: GeometryData -> List Atom
atoms (GeometryData { atoms: atoms' }) = atoms'


bondSegments :: GeometryData -> List BondSegment
bondSegments (GeometryData { bondSegments: segments }) = segments


fromV3000Content :: V3P.V3000Content -> GeometryData
fromV3000Content content = GeometryData
    { atoms: V3P.atoms content
    , bondSegments: V3P.bondSegments content
    }
