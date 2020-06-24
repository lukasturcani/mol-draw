module MolDraw.Utils
( toEither
) where


import Data.Maybe (Maybe(Nothing, Just))
import Data.Either (Either (Left, Right))


toEither :: forall a. String -> Maybe a -> Either String a
toEither errorMessage Nothing = Left errorMessage
toEither errorMessage (Just x) = Right x
