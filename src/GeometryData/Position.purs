-- | Defines `Position`.

module MolDraw.Position
( Position ( Position )
, position
) where


import Prelude


-- | Represents a position vector.
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


-- | Create a position vector.
position :: Number -> Number -> Number -> Position
position x y z = Position x y z
