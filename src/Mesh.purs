module MolDraw.Mesh
( Mesh
, MeshOptions (MeshOptions)
, Color
) where


import Data.List (List)
import Data.Map (Map)
import MolDraw.ChemicalSymbol (ChemicalSymbol)
import MolDraw.Atom as Atom
import MolDraw.BondSegment as BondSegment
import MolDraw.GeometryData as GD
import MolDraw.Foreign.Mesh (mesh)


type Color = Int


data MeshOptions = MeshOptions
    { atomSize           :: Atom.Atom -> Number
    , atomScale          :: Number
    , atomWidthSegments  :: Int
    , atomHeightSegments :: Int
    , bondRadialSegments :: Int
    , bondHeightSegments :: Int
    , elementColors      :: ChemicalSymbol -> Color
    }



type MeshData =
    { atoms              :: List Atom.Atom
    , atomSize           :: Atom.Atom -> Number
    , atomScale          :: Number
    , atomWidthSegments  :: Int
    , atomHeightSegments :: Int
    , bondSegments       :: List BondSegment.BondSegment
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
    { atomElement                :: Atom.Atom        -> String
    , atomChemicalSymbol         :: Atom.Atom        -> ChemicalSymbol
    , atomPosition               :: Atom.Atom        -> Position
    , atomSize                   :: Atom.Atom        -> Number
    , bondSegmentElement         :: BondSegment.BondSegment -> String
    , bondSegmentPosition        :: BondSegment.BondSegment -> Position
    , bondSegmentWidth           :: BondSegment.BondSegment -> Number
    , bondSegmentLength          :: BondSegment.BondSegment -> Number
    , bondSegmentGapSize         :: BondSegment.BondSegment -> Number
    , bondSegmentAlignmentPoint  :: BondSegment.BondSegment -> Position
    }

foreign import meshes :: Helpers -> MeshData -> Array Mesh


helpers :: Helpers
helpers =
    { atomElement: show <<< Atom.chemicalSymbol
    , atom
    }



-- fromV3000 :: MeshOptions -> V3000Content -> Mesh


