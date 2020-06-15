module MolDraw.Position
( Position ( Position )
) where

import Prelude



data Position = Position
    { x :: Number
    , y :: Number
    , z :: Number
    }



instance showPosition :: Show Position where
    show (Position {x,y,z})
        =  "Position { x: "
        <> show x
        <> ", y: "
        <> show y
        <> ", z: "
        <> show z
        <> " }"
