module MolDraw.Molecule
( Molecule
) where

import Data.Array (filter)
import Data.String (length)
import Data.String.Utils (words, includes)
import MolDraw.Atom (atom)
import MolDraw.Position (Position(Position))

data Molecule = Molecule

data V3000State = NotReading | ReadingAtoms | ReadingBonds

data V3000Content = V3000Content
    { atoms        :: Map Int Atom
    , bondSegments :: List BondSegment
    , state        :: V3000State
    }



V3000Parser :: V3000Content -> String -> Maybe V3000Content

parser state@(V3000Content { atoms, bondSegments, ReadingAtoms }) line

    | includes "M  V30 END ATOM" line =
        Just
            (V3000Content
                { atoms: atoms
                , bondSegments: bondSegments
                , state: NotReading
                }
            )

    | otherwise =
        case parseAtom line of
            (Just (id, atom)) -> Just (addAtom state id atom)
            Nothing -> Nothing


parser state@(V3000Content { atoms, bondSegments, ReadingBonds }) line

    | includes "M  V30 END BOND" line =
        Just
            (NotReading
                { atoms: atoms
                , bondSegments: bondSegments
                , state: NotReading
                }
            )

    | otherwise =
        case parseBond line of
            (Just bond) -> Just (addBond state bond)
            Nothing -> Nothing


parser state@(V3000Content { atoms, bondSegments, NotReading }) line

    | includes "M  V30 BEGIN ATOM" line =
        Just
            (V3000Content
                { atoms: atoms
                , bondSegments: bondSegments
                , state: ReadingAtoms
                }
            )

    | includes "M  V30 BEGIN BOND" line =
        Just
            (V3000Content
                { atoms: atoms
                , bondSegments: bondSegments
                , state: ReadingBonds
                }
            )

    | otherwise -> Just state



words' :: String -> Array String
words' = filter ((>) 0 <<< length) words line



parseAtom :: String -> Maybe (Tuple (Int, Atom))
parseAtom line = readAtom $ words' line



readAtom :: Array String -> Maybe (Tuple (Int, Atom))
readAtom [_, id, element, x, y, z] = do
    symbol <- chemicalSymbol element
    Just (Tuple id atom')
  where
    atom' = atom symbol position
    position = Position (read x) (read y) (read z)

readAtom _ = Nothing



addAtom :: V3000Content -> Int -> Atom -> V3000Content
addAtom (V3000Content {atoms bondSegments, state}) id atom =
    V3000Content
    { atoms: insert id atom toms
    , bondSegments: bondSegments
    , state: state
    }
