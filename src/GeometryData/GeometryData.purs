-- | Deals with the geometry which you want to draw.

module MolDraw.GeometryData
( GeometryData
, atoms
, bondSegments
, fromV3000Content
, maybeParseV3000
, maybeMolecule
) where

import Prelude
import Data.List (List (Nil), fromFoldable)
import Data.Either (Either (Right))
import Data.Foldable (foldM)
import Data.Array ((!!), zipWith, (..), length)
import ValidatedMolecule as Validated
import ValidatedMolecule.Position as VPosition
import MolDraw.ChemicalSymbol (ChemicalSymbol (..))
import MolDraw.Position (Position, position)
import MolDraw.Atom (Atom)
import MolDraw.Bond (Bond, atom1Id, atom2Id, order)
import MolDraw.GeometryAtom (GeometryAtom, fromAtom, atom)
import MolDraw.BondSegment as BS
import MolDraw.Parsers.V3000 as V3P
import MolDraw.Utils (toEither)


-- | Contains the atoms and bond segments which should be drawn.
data GeometryData = GeometryData
    { _atoms        :: List GeometryAtom
    , _bondSegments :: List BS.BondSegment
    }

-- | Get the atoms which should be drawn.
atoms :: GeometryData -> List GeometryAtom
atoms (GeometryData { _atoms }) = _atoms

-- | Get the bond segments which should be drawn.
bondSegments :: GeometryData -> List BS.BondSegment
bondSegments (GeometryData { _bondSegments }) = _bondSegments

-- | Create `GeometryData` from a validated molecule.
fromValidatedMolecule :: Validated.Molecule -> GeometryData
fromValidatedMolecule molecule = GeometryData
    { _atoms:
        fromFoldable $ map _toGeometryAtom (Validated.atoms molecule)
    , _bondSegments: _validatedBondSegments molecule
    }

_toGeometryAtom :: Validated.MoleculeAtom -> GeometryAtom
_toGeometryAtom atom' =
    atom (_chemicalSymbol atom') (_position atom') (Validated.id atom')

_chemicalSymbol :: Validated.MoleculeAtom -> ChemicalSymbol
_chemicalSymbol = _convertChemicalSymbol <<< Validated.chemicalSymbol

_position :: Validated.MoleculeAtom -> Position
_position atom' = position x y z
  where
    position' = Validated.position atom'
    x = VPosition.x position'
    y = VPosition.y position'
    z = VPosition.z position'

_validatedBondSegments :: Validated.Molecule -> List BS.BondSegment
_validatedBondSegments molecule = do
    bond <- fromFoldable $ Validated.bonds molecule
    let atom1 = _toGeometryAtom (Validated.atom1 bond)
    let atom2 = _toGeometryAtom (Validated.atom2 bond)
    BS.bondSegments (Validated.order bond) atom1 atom2

-- | Create `GeometryData` from V3000 MDL file content.
fromV3000Content :: V3P.Content -> GeometryData
fromV3000Content content = GeometryData
    { _atoms: V3P.atoms content
    , _bondSegments: V3P.bondSegments content
    }

-- | Create `GeometryData` by trying to parse V3000 MDL file content.
maybeParseV3000 :: String -> Either String GeometryData
maybeParseV3000 string = do
    content <- V3P.parseV3000 string
    Right $ fromV3000Content content

-- | Create `GeometryData` from explicit atoms and bonds.
-- |
-- | The reason this returns an `Either`, is that the provided bonds
-- | maybe be invalid. For example, if you have 3 atoms, but
-- | also a bond, which says its connected to an atom with id 50.
-- | This is clearly invalid input.
maybeMolecule :: Array Atom -> Array Bond -> Either String GeometryData
maybeMolecule atoms' bonds = do
    bondSegments' <- foldM (addSegments atoms') Nil bonds
    Right $ GeometryData
        { _atoms: fromFoldable
            $ zipWith fromAtom atoms' (0 .. (length atoms' - 1))
        , _bondSegments: bondSegments'
        }


addSegments
    :: Array Atom
    -> List BS.BondSegment
    -> Bond
    -> Either String (List BS.BondSegment)

addSegments atoms' segments bond = do

    atom1' <- toEither
        ("Atom id " <> show (atom1Id bond) <> " is not valid.")
        $ atoms' !! atom1Id bond

    atom2' <- toEither
        ("Atom id " <> show (atom2Id bond) <> " is not valid.")
        $ atoms' !! atom2Id bond

    let atom1 = fromAtom atom1' (atom1Id bond)
        atom2 = fromAtom atom2' (atom2Id bond)

    Right $  BS.bondSegments (order bond) atom1 atom2 <> segments

