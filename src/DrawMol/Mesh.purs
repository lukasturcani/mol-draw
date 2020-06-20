module MolDraw.DrawMol.Mesh
( Mesh
, MeshOptions
, Color
, meshes
) where


import Prelude
import Data.Array (fromFoldable)
import MolDraw.GeometryData.ChemicalSymbol (ChemicalSymbol)
import MolDraw.GeometryData.Atom as Atom
import MolDraw.GeometryData.BondSegment as BondSegment
import MolDraw.GeometryData.GeometryData as GD
import MolDraw.GeometryData.Position (Position)
import MolDraw.Utils.ElementSizes (size)


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
    { atoms              :: Array Atom.Atom
    , atomSize           :: Atom.Atom -> Number
    , atomScale          :: Number
    , atomWidthSegments  :: Int
    , atomHeightSegments :: Int
    , bondSegments       :: Array BondSegment.BondSegment
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
        { atoms: fromFoldable $ GD.atoms geometryData
        , bondSegments: fromFoldable $ GD.bondSegments geometryData
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
    , atomSize                  : size <<< Atom.chemicalSymbol
    , bondSegmentElement        : show <<< BondSegment.chemicalSymbol
    , bondSegmentPosition       : BondSegment.position
    , bondSegmentWidth          : BondSegment.width
    , bondSegmentLength         : BondSegment.length
    , bondSegmentGapSize        : BondSegment.gapSize
    , bondSegmentAlignmentPoint : BondSegment.alignmentPoint
    }


meshes :: MeshOptions -> GD.GeometryData -> Array Mesh
meshes meshOptions geometryData
    = meshesImpl helpers $ meshData meshOptions geometryData
