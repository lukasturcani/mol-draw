module MolDraw.DrawMol.Scene
( Scene
, SceneOptions
, Color
, scene
) where


import MolDraw.Mesh (Mesh)


type Color = Int


data Scene = Scene


type SceneOptions =
    { backgroundColor:: Color
    , containerId    :: String
    }


foreign import scene :: SceneOptions -> Array Mesh -> Scene
