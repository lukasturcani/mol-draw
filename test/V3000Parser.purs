module Test.MolDraw.V3000Parser
where

import Prelude

import Effect (Effect)
import Effect.Class.Console (log)
import Data.Maybe (Maybe (Just, Nothing))
import Data.Array (filter, foldr)

content :: String
content = """

     RDKit          3D

  0  0  0  0  0  0  0  0  0  0999 V3000
M  V30 BEGIN CTAB
M  V30 COUNTS 4 3 0 0 0
M  V30 BEGIN ATOM
M  V30 1 Br -0.0328 1.8852 0.0012 0
M  V30 2 C 0.0054 -0.0185 -0.0002 0
M  V30 3 Br 1.6829 -0.9147 -0.0823 0
M  V30 4 Br -1.6555 -0.9520 0.0814 0
M  V30 END ATOM
M  V30 BEGIN BOND
M  V30 1 1 1 2
M  V30 2 1 2 3
M  V30 3 1 2 4
M  V30 END BOND
M  V30 END CTAB
M  END

$$$$

"""

initial :: Int -> Int -> Int
initial x acc = acc + x

folder :: Int -> Maybe Int -> Maybe Int
folder = map <<< initial



main :: Effect Unit
main = do
    log $ content
    log $ show $ foldr folder (Just 0) [12,3,4,4]


