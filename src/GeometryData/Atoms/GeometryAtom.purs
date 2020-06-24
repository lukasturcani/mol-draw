-- | Defines the `GeometryAtom` type.
-- |
-- | A `GeometryAtom` is an atom in the context of a molecule, meaning
-- | that unlike `Atom`, it has an id.

module MolDraw.GeometryAtom
( GeometryAtom
, AtomId
, id
, position
, chemicalSymbol
, atom
, fromAtom
) where


import Prelude
import MolDraw.Position (Position)
import MolDraw.ChemicalSymbol (ChemicalSymbol)
import MolDraw.Atom as Atom


-- | The id of an atom.
type AtomId = Int


-- | Represents atoms in molecules.
data GeometryAtom = GeometryAtom
    { _id             :: AtomId
    , _chemicalSymbol :: ChemicalSymbol
    , _position       :: Position
    }


instance showGeometryAtom :: Show GeometryAtom where
    show atom'
        =  "(GeometryAtom "
        <> show (id atom')
        <> " "
        <> show (chemicalSymbol atom')
        <> " "
        <> show (position atom')
        <> ")"


-- | Get the id of a `GeometryAtom`.
id :: GeometryAtom -> AtomId
id (GeometryAtom { _id } ) = _id

-- | Get the position of a `GeometryAtom`.
position :: GeometryAtom -> Position
position (GeometryAtom { _position } ) = _position

-- | Get the chemical symbol of a `GeometryAtom`.
chemicalSymbol :: GeometryAtom -> ChemicalSymbol
chemicalSymbol (GeometryAtom { _chemicalSymbol } ) = _chemicalSymbol

-- | Create a `GeometryAtom`.
atom :: ChemicalSymbol -> Position -> AtomId -> GeometryAtom
atom chemicalSymbol' position' id' = GeometryAtom
    { _id: id'
    , _chemicalSymbol: chemicalSymbol'
    , _position: position'
    }

-- | Create a `GeometryAtom` from an `Atom`.
fromAtom :: Atom.Atom -> AtomId -> GeometryAtom
fromAtom atom' id' = GeometryAtom
    { _id: id'
    , _chemicalSymbol: Atom.chemicalSymbol atom'
    , _position: Atom.position atom'
    }
