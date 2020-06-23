module MolDraw.DrawMol.Scene
( Scene
, SceneOptions
, Color
, scene
) where


import MolDraw.DrawMol.Mesh (Mesh)


type Color = Int


data Scene = Scene


type SceneOptions =
    { backgroundColor:: Color
    , containerId    :: String
    , outline        :: Boolean
    }


foreign import scene :: SceneOptions -> Array Mesh -> Scene
