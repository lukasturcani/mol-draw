module MolDraw.Mesh
( Mesh
, MeshOptions (MeshOptions)
, Color
, meshes
) where


import Prelude
import Data.List (List)
import MolDraw.ChemicalSymbol (ChemicalSymbol)
import MolDraw.Atom as Atom
import MolDraw.BondSegment as BondSegment
import MolDraw.GeometryData as GD
import MolDraw.Position (Position)


type Color = Int


type MeshOptions =
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
    (
        { atomSize
        , atomScale
        , atomWidthSegments
        , atomHeightSegments
        , bondRadialSegments
        , bondHeightSegments
        , elementColors
        }
    )
    geometryData =
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


data Mesh = Mesh


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

foreign import meshesImpl :: Helpers -> MeshData -> Array Mesh


helpers :: Helpers
helpers =
    { atomElement               : show <<< Atom.chemicalSymbol
    , atomChemicalSymbol        : Atom.chemicalSymbol
    , atomPosition              : Atom.position
    , atomSize                  : Atom.size
    , bondSegmentElement        : show <<< BondSegment.chemicalSymbol
    , bondSegmentPosition       : BondSegment.position
    , bondSegmentWidth          : BondSegment.width
    , bondSegmentLength         : BondSegment.length
    , bondSegmentGapSize        : BondSegment.gapSize
    , bondSegmentAlignmentPoint : BondSegment.alignmentPoint
    }


meshes :: MeshData -> Array Mesh
meshes = meshesImpl helpers
