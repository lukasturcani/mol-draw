module Test.MolDraw.V3000Parser
where

import Prelude

import Effect (Effect)
import Effect.Class.Console (log)
import Data.Array (filter)
import Data.String (length)
import Data.String.Utils (lines)

import MolDraw.Parsers.V3000 (parseV3000)

content :: String
content = """

     RDKit          3D

  0  0  0  0  0  0  0  0  0  0999 V3000
M  V30 BEGIN CTAB
M  V30 COUNTS 4 3 0 0 0
M  V30 BEGIN ATOM
M  V30 1 Br -0.0328 1.8852 0.0012 0
M  V30 2 C 0.0054 -0.0185 -0.0002 0 CHG=1
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


main :: Effect Unit
main = do
    let validLines = filter ((<) 0 <<< length)<<< lines
    log $ show $ validLines content
    log $ show $ parseV3000 content

