module MolDraw.DrawMol
( drawMol
, drawMolWithOptions
) where


import MolDraw.Scene (SceneOptions, scene)
import MolDraw.Mesh (MeshOptions)



foreign import drawMolWithOptions
    :: MeshOptions
    -> SceneOptions
    -> String
    -> Either String (Effect)



meshOptions :: MeshOptions
meshOptions =
    {
    }


sceneOptions :: SceneOptions
sceneOptions =
    {
    }

drawMol :: String -> Either String (Effect)
drawMol = drawMolWithOptions meshOptions sceneOptions
