{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "mol-draw"
, dependencies =
  [ "arrays"
  , "console"
  , "effect"
  , "either"
  , "integers"
  , "math"
  , "numbers"
  , "ordered-collections"
  , "strings"
  , "stringutils"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
, license = "MIT"
, repository = "https://github.com/lukasturcani/mol-draw"
}
