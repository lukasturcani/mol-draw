module MolDraw.GeometryData.Position
( Position ( Position )
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
