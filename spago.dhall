{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "molDraw"
, dependencies =
  [ "assert"
  , "console"
  , "effect"
  , "math"
  , "ordered-collections"
  , "psci-support"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
