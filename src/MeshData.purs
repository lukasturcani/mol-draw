module MolDraw.MeshData
( MeshData
, meshData
, MeshOptions (MeshOptions)
) where


import Data.List (List)
import MolDraw.Atom (Atom)
import MolDraw.BondSegment (BondSegment)
import MolDraw.GeometryData as GD



data MeshOptions = MeshOptions
    { atomSize           :: Atom -> Number
    , atomScale          :: Number
    , atomWidthSegments  :: Int
    , atomHeightSegments :: Int
    , bondRadialSegments :: Int
    , bondHeightSegments :: Int
    , elementColors      :: Map ChemicalSymbol Color
    }



data MeshData = MeshData
    { atoms              :: List Atom
    , atomSize           :: Atom -> Number
    , atomScale          :: Number
    , atomWidthSegments  :: Int
    , atomHeightSegments :: Int
    , bondSegments       :: List BondSegment
    , bondRadialSegments :: Int
    , bondHeightSegments :: Int
    , elementColors      :: Map ChemicalSymbol Color
    }



meshData :: MeshOptions -> GD.GeometryData -> MeshData
meshData
    (MeshOptions
        { atomSize
        , atomScale
        , atomWidthSegments
        , atomHeightSegments
        , bondRadialSegments
        , bondHeightSegments
        , elementColors
        }
    )
    geometryData
    = MeshData
        { atoms: GD.atoms geometryData
        , bondSegments: GD.bondSegments geometryData
        , atomSize: atomSize
        , atomScale: atomScale,
        , atomWidthSegments
        , atomHeightSegments
        , bondRadialSegments
        , bondHeightSegments
        , elementColors
        }