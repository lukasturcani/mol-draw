module MolDraw.Atom
( Atom
, position
, chemicalSymbol
, atom
) where


import Prelude
import MolDraw.Position (Position)
import MolDraw.ChemicalSymbol (ChemicalSymbol)


data Atom = Atom
    { _chemicalSymbol :: ChemicalSymbol
    , _position       :: Position
    }


instance showAtom :: Show Atom where
    show atom'
        =  "(Atom "
        <> show (chemicalSymbol atom')
        <> " "
        <> show (position atom')
        <> ")"


position :: Atom -> Position
position (Atom { _position } ) = _position

chemicalSymbol :: Atom -> ChemicalSymbol
chemicalSymbol (Atom { _chemicalSymbol } ) = _chemicalSymbol

atom :: ChemicalSymbol -> Position -> Atom
atom chemicalSymbol' position' = Atom
    { _chemicalSymbol: chemicalSymbol'
    , _position: position'
    }
