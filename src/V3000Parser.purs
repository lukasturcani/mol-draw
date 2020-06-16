module MolDraw.V3000Parser
( parseV3000
, V3000Content
) where

import Prelude
import Data.Int as I
import Data.Number as N
import Data.Map (Map, insert, empty)
import Data.List (List (Nil))
import Data.Tuple (Tuple(Tuple))
import Data.Either (Either(Left, Right))
import Data.Maybe (Maybe (Just, Nothing))
import Data.Array (filter, foldl)
import Data.String (length)
import Data.String.Utils (lines, words, includes)
import MolDraw.Atom (Atom, atom)
import MolDraw.Position (Position(Position))
import MolDraw.BondSegment (BondSegment)
import MolDraw.ChemicalSymbol (chemicalSymbol)

data Molecule = Molecule

data V3000State = NotReading | ReadingAtoms | ReadingBonds


instance showV3000State :: Show V3000State where
    show NotReading   = "NotReading"
    show ReadingAtoms = "ReadingAtoms"
    show ReadingBonds = "ReadingBonds"


data V3000Content = V3000Content
    { atoms        :: Map Int Atom
    , bondSegments :: List BondSegment
    , state        :: V3000State
    }

type Content = V3000Content


instance showV3000Content :: Show V3000Content where
    show (V3000Content { atoms, bondSegments, state })
        =  "(V30000Content { atoms: "
        <> show atoms
        <> ", bondSegments: "
        <> show bondSegments
        <> ", state: "
        <> show state
        <> " })"



emptyContent :: Content
emptyContent = V3000Content
    { atoms: empty
    , bondSegments: Nil
    , state: NotReading
    }



parseV3000 :: String -> Either String Content
parseV3000 = foldl parser (Right emptyContent) <<< validLines
  where
    validLines = filter ((<) 0 <<< length) <<< lines

    parser :: Either String Content -> String -> Either String Content
    parser econtent line = do
       content <- econtent
       v3000Parser line content


v3000Parser :: String -> Content -> Either String Content
v3000Parser
    line
    content@(V3000Content { atoms, bondSegments, state: ReadingAtoms })
        | includes "M  V30 END ATOM" line =
            Right
                (V3000Content
                    { atoms: atoms
                    , bondSegments: bondSegments
                    , state: NotReading
                    }
                )

        | otherwise = case parseAtom line of
            Right (Tuple id atom) -> Right (addAtom content id atom)
            (Left errorMessage) -> Left errorMessage


v3000Parser
    line
    content@(V3000Content { atoms, bondSegments, state: ReadingBonds })
    = Right content
--
--    | includes "M  V30 END BOND" line =
--        Right
--            (NotReading
--                { atoms: atoms
--                , bondSegments: bondSegments
--                , state: NotReading
--                }
--            )
--
--    | otherwise =
--        case parseBond line of
--            (Right bond) -> Right (addBond state bond)
--            left@(Left _) -> left


v3000Parser
    line
    content@(V3000Content { atoms, bondSegments, state: NotReading })

        | includes "M  V30 BEGIN ATOM" line =
            Right
                (V3000Content
                    { atoms: atoms
                    , bondSegments: bondSegments
                    , state: ReadingAtoms
                    }
                )

    --    | includes "M  V30 BEGIN BOND" line =
    --        Right
    --            (V3000Content
    --                { atoms: atoms
    --                , bondSegments: bondSegments
    --                , state: ReadingBonds
    --                }
    --            )

        | otherwise = Right content



words' :: String -> Array String
words' = filter ((<) 0 <<< length) <<< words



parseAtom :: String -> Either String (Tuple Int Atom)
parseAtom line = readAtom $ words' line



maybeToEither :: forall a. String -> Maybe a -> Either String a
maybeToEither errorMessage Nothing = Left errorMessage
maybeToEither errorMessage (Just x) = Right x



readAtom :: Array String -> Either String (Tuple Int Atom)
readAtom [_, id, element, x, y, z] = do
    symbol <- maybeToEither "Failed to parse element." $
        chemicalSymbol element
    id'    <- maybeToEither "Failed to parse id."     $ I.fromString id
    x'     <- maybeToEither "Failed to parse x."      $ N.fromString x
    y'     <- maybeToEither "Failed to parse y."      $ N.fromString y
    z'     <- maybeToEither "Failed to parse z."      $ N.fromString z

    let atom' = atom symbol (Position x' y' z')

    Right (Tuple id' atom')

readAtom failed = Left (show failed)



addAtom :: Content -> Int -> Atom -> Content
addAtom (V3000Content { atoms, bondSegments, state }) id atom =
    V3000Content
    { atoms: insert id atom atoms
    , bondSegments: bondSegments
    , state: state
    }
