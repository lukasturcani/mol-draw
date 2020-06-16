{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "molDraw"
, dependencies =
  [ "assert"
  , "console"
  , "effect"
  , "integers"
  , "math"
  , "numbers"
  , "ordered-collections"
  , "psci-support"
  , "strings"
  , "stringutils"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
