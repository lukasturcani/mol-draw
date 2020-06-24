-- | Defines the `Atom` type.
-- |
-- | You will probably wonder why there is both an `Atom` and a
-- | `GeometryAtom` type. `Atom` represents atoms individually, while
-- | `GeometryAtom` represents an atom in the context of a molecule.
-- | Essentially, the difference is simply that `GeometryAtom` has an
-- | id, while an `Atom` does not.

module MolDraw.Atom
( Atom
, position
, chemicalSymbol
, atom
) where


import Prelude
import MolDraw.Position (Position)
import MolDraw.ChemicalSymbol (ChemicalSymbol)


-- | Represents atoms.
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


-- | Get the position of an atom.
position :: Atom -> Position
position (Atom { _position } ) = _position

-- | Get the chemical symbol of an atom.
chemicalSymbol :: Atom -> ChemicalSymbol
chemicalSymbol (Atom { _chemicalSymbol } ) = _chemicalSymbol

-- | Create an atom.
atom :: ChemicalSymbol -> Position -> Atom
atom chemicalSymbol' position' = Atom
    { _chemicalSymbol: chemicalSymbol'
    , _position: position'
    }
