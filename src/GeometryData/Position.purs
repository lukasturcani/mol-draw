module MolDraw.Position
( Position ( Position )
, position
) where


import Prelude


data Position = Position Number Number Number


instance showPosition :: Show Position where
    show (Position x y z)
        =  "(Position "
        <> show x
        <> " "
        <> show y
        <> " "
        <> show z
        <> ")"


position :: Number -> Number -> Number -> Position
position x y z = Position x y z
