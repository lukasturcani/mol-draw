module MolDraw.DrawMol
( drawMol
, drawMolWithOptions
) where


import Prelude
import Effect (Effect)
import Effect.Class.Console (log)

import MolDraw.Scene (Scene, SceneOptions, scene)
import MolDraw.Mesh (MeshOptions, meshes)
import MolDraw.Atom as Atom
import MolDraw.ElementColors (elementColors)
import MolDraw.V3000Parser (parseV3000)
import MolDraw.GeometryData (fromV3000Content)



foreign import drawMolImp :: Scene -> Effect Unit



meshOptions :: MeshOptions
meshOptions =
    { atomSize          : Atom.size
    , atomScale         : 0.5
    , atomWidthSegments : 8
    , atomHeightSegments: 7
    , bondRadialSegments: 10
    , bondHeightSegments: 1
    , elementColors     : elementColors <<< Atom.chemicalSymbol
    }




eitherToEffect :: Either String Scene -> Effect Unit
eitherToEffect (Left string) = log string
eitherToEffect (Right scene) = drawImpl scene


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
drawMolWithOptions meshOptions' sceneOptions moleculeString = do
    let maybeScene' =
        maybeScene meshOptions' sceneOptions moleculeString

    eitherToEffect maybeScene'



drawMol :: SceneOptions -> String -> Effect Unit
drawMol = drawMolWithOptions meshOptions
