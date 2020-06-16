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
import Data.Maybe (Maybe (Just, Nothing))
import Data.Array (filter, foldr)
import Data.String (length)
import Data.String.Utils (lines, words, includes)
import MolDraw.Atom (Atom, atom)
import MolDraw.Position (Position(Position))
import MolDraw.BondSegment (BondSegment)
import MolDraw.ChemicalSymbol (chemicalSymbol)

data Molecule = Molecule

data V3000State = NotReading | ReadingAtoms | ReadingBonds

data V3000Content = V3000Content
    { atoms        :: Map Int Atom
    , bondSegments :: List BondSegment
    , state        :: V3000State
    }

emptyContent :: V3000Content
emptyContent = V3000Content
    { atoms: empty
    , bondSegments: Nil
    , state: NotReading
    }

parseV3000 :: String -> Maybe V3000Content
parseV3000 = foldr parser (Just emptyContent) <<< lines
  where
    parser :: String -> Maybe V3000Content -> Maybe V3000Content
    parser line mcontent = do
       content <- mcontent
       v3000Parser line content


v3000Parser :: String -> V3000Content -> Maybe V3000Content
v3000Parser
    line
    content@(V3000Content { atoms, bondSegments, state: ReadingAtoms })
        | includes "M  V30 END ATOM" line =
            Just
                (V3000Content
                    { atoms: atoms
                    , bondSegments: bondSegments
                    , state: NotReading
                    }
                )

        | otherwise = case parseAtom line of
            Just (Tuple id atom) -> Just (addAtom content id atom)
            Nothing -> Nothing


v3000Parser
    line
    content@(V3000Content { atoms, bondSegments, state: ReadingBonds })
    = Just content
--
--    | includes "M  V30 END BOND" line =
--        Just
--            (NotReading
--                { atoms: atoms
--                , bondSegments: bondSegments
--                , state: NotReading
--                }
--            )
--
--    | otherwise =
--        case parseBond line of
--            (Just bond) -> Just (addBond state bond)
--            Nothing -> Nothing


v3000Parser
    line
    content@(V3000Content { atoms, bondSegments, state: NotReading })

        | includes "M  V30 BEGIN ATOM" line =
            Just
                (V3000Content
                    { atoms: atoms
                    , bondSegments: bondSegments
                    , state: ReadingAtoms
                    }
                )

    --    | includes "M  V30 BEGIN BOND" line =
    --        Just
    --            (V3000Content
    --                { atoms: atoms
    --                , bondSegments: bondSegments
    --                , state: ReadingBonds
    --                }
    --            )

        | otherwise = Just content



words' :: String -> Array String
words' = filter ((>) 0 <<< length) <<< words



parseAtom :: String -> Maybe (Tuple Int Atom)
parseAtom line = readAtom $ words' line



readAtom :: Array String -> Maybe (Tuple Int Atom)
readAtom [_, id, element, x, y, z] = do
    symbol <- chemicalSymbol element
    id'    <- I.fromString id
    x'     <- N.fromString x
    y'     <- N.fromString y
    z'     <- N.fromString z

    let atom' = atom symbol (Position x' y' z')

    Just (Tuple id' atom')

readAtom _ = Nothing



addAtom :: V3000Content -> Int -> Atom -> V3000Content
addAtom (V3000Content { atoms, bondSegments, state }) id atom =
    V3000Content
    { atoms: insert id atom atoms
    , bondSegments: bondSegments
    , state: state
    }
