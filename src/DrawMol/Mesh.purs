module MolDraw.DrawMol.Mesh
( Mesh
, MeshOptions
, Color
, meshes
) where


import Prelude
import Data.Array (fromFoldable)
import MolDraw.GeometryAtom as GA
import MolDraw.BondSegment as BondSegment
import MolDraw.GeometryData as GD
import MolDraw.Position (Position)


type Color = Int


type MeshOptions =
    { atomSize           :: GA.GeometryAtom -> Number
    , atomColor          :: GA.GeometryAtom -> Color
    , atomScale          :: Number
    , atomWidthSegments  :: Int
    , atomHeightSegments :: Int
    , bondRadialSegments :: Int
    , bondHeightSegments :: Int
    }



type MeshData =
    { atoms              :: Array GA.GeometryAtom
    , atomSize           :: GA.GeometryAtom -> Number
    , atomColor          :: GA.GeometryAtom -> Color
    , atomScale          :: Number
    , atomWidthSegments  :: Int
    , atomHeightSegments :: Int
    , bondSegments       :: Array BondSegment.BondSegment
    , bondRadialSegments :: Int
    , bondHeightSegments :: Int
    }



meshData :: MeshOptions -> GD.GeometryData -> MeshData
meshData
    (
        { atomSize
        , atomColor
        , atomScale
        , atomWidthSegments
        , atomHeightSegments
        , bondRadialSegments
        , bondHeightSegments
        }
    )
    geometryData =
        { atoms: fromFoldable $ GD.atoms geometryData
        , bondSegments: fromFoldable $ GD.bondSegments geometryData
        , atomSize: atomSize
        , atomColor: atomColor
        , atomScale: atomScale
        , atomWidthSegments
        , atomHeightSegments
        , bondRadialSegments
        , bondHeightSegments
        }


data Mesh = Mesh


type Helpers =
    { atomPosition        :: GA.GeometryAtom         -> Position
    , bondSegmentPosition :: BondSegment.BondSegment -> Position
    , bondSegmentAtom     :: BondSegment.BondSegment -> GA.GeometryAtom
    , bondSegmentWidth    :: BondSegment.BondSegment -> Number
    , bondSegmentLength   :: BondSegment.BondSegment -> Number
    , bondSegmentGapSize  :: BondSegment.BondSegment -> Number
    , bondSegmentAlignmentPoint :: BondSegment.BondSegment -> Position
    }


foreign import meshesImpl :: Helpers -> MeshData -> Array Mesh


helpers :: Helpers
helpers =
    { atomPosition              : GA.position
    , bondSegmentPosition       : BondSegment.position
    , bondSegmentAtom           : BondSegment.atom
    , bondSegmentWidth          : BondSegment.width
    , bondSegmentLength         : BondSegment.length
    , bondSegmentGapSize        : BondSegment.gapSize
    , bondSegmentAlignmentPoint : BondSegment.alignmentPoint
    }


meshes :: MeshOptions -> GD.GeometryData -> Array Mesh
meshes meshOptions geometryData
    = meshesImpl helpers $ meshData meshOptions geometryData
