module MolDraw.DrawMol
( drawMol
, drawMolWithOptions
) where


import Prelude
import Effect (Effect)
import Effect.Class.Console (log)
import MolDraw.DrawMol.Scene (Scene, SceneOptions, scene)
import MolDraw.DrawMol.Mesh (MeshOptions, meshes)
import MolDraw.GeometryAtom as GA
import MolDraw.GeometryData (GeometryData)
import MolDraw.Utils.ElementColors (color)
import MolDraw.Utils.ElementSizes (size)


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


drawMolWithOptions
    :: MeshOptions
    -> SceneOptions
    -> GeometryData
    -> Effect Unit
drawMolWithOptions meshOptions' sceneOptions geometryData
    = drawMolImpl
    $ scene sceneOptions
    $ meshes meshOptions' geometryData


drawMol :: SceneOptions -> GeometryData -> Effect Unit
drawMol = drawMolWithOptions meshOptions
