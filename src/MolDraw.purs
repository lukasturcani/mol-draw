module MolDraw
( module MolDraw
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


h  = ChemicalSymbol.H
he = ChemicalSymbol.He
li = ChemicalSymbol.Li
be = ChemicalSymbol.Be
b  = ChemicalSymbol.B
c  = ChemicalSymbol.C
n  = ChemicalSymbol.N
o  = ChemicalSymbol.O
f  = ChemicalSymbol.F
ne = ChemicalSymbol.Ne
na = ChemicalSymbol.Na
mg = ChemicalSymbol.Mg
al = ChemicalSymbol.Al
si = ChemicalSymbol.Si
p  = ChemicalSymbol.P
s  = ChemicalSymbol.S
cl = ChemicalSymbol.Cl
ar = ChemicalSymbol.Ar
k  = ChemicalSymbol.K
ca = ChemicalSymbol.Ca
sc = ChemicalSymbol.Sc
ti = ChemicalSymbol.Ti
v  = ChemicalSymbol.V
cr = ChemicalSymbol.Cr
mn = ChemicalSymbol.Mn
fe = ChemicalSymbol.Fe
co = ChemicalSymbol.Co
ni = ChemicalSymbol.Ni
cu = ChemicalSymbol.Cu
zn = ChemicalSymbol.Zn
ga = ChemicalSymbol.Ga
ge = ChemicalSymbol.Ge
as = ChemicalSymbol.As
se = ChemicalSymbol.Se
br = ChemicalSymbol.Br
kr = ChemicalSymbol.Kr
rb = ChemicalSymbol.Rb
sr = ChemicalSymbol.Sr
y  = ChemicalSymbol.Y
zr = ChemicalSymbol.Zr
nb = ChemicalSymbol.Nb
mo = ChemicalSymbol.Mo
tc = ChemicalSymbol.Tc
ru = ChemicalSymbol.Ru
rh = ChemicalSymbol.Rh
pd = ChemicalSymbol.Pd
ag = ChemicalSymbol.Ag
cd = ChemicalSymbol.Cd
in_= ChemicalSymbol.In
sn = ChemicalSymbol.Sn
sb = ChemicalSymbol.Sb
te = ChemicalSymbol.Te
i  = ChemicalSymbol.I
xe = ChemicalSymbol.Xe
cs = ChemicalSymbol.Cs
ba = ChemicalSymbol.Ba
hf = ChemicalSymbol.Hf
ta = ChemicalSymbol.Ta
w  = ChemicalSymbol.W
re = ChemicalSymbol.Re
os = ChemicalSymbol.Os
ir = ChemicalSymbol.Ir
pt = ChemicalSymbol.Pt
au = ChemicalSymbol.Au
hg = ChemicalSymbol.Hg
tl = ChemicalSymbol.Tl
pb = ChemicalSymbol.Pb
bi = ChemicalSymbol.Bi
po = ChemicalSymbol.Po
at = ChemicalSymbol.At
rn = ChemicalSymbol.Rn
fr = ChemicalSymbol.Fr
ra = ChemicalSymbol.Ra
rf = ChemicalSymbol.Rf
db = ChemicalSymbol.Db
sg = ChemicalSymbol.Sg
bh = ChemicalSymbol.Bh
hs = ChemicalSymbol.Hs
mt = ChemicalSymbol.Mt
la = ChemicalSymbol.La
ce = ChemicalSymbol.Ce
pr = ChemicalSymbol.Pr
nd = ChemicalSymbol.Nd
pm = ChemicalSymbol.Pm
sm = ChemicalSymbol.Sm
eu = ChemicalSymbol.Eu
gd = ChemicalSymbol.Gd
tb = ChemicalSymbol.Tb
dy = ChemicalSymbol.Dy
ho = ChemicalSymbol.Ho
er = ChemicalSymbol.Er
tm = ChemicalSymbol.Tm
yb = ChemicalSymbol.Yb
lu = ChemicalSymbol.Lu
ac = ChemicalSymbol.Ac
th = ChemicalSymbol.Th
pa = ChemicalSymbol.Pa
u  = ChemicalSymbol.U
np = ChemicalSymbol.Np
pu = ChemicalSymbol.Pu
am = ChemicalSymbol.Am
cm = ChemicalSymbol.Cm
bk = ChemicalSymbol.Bk
cf = ChemicalSymbol.Cf
es = ChemicalSymbol.Es
fm = ChemicalSymbol.Fm
md = ChemicalSymbol.Md
no = ChemicalSymbol.No
lr = ChemicalSymbol.Lr
