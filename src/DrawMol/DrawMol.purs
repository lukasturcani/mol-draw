module MolDraw.DrawMol
( drawMol
, drawMolWithOptions
) where


import Prelude
import Effect (Effect)
import MolDraw.DrawMol.Scene (Scene, SceneOptions, scene)
import MolDraw.DrawMol.Mesh (MeshOptions, Material, meshes)
import MolDraw.GeometryAtom as GA
import MolDraw.GeometryData (GeometryData)
import MolDraw.Utils.ElementColors (color)
import MolDraw.Utils.ElementSizes (size)


type Color = Int

foreign import toonMaterial :: Color -> Material
foreign import drawMolImpl :: Scene -> Effect Unit


meshOptions :: MeshOptions
meshOptions =
    { atomSize          : size  <<< GA.chemicalSymbol
    , atomColor         : color <<< GA.chemicalSymbol
    , atomScale         : 0.5
    , atomWidthSegments : 16
    , atomHeightSegments: 14
    , bondRadialSegments: 10
    , bondHeightSegments: 1
    , material          : toonMaterial
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
