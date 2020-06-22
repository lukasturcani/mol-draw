module MolDraw
( show
, maybeParseV3000
, maybeMolecule
, drawMol
, drawMolWithOptions
, id
, position
, chemicalSymbol
, bond
, atom
, color
, size
, isLeft
, isRight
, fromLeft
, fromRight
) where


import Prelude as Prelude
import Effect (Effect)
import Data.Either as Either
import MolDraw.GeometryData as GeometryData
import MolDraw.Utils.ElementColors as ElementColors
import MolDraw.Utils.ElementSizes as ElementSizes
import MolDraw.ChemicalSymbol as ChemicalSymbol
import MolDraw.DrawMol (drawMol, drawMolWithOptions) as DrawMol
import MolDraw.DrawMol.Scene (SceneOptions) as DrawMol
import MolDraw.DrawMol.Mesh (MeshOptions) as DrawMol
import MolDraw.Atom as Atom
import MolDraw.Bond as Bond
import MolDraw.GeometryAtom as GeometryAtom
import MolDraw.Position as Position


show :: forall a. Prelude.Show a => a -> String
show = Prelude.show


maybeParseV3000
    :: String
    -> Either.Either String GeometryData.GeometryData
maybeParseV3000 = GeometryData.maybeParseV3000


maybeMolecule
    :: Array Atom.Atom
    -> Array Bond.Bond
    -> Either.Either String GeometryData.GeometryData
maybeMolecule = GeometryData.maybeMolecule


drawMol :: DrawMol.SceneOptions -> String -> Effect Prelude.Unit
drawMol = DrawMol.drawMol


drawMolWithOptions
    :: DrawMol.MeshOptions
    -> DrawMol.SceneOptions
    -> String
    -> Effect Prelude.Unit
drawMolWithOptions = DrawMol.drawMolWithOptions


id :: GeometryAtom.GeometryAtom -> Int
id = GeometryAtom.id


position :: GeometryAtom.GeometryAtom -> Position.Position
position = GeometryAtom.position


chemicalSymbol
    :: GeometryAtom.GeometryAtom
    -> ChemicalSymbol.ChemicalSymbol
chemicalSymbol = GeometryAtom.chemicalSymbol


bond :: Int -> Int -> Int -> Bond.Bond
bond = Bond.bond


atom :: ChemicalSymbol.ChemicalSymbol -> Position.Position -> Atom.Atom
atom = Atom.atom


color :: ChemicalSymbol.ChemicalSymbol -> Int
color = ElementColors.color


size :: ChemicalSymbol.ChemicalSymbol -> Number
size = ElementSizes.size


isLeft :: forall a b. Either.Either a b -> Boolean
isLeft = Either.isLeft


isRight :: forall a b. Either.Either a b -> Boolean
isRight = Either.isRight


fromLeft :: forall a b. Partial => Either.Either a b -> a
fromLeft = Either.fromLeft


fromRight :: forall a b. Partial => Either.Either a b -> b
fromRight = Either.fromRight
