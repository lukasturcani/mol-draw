module MolDraw.GeometryData.Atom
( Atom
, position
, chemicalSymbol
, atom
, id
) where


import Prelude
import MolDraw.GeometryData.Position (Position)
import MolDraw.GeometryData.ChemicalSymbol (ChemicalSymbol)


data Atom = Atom
    { id             :: Int
    , chemicalSymbol :: ChemicalSymbol
    , position       :: Position
    }


instance showAtom :: Show Atom where
    show (Atom { id: id', chemicalSymbol: symbol, position: pos })
        =  "(Atom { id: "
        <> show id'
        <> ", chemicalSymbol: "
        <> show symbol
        <> ", position: "
        <> show pos
        <> " })"


position :: Atom -> Position
position (Atom { position: pos }) = pos

chemicalSymbol :: Atom -> ChemicalSymbol
chemicalSymbol (Atom { chemicalSymbol: symbol }) = symbol

atom :: ChemicalSymbol -> Position -> Atom
atom symbol pos = Atom  { chemicalSymbol: symbol, position: pos }

id :: Atom -> Int
id (Atom { id: id' }) = id'
