module MolDraw.Mesh
( Mesh
, MeshOptions (MeshOptions)
, Color
) where


import Data.List (List)
import Data.Map (Map)
import MolDraw.ChemicalSymbol (ChemicalSymbol)
import MolDraw.Atom (Atom)
import MolDraw.BondSegment (BondSegment)
import MolDraw.GeometryData as GD
import MolDraw.Foreign.Mesh (mesh)


type Color = Int


data MeshOptions = MeshOptions
    { atomSize           :: Atom -> Number
    , atomScale          :: Number
    , atomWidthSegments  :: Int
    , atomHeightSegments :: Int
    , bondRadialSegments :: Int
    , bondHeightSegments :: Int
    , elementColors      :: ChemicalSymbol -> Color
    }



type MeshData =
    { atoms              :: List Atom
    , atomSize           :: Atom -> Number
    , atomScale          :: Number
    , atomWidthSegments  :: Int
    , atomHeightSegments :: Int
    , bondSegments       :: List BondSegment
    , bondRadialSegments :: Int
    , bondHeightSegments :: Int
    , elementColors      :: ChemicalSymbol -> Color
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
        , atomScale: atomScale
        , atomWidthSegments
        , atomHeightSegments
        , bondRadialSegments
        , bondHeightSegments
        , elementColors
        }


type Helpers =
    { atomElement                :: Atom           -> String
    , atomChemicalSymbol         :: Atom           -> ChemicalSymbol
    , atomPosition               :: Atom           -> Position
    , atomSize                   :: Atom           -> Number
    , bondSegmentElement         :: BondSegment    -> String
    , bondSegmentPosition        :: BondSegment    -> Position
    , bondSegmentWidth           :: BondSegment    -> Number
    , bondSegmentLength          :: BondSegment    -> Number
    , bondSegmentGapSize         :: BondSegment    -> Number
    , bondSegmentAlignmentPoint  :: BondSegment    -> Position
    }

foreign import meshes :: Helpers -> MeshData -> Array Mesh


-- fromV3000 :: MeshOptions -> V3000Content -> Mesh


