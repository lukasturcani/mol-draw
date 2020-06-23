module MolDraw.DrawMol
( drawMol
) where


import Prelude
import Effect (Effect)
import MolDraw.DrawMol.Scene (Scene, SceneOptions, scene)
import MolDraw.DrawMol.Mesh (MeshOptions, Material, meshes)
import MolDraw.GeometryData (GeometryData)


type Color = Int

foreign import toonMaterial :: Color -> Material
foreign import drawMolImpl :: Scene -> Effect Unit


drawMol
    :: MeshOptions
    -> SceneOptions
    -> GeometryData
    -> Effect Unit
drawMol meshOptions sceneOptions geometryData
    = drawMolImpl
    $ scene sceneOptions
    $ meshes meshOptions geometryData
