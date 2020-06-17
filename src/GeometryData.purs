module MolDraw.GeometryData
( GeometryData
, atoms
, bonds
) where


import MolDraw.V3000Parser as V3P



data GeometryData = GeometryData
    { atoms        :: List Atom
    , bondSegments :: List BondSegment
    }


atoms :: GeometryData -> List Atom
atoms (GeometryData { atoms }) = atoms


bondSegments :: GeometryData -> List BondSegment
bonds (GeometryData { bonds }) = bonds


fromV3000Content :: V3P.V3000Content -> GeometryData
fromV3000Content content = GeometryData
    { atoms: V3P.atoms content
    , bonds: V3P.bondSegments content
    }
