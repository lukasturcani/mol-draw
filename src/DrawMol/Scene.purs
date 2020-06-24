-- | Deals with three.js scenes.

module MolDraw.DrawMol.Scene
( Scene
, SceneOptions
, Color
, scene
) where


import MolDraw.DrawMol.Mesh (Mesh)


type Color = Int


-- | Represents a three.js scene.
data Scene = Scene


-- | Holds user-provided options for customizing the drawn scene.
-- |
-- | * `backgroundColor`: The color of the scene background.
-- | * `containerId`: The id of the HTML div in which the scene should
-- | be drawn.
-- | * `outline`: Toggles the drawing of an outline around the drawn
-- | atoms and bonds.
type SceneOptions =
    { backgroundColor:: Color
    , containerId    :: String
    , outline        :: Boolean
    }


-- | Create a three.js scene.
foreign import scene :: SceneOptions -> Array Mesh -> Scene
