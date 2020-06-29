module MolDraw.DrawMol
( drawMol
) where


import Prelude
import Effect (Effect)
import MolDraw.DrawMol.Scene (Scene)


type Color = Int

foreign import drawMolImpl :: Scene -> Effect Unit


-- | Draw a scene in a HTML container.
drawMol :: Scene -> Effect Unit
drawMol scene = drawMolImpl scene
