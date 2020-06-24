-- | General utilities.

module MolDraw.Utils
( toEither
) where


import Data.Maybe (Maybe(Nothing, Just))
import Data.Either (Either (Left, Right))


-- | Convert a `Maybe` into an `Either`, by providing a string, which
-- | is used as a substitute for `Nothing` values.
toEither :: forall a. String -> Maybe a -> Either String a
toEither errorMessage Nothing = Left errorMessage
toEither errorMessage (Just x) = Right x
