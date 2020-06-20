module MolDraw.Parsers.V3000
( parseV3000
, V3000Content
, atoms
, bondSegments
) where


import Prelude
import Data.Int as I
import Data.Number as N
import Data.Map (Map, insert, empty, lookup, values)
import Data.List (List (Nil), (:), fromFoldable)
import Data.Tuple (Tuple(Tuple))
import Data.Either (Either(Left, Right))
import Data.Maybe (Maybe (Just, Nothing))
import Data.Array (filter, foldl)
import Data.String (length)
import Data.String.Utils (lines, words, includes)
import MolDraw.Atom (Atom, atom)
import MolDraw.Position (Position(Position))
import MolDraw.BondSegment as BS
import MolDraw.ChemicalSymbol (chemicalSymbol)


data V3000State = NotReading | ReadingAtoms | ReadingBonds


instance showV3000State :: Show V3000State where
    show NotReading   = "NotReading"
    show ReadingAtoms = "ReadingAtoms"
    show ReadingBonds = "ReadingBonds"


data V3000Content = V3000Content
    { atoms        :: Map Int Atom
    , bondSegments :: List BS.BondSegment
    , state        :: V3000State
    }


type Content = V3000Content


instance showV3000Content :: Show V3000Content where
    show (V3000Content
        { atoms: atoms'
        , bondSegments: bondSegments'
        , state
        }
    )
        =  "(V30000Content { atoms: "
        <> show atoms'
        <> ", bondSegments: "
        <> show bondSegments'
        <> ", state: "
        <> show state
        <> " })"


emptyContent :: Content
emptyContent = V3000Content
    { atoms:            empty
    , bondSegments:     Nil
    , state:            NotReading
    }


atoms :: Content -> List Atom
atoms (V3000Content { atoms: atoms' }) = values atoms'


bondSegments :: Content -> List BS.BondSegment
bondSegments (V3000Content { bondSegments: segments }) = segments


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
    content@(V3000Content
        { atoms: atoms'
        , bondSegments: bondSegments'
        , state: ReadingAtoms
        }
    )
        | includes "M  V30 END ATOM" line =
            Right
                (V3000Content
                    { atoms: atoms'
                    , bondSegments: bondSegments'
                    , state: NotReading
                    }
                )

        | otherwise = case parseAtom line of
            Right (Tuple id atom) -> Right (addAtom content id atom)
            (Left errorMessage) -> Left errorMessage


v3000Parser
    line
    content@(V3000Content
        { atoms: atoms'
        , bondSegments: bondSegments'
        , state: ReadingBonds
        }
    )
        | includes "M  V30 END BOND" line =
            Right
                (V3000Content
                    { atoms: atoms'
                    , bondSegments: bondSegments'
                    , state: NotReading
                    }
                )

        | otherwise = case parseBond atoms' line of
            (Right bondSegments'') ->
                Right (addBondSegments content bondSegments'')
            (Left errorMessage) -> Left errorMessage


v3000Parser
    line
    content@(V3000Content
        { atoms: atoms'
        , bondSegments: bondSegments'
        , state: NotReading
        }
    )

        | includes "M  V30 BEGIN ATOM" line =
            Right
                (V3000Content
                    { atoms: atoms'
                    , bondSegments: bondSegments'
                    , state: ReadingAtoms
                    }
                )

        | includes "M  V30 BEGIN BOND" line =
            Right
                (V3000Content
                    { atoms: atoms'
                    , bondSegments: bondSegments'
                    , state: ReadingBonds
                    }
                )

        | otherwise = Right content


words' :: String -> List String
words' = fromFoldable <<< filter ((<) 0 <<< length) <<< words


parseAtom :: String -> Either String (Tuple Int Atom)
parseAtom line = readAtom $ words' line


maybeToEither :: forall a. String -> Maybe a -> Either String a
maybeToEither errorMessage Nothing = Left errorMessage
maybeToEither errorMessage (Just x) = Right x


readAtom :: List String -> Either String (Tuple Int Atom)
readAtom (_:_:id:element:x:y:z:_) = do
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
addAtom
    (V3000Content
        { atoms:            atoms'
        , bondSegments:      bondSegments'
        , state
        }
    )
    id
    atom = V3000Content
        { atoms: insert id atom atoms'
        , bondSegments: bondSegments'
        , state: state
        }


parseBond ::
    Map Int Atom -> String -> Either String (List BS.BondSegment)
parseBond atoms' line = readBond atoms' $ words' line


readBond ::
    Map Int Atom -> List String -> Either String (List BS.BondSegment)
readBond atoms' (_:_:_:order:atom1Id:atom2Id:_) = do
    order' <- maybeToEither "Failed to parse order." $
        I.fromString order
    atom1Id' <- maybeToEither "Failed to parse atom1 id." $
        I.fromString atom1Id
    atom2Id' <- maybeToEither "Failed to parse atom2 id." $
        I.fromString atom2Id
    atom1 <- maybeToEither "Atom 1 not found." $ lookup atom1Id' atoms'
    atom2 <- maybeToEither "Atom 2 not found." $ lookup atom2Id' atoms'

    Right $ BS.bondSegments order' atom1 atom2

readBond atoms' failed = Left (show failed)


addBondSegments :: Content -> List BS.BondSegment -> Content
addBondSegments
    (V3000Content
        { atoms: atoms'
        , bondSegments: oldSegments
        , state
        }
    )
    newSegments
        = V3000Content
            { atoms: atoms'
            , bondSegments: newSegments <> oldSegments
            , state: state
            }
