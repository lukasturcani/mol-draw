module MolDraw.DrawMol
( drawMol
, drawMolWithOptions
) where


import Prelude
import Effect (Effect)
import Effect.Class.Console (log)
import Data.Either (Either(Left, Right))
import MolDraw.DrawMol.Scene (Scene, SceneOptions, scene)
import MolDraw.DrawMol.Mesh (MeshOptions, meshes)
import MolDraw.GeometryAtom as GA
import MolDraw.GeometryData (fromV3000Content)
import MolDraw.Utils.ElementColors (color)
import MolDraw.Utils.ElementSizes (size)
import MolDraw.Parsers.V3000 (parseV3000)


foreign import drawMolImpl :: Scene -> Effect Unit


meshOptions :: MeshOptions
meshOptions =
    { atomSize          : size  <<< GA.chemicalSymbol
    , atomColor         : color <<< GA.chemicalSymbol
    , atomScale         : 0.5
    , atomWidthSegments : 8
    , atomHeightSegments: 7
    , bondRadialSegments: 10
    , bondHeightSegments: 1
    }


eitherToEffect :: Either String Scene -> Effect Unit
eitherToEffect (Left string) = log string
eitherToEffect (Right scene) = drawMolImpl scene


maybeScene
    :: MeshOptions -> SceneOptions -> String -> Either String Scene
maybeScene meshOptions' sceneOptions moleculeString = do
    content <- parseV3000 moleculeString
    let geometryData = fromV3000Content content
        meshes' = meshes meshOptions' geometryData
        scene' = scene sceneOptions meshes'
    pure scene'


drawMolWithOptions
    :: MeshOptions
    -> SceneOptions
    -> String
    -> Effect Unit
drawMolWithOptions meshOptions' sceneOptions moleculeString
    = eitherToEffect maybeScene'
  where
    maybeScene' = maybeScene meshOptions' sceneOptions moleculeString


drawMol :: SceneOptions -> String -> Effect Unit
drawMol = drawMolWithOptions meshOptions
