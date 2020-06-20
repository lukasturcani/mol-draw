module MolDraw.GeometryData.Atom
( Atom
, position
, chemicalSymbol
, atom
) where


import Prelude
import MolDraw.GeometryData.Position (Position)
import MolDraw.GeometryData.ChemicalSymbol (ChemicalSymbol (..))


data Atom = Atom
    { chemicalSymbol :: ChemicalSymbol
    , position       :: Position
    }


instance showAtom :: Show Atom where
    show (Atom { chemicalSymbol: symbol, position: pos })
        =  "(Atom { chemicalSymbol: "
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