_convertChemicalSymbol :: Validated.ChemicalSymbol -> ChemicalSymbol
_convertChemicalSymbol Validated.H  = H
_convertChemicalSymbol Validated.He = He
_convertChemicalSymbol Validated.Li = Li
_convertChemicalSymbol Validated.Be = Be
_convertChemicalSymbol Validated.B  = B
_convertChemicalSymbol Validated.C  = C
_convertChemicalSymbol Validated.N  = N
_convertChemicalSymbol Validated.O  = O
_convertChemicalSymbol Validated.F  = F
_convertChemicalSymbol Validated.Ne = Ne
_convertChemicalSymbol Validated.Na = Na
_convertChemicalSymbol Validated.Mg = Mg
_convertChemicalSymbol Validated.Al = Al
_convertChemicalSymbol Validated.Si = Si
_convertChemicalSymbol Validated.P  = P
_convertChemicalSymbol Validated.S  = S
_convertChemicalSymbol Validated.Cl = Cl
_convertChemicalSymbol Validated.Ar = Ar
_convertChemicalSymbol Validated.K  = K
_convertChemicalSymbol Validated.Ca = Ca
_convertChemicalSymbol Validated.Sc = Sc
_convertChemicalSymbol Validated.Ti = Ti
_convertChemicalSymbol Validated.V  = V
_convertChemicalSymbol Validated.Cr = Cr
_convertChemicalSymbol Validated.Mn = Mn
_convertChemicalSymbol Validated.Fe = Fe
_convertChemicalSymbol Validated.Co = Co
_convertChemicalSymbol Validated.Ni = Ni
_convertChemicalSymbol Validated.Cu = Cu
_convertChemicalSymbol Validated.Zn = Zn
_convertChemicalSymbol Validated.Ga = Ga
_convertChemicalSymbol Validated.Ge = Ge
_convertChemicalSymbol Validated.As = As
_convertChemicalSymbol Validated.Se = Se
_convertChemicalSymbol Validated.Br = Br
_convertChemicalSymbol Validated.Kr = Kr
_convertChemicalSymbol Validated.Rb = Rb
_convertChemicalSymbol Validated.Sr = Sr
_convertChemicalSymbol Validated.Y  = Y
_convertChemicalSymbol Validated.Zr = Zr
_convertChemicalSymbol Validated.Nb = Nb
_convertChemicalSymbol Validated.Mo = Mo
_convertChemicalSymbol Validated.Tc = Tc
_convertChemicalSymbol Validated.Ru = Ru
_convertChemicalSymbol Validated.Rh = Rh
_convertChemicalSymbol Validated.Pd = Pd
_convertChemicalSymbol Validated.Ag = Ag
_convertChemicalSymbol Validated.Cd = Cd
_convertChemicalSymbol Validated.In = In
_convertChemicalSymbol Validated.Sn = Sn
_convertChemicalSymbol Validated.Sb = Sb
_convertChemicalSymbol Validated.Te = Te
_convertChemicalSymbol Validated.I  = I
_convertChemicalSymbol Validated.Xe = Xe
_convertChemicalSymbol Validated.Cs = Cs
_convertChemicalSymbol Validated.Ba = Ba
_convertChemicalSymbol Validated.Hf = Hf
_convertChemicalSymbol Validated.Ta = Ta
_convertChemicalSymbol Validated.W  = W
_convertChemicalSymbol Validated.Re = Re
_convertChemicalSymbol Validated.Os = Os
_convertChemicalSymbol Validated.Ir = Ir
_convertChemicalSymbol Validated.Pt = Pt
_convertChemicalSymbol Validated.Au = Au
_convertChemicalSymbol Validated.Hg = Hg
_convertChemicalSymbol Validated.Tl = Tl
_convertChemicalSymbol Validated.Pb = Pb
_convertChemicalSymbol Validated.Bi = Bi
_convertChemicalSymbol Validated.Po = Po
_convertChemicalSymbol Validated.At = At
_convertChemicalSymbol Validated.Rn = Rn
_convertChemicalSymbol Validated.Fr = Fr
_convertChemicalSymbol Validated.Ra = Ra
_convertChemicalSymbol Validated.Rf = Rf
_convertChemicalSymbol Validated.Db = Db
_convertChemicalSymbol Validated.Sg = Sg
_convertChemicalSymbol Validated.Bh = Bh
_convertChemicalSymbol Validated.Hs = Hs
_convertChemicalSymbol Validated.Mt = Mt
_convertChemicalSymbol Validated.La = La
_convertChemicalSymbol Validated.Ce = Ce
_convertChemicalSymbol Validated.Pr = Pr
_convertChemicalSymbol Validated.Nd = Nd
_convertChemicalSymbol Validated.Pm = Pm
_convertChemicalSymbol Validated.Sm = Sm
_convertChemicalSymbol Validated.Eu = Eu
_convertChemicalSymbol Validated.Gd = Gd
_convertChemicalSymbol Validated.Tb = Tb
_convertChemicalSymbol Validated.Dy = Dy
_convertChemicalSymbol Validated.Ho = Ho
_convertChemicalSymbol Validated.Er = Er
_convertChemicalSymbol Validated.Tm = Tm
_convertChemicalSymbol Validated.Yb = Yb
_convertChemicalSymbol Validated.Lu = Lu
_convertChemicalSymbol Validated.Ac = Ac
_convertChemicalSymbol Validated.Th = Th
_convertChemicalSymbol Validated.Pa = Pa
_convertChemicalSymbol Validated.U  = U
_convertChemicalSymbol Validated.Np = Np
_convertChemicalSymbol Validated.Pu = Pu
_convertChemicalSymbol Validated.Am = Am
_convertChemicalSymbol Validated.Cm = Cm
_convertChemicalSymbol Validated.Bk = Bk
_convertChemicalSymbol Validated.Cf = Cf
_convertChemicalSymbol Validated.Es = Es
_convertChemicalSymbol Validated.Fm = Fm
_convertChemicalSymbol Validated.Md = Md
_convertChemicalSymbol Validated.No = No
_convertChemicalSymbol Validated.Lr = Lr
