module MolDraw.GeometryAtom
( GeometryAtom
, id
, position
, chemicalSymbol
, atom
) where


import Prelude
import MolDraw.Position (Position)
import MolDraw.ChemicalSymbol (ChemicalSymbol)


data GeometryAtom = GeometryAtom
    { _id             :: Int
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


id :: GeometryAtom -> Int
id (GeometryAtom { _id } ) = _id

position :: GeometryAtom -> Position
position (GeometryAtom { _position } ) = _position

chemicalSymbol :: GeometryAtom -> ChemicalSymbol
chemicalSymbol (GeometryAtom { _chemicalSymbol } ) = _chemicalSymbol

atom :: ChemicalSymbol -> Position -> Int -> GeometryAtom
atom chemicalSymbol' position' id' = GeometryAtom
    { _id: id'
    , _chemicalSymbol: chemicalSymbol'
    , _position: position'
    }
