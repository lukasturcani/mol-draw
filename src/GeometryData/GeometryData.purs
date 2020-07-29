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
import ValidatedMolecule.ChemicalSymbol as VSymbol
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

_convertChemicalSymbol :: VSymbol.ChemicalSymbol -> ChemicalSymbol
_convertChemicalSymbol VSymbol.H  = H
_convertChemicalSymbol VSymbol.He = He
_convertChemicalSymbol VSymbol.Li = Li
_convertChemicalSymbol VSymbol.Be = Be
_convertChemicalSymbol VSymbol.B  = B
_convertChemicalSymbol VSymbol.C  = C
_convertChemicalSymbol VSymbol.N  = N
_convertChemicalSymbol VSymbol.O  = O
_convertChemicalSymbol VSymbol.F  = F
_convertChemicalSymbol VSymbol.Ne = Ne
_convertChemicalSymbol VSymbol.Na = Na
_convertChemicalSymbol VSymbol.Mg = Mg
_convertChemicalSymbol VSymbol.Al = Al
_convertChemicalSymbol VSymbol.Si = Si
_convertChemicalSymbol VSymbol.P  = P
_convertChemicalSymbol VSymbol.S  = S
_convertChemicalSymbol VSymbol.Cl = Cl
_convertChemicalSymbol VSymbol.Ar = Ar
_convertChemicalSymbol VSymbol.K  = K
_convertChemicalSymbol VSymbol.Ca = Ca
_convertChemicalSymbol VSymbol.Sc = Sc
_convertChemicalSymbol VSymbol.Ti = Ti
_convertChemicalSymbol VSymbol.V  = V
_convertChemicalSymbol VSymbol.Cr = Cr
_convertChemicalSymbol VSymbol.Mn = Mn
_convertChemicalSymbol VSymbol.Fe = Fe
_convertChemicalSymbol VSymbol.Co = Co
_convertChemicalSymbol VSymbol.Ni = Ni
_convertChemicalSymbol VSymbol.Cu = Cu
_convertChemicalSymbol VSymbol.Zn = Zn
_convertChemicalSymbol VSymbol.Ga = Ga
_convertChemicalSymbol VSymbol.Ge = Ge
_convertChemicalSymbol VSymbol.As = As
_convertChemicalSymbol VSymbol.Se = Se
_convertChemicalSymbol VSymbol.Br = Br
_convertChemicalSymbol VSymbol.Kr = Kr
_convertChemicalSymbol VSymbol.Rb = Rb
_convertChemicalSymbol VSymbol.Sr = Sr
_convertChemicalSymbol VSymbol.Y  = Y
_convertChemicalSymbol VSymbol.Zr = Zr
_convertChemicalSymbol VSymbol.Nb = Nb
_convertChemicalSymbol VSymbol.Mo = Mo
_convertChemicalSymbol VSymbol.Tc = Tc
_convertChemicalSymbol VSymbol.Ru = Ru
_convertChemicalSymbol VSymbol.Rh = Rh
_convertChemicalSymbol VSymbol.Pd = Pd
_convertChemicalSymbol VSymbol.Ag = Ag
_convertChemicalSymbol VSymbol.Cd = Cd
_convertChemicalSymbol VSymbol.In = In
_convertChemicalSymbol VSymbol.Sn = Sn
_convertChemicalSymbol VSymbol.Sb = Sb
_convertChemicalSymbol VSymbol.Te = Te
_convertChemicalSymbol VSymbol.I  = I
_convertChemicalSymbol VSymbol.Xe = Xe
_convertChemicalSymbol VSymbol.Cs = Cs
_convertChemicalSymbol VSymbol.Ba = Ba
_convertChemicalSymbol VSymbol.Hf = Hf
_convertChemicalSymbol VSymbol.Ta = Ta
_convertChemicalSymbol VSymbol.W  = W
_convertChemicalSymbol VSymbol.Re = Re
_convertChemicalSymbol VSymbol.Os = Os
_convertChemicalSymbol VSymbol.Ir = Ir
_convertChemicalSymbol VSymbol.Pt = Pt
_convertChemicalSymbol VSymbol.Au = Au
_convertChemicalSymbol VSymbol.Hg = Hg
_convertChemicalSymbol VSymbol.Tl = Tl
_convertChemicalSymbol VSymbol.Pb = Pb
_convertChemicalSymbol VSymbol.Bi = Bi
_convertChemicalSymbol VSymbol.Po = Po
_convertChemicalSymbol VSymbol.At = At
_convertChemicalSymbol VSymbol.Rn = Rn
_convertChemicalSymbol VSymbol.Fr = Fr
_convertChemicalSymbol VSymbol.Ra = Ra
_convertChemicalSymbol VSymbol.Rf = Rf
_convertChemicalSymbol VSymbol.Db = Db
_convertChemicalSymbol VSymbol.Sg = Sg
_convertChemicalSymbol VSymbol.Bh = Bh
_convertChemicalSymbol VSymbol.Hs = Hs
_convertChemicalSymbol VSymbol.Mt = Mt
_convertChemicalSymbol VSymbol.La = La
_convertChemicalSymbol VSymbol.Ce = Ce
_convertChemicalSymbol VSymbol.Pr = Pr
_convertChemicalSymbol VSymbol.Nd = Nd
_convertChemicalSymbol VSymbol.Pm = Pm
_convertChemicalSymbol VSymbol.Sm = Sm
_convertChemicalSymbol VSymbol.Eu = Eu
_convertChemicalSymbol VSymbol.Gd = Gd
_convertChemicalSymbol VSymbol.Tb = Tb
_convertChemicalSymbol VSymbol.Dy = Dy
_convertChemicalSymbol VSymbol.Ho = Ho
_convertChemicalSymbol VSymbol.Er = Er
_convertChemicalSymbol VSymbol.Tm = Tm
_convertChemicalSymbol VSymbol.Yb = Yb
_convertChemicalSymbol VSymbol.Lu = Lu
_convertChemicalSymbol VSymbol.Ac = Ac
_convertChemicalSymbol VSymbol.Th = Th
_convertChemicalSymbol VSymbol.Pa = Pa
_convertChemicalSymbol VSymbol.U  = U
_convertChemicalSymbol VSymbol.Np = Np
_convertChemicalSymbol VSymbol.Pu = Pu
_convertChemicalSymbol VSymbol.Am = Am
_convertChemicalSymbol VSymbol.Cm = Cm
_convertChemicalSymbol VSymbol.Bk = Bk
_convertChemicalSymbol VSymbol.Cf = Cf
_convertChemicalSymbol VSymbol.Es = Es
_convertChemicalSymbol VSymbol.Fm = Fm
_convertChemicalSymbol VSymbol.Md = Md
_convertChemicalSymbol VSymbol.No = No
_convertChemicalSymbol VSymbol.Lr = Lr
