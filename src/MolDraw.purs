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
import MolDraw.DrawMol (drawMol) as DrawMol
import MolDraw.DrawMol.Scene (SceneOptions) as DrawMol
import MolDraw.DrawMol.Mesh (MeshOptions) as DrawMol
import MolDraw.Atom as Atom
import MolDraw.Bond as Bond
import MolDraw.GeometryAtom as GeometryAtom
import MolDraw.Position as Position


maybeParseV3000
    :: String
    -> Either.Either String GeometryData.GeometryData
maybeParseV3000 = GeometryData.maybeParseV3000


maybeMolecule
    :: Array Atom.Atom
    -> Array Bond.Bond
    -> Either.Either String GeometryData.GeometryData
maybeMolecule = GeometryData.maybeMolecule


drawMol
    :: DrawMol.MeshOptions
    -> DrawMol.SceneOptions
    -> GeometryData.GeometryData
    -> Effect Prelude.Unit
drawMol = DrawMol.drawMol


id :: GeometryAtom.GeometryAtom -> Int
id = GeometryAtom.id


position :: Number -> Number -> Number -> Position.Position
position = Position.position


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


h  = ChemicalSymbol.H  :: ChemicalSymbol.ChemicalSymbol
he = ChemicalSymbol.He :: ChemicalSymbol.ChemicalSymbol
li = ChemicalSymbol.Li :: ChemicalSymbol.ChemicalSymbol
be = ChemicalSymbol.Be :: ChemicalSymbol.ChemicalSymbol
b  = ChemicalSymbol.B  :: ChemicalSymbol.ChemicalSymbol
c  = ChemicalSymbol.C  :: ChemicalSymbol.ChemicalSymbol
n  = ChemicalSymbol.N  :: ChemicalSymbol.ChemicalSymbol
o  = ChemicalSymbol.O  :: ChemicalSymbol.ChemicalSymbol
f  = ChemicalSymbol.F  :: ChemicalSymbol.ChemicalSymbol
ne = ChemicalSymbol.Ne :: ChemicalSymbol.ChemicalSymbol
na = ChemicalSymbol.Na :: ChemicalSymbol.ChemicalSymbol
mg = ChemicalSymbol.Mg :: ChemicalSymbol.ChemicalSymbol
al = ChemicalSymbol.Al :: ChemicalSymbol.ChemicalSymbol
si = ChemicalSymbol.Si :: ChemicalSymbol.ChemicalSymbol
p  = ChemicalSymbol.P  :: ChemicalSymbol.ChemicalSymbol
s  = ChemicalSymbol.S  :: ChemicalSymbol.ChemicalSymbol
cl = ChemicalSymbol.Cl :: ChemicalSymbol.ChemicalSymbol
ar = ChemicalSymbol.Ar :: ChemicalSymbol.ChemicalSymbol
k  = ChemicalSymbol.K  :: ChemicalSymbol.ChemicalSymbol
ca = ChemicalSymbol.Ca :: ChemicalSymbol.ChemicalSymbol
sc = ChemicalSymbol.Sc :: ChemicalSymbol.ChemicalSymbol
ti = ChemicalSymbol.Ti :: ChemicalSymbol.ChemicalSymbol
v  = ChemicalSymbol.V  :: ChemicalSymbol.ChemicalSymbol
cr = ChemicalSymbol.Cr :: ChemicalSymbol.ChemicalSymbol
mn = ChemicalSymbol.Mn :: ChemicalSymbol.ChemicalSymbol
fe = ChemicalSymbol.Fe :: ChemicalSymbol.ChemicalSymbol
co = ChemicalSymbol.Co :: ChemicalSymbol.ChemicalSymbol
ni = ChemicalSymbol.Ni :: ChemicalSymbol.ChemicalSymbol
cu = ChemicalSymbol.Cu :: ChemicalSymbol.ChemicalSymbol
zn = ChemicalSymbol.Zn :: ChemicalSymbol.ChemicalSymbol
ga = ChemicalSymbol.Ga :: ChemicalSymbol.ChemicalSymbol
ge = ChemicalSymbol.Ge :: ChemicalSymbol.ChemicalSymbol
as = ChemicalSymbol.As :: ChemicalSymbol.ChemicalSymbol
se = ChemicalSymbol.Se :: ChemicalSymbol.ChemicalSymbol
br = ChemicalSymbol.Br :: ChemicalSymbol.ChemicalSymbol
kr = ChemicalSymbol.Kr :: ChemicalSymbol.ChemicalSymbol
rb = ChemicalSymbol.Rb :: ChemicalSymbol.ChemicalSymbol
sr = ChemicalSymbol.Sr :: ChemicalSymbol.ChemicalSymbol
y  = ChemicalSymbol.Y  :: ChemicalSymbol.ChemicalSymbol
zr = ChemicalSymbol.Zr :: ChemicalSymbol.ChemicalSymbol
nb = ChemicalSymbol.Nb :: ChemicalSymbol.ChemicalSymbol
mo = ChemicalSymbol.Mo :: ChemicalSymbol.ChemicalSymbol
tc = ChemicalSymbol.Tc :: ChemicalSymbol.ChemicalSymbol
ru = ChemicalSymbol.Ru :: ChemicalSymbol.ChemicalSymbol
rh = ChemicalSymbol.Rh :: ChemicalSymbol.ChemicalSymbol
pd = ChemicalSymbol.Pd :: ChemicalSymbol.ChemicalSymbol
ag = ChemicalSymbol.Ag :: ChemicalSymbol.ChemicalSymbol
cd = ChemicalSymbol.Cd :: ChemicalSymbol.ChemicalSymbol
in_= ChemicalSymbol.In :: ChemicalSymbol.ChemicalSymbol
sn = ChemicalSymbol.Sn :: ChemicalSymbol.ChemicalSymbol
sb = ChemicalSymbol.Sb :: ChemicalSymbol.ChemicalSymbol
te = ChemicalSymbol.Te :: ChemicalSymbol.ChemicalSymbol
i  = ChemicalSymbol.I  :: ChemicalSymbol.ChemicalSymbol
xe = ChemicalSymbol.Xe :: ChemicalSymbol.ChemicalSymbol
cs = ChemicalSymbol.Cs :: ChemicalSymbol.ChemicalSymbol
ba = ChemicalSymbol.Ba :: ChemicalSymbol.ChemicalSymbol
hf = ChemicalSymbol.Hf :: ChemicalSymbol.ChemicalSymbol
ta = ChemicalSymbol.Ta :: ChemicalSymbol.ChemicalSymbol
w  = ChemicalSymbol.W  :: ChemicalSymbol.ChemicalSymbol
re = ChemicalSymbol.Re :: ChemicalSymbol.ChemicalSymbol
os = ChemicalSymbol.Os :: ChemicalSymbol.ChemicalSymbol
ir = ChemicalSymbol.Ir :: ChemicalSymbol.ChemicalSymbol
pt = ChemicalSymbol.Pt :: ChemicalSymbol.ChemicalSymbol
au = ChemicalSymbol.Au :: ChemicalSymbol.ChemicalSymbol
hg = ChemicalSymbol.Hg :: ChemicalSymbol.ChemicalSymbol
tl = ChemicalSymbol.Tl :: ChemicalSymbol.ChemicalSymbol
pb = ChemicalSymbol.Pb :: ChemicalSymbol.ChemicalSymbol
bi = ChemicalSymbol.Bi :: ChemicalSymbol.ChemicalSymbol
po = ChemicalSymbol.Po :: ChemicalSymbol.ChemicalSymbol
at = ChemicalSymbol.At :: ChemicalSymbol.ChemicalSymbol
rn = ChemicalSymbol.Rn :: ChemicalSymbol.ChemicalSymbol
fr = ChemicalSymbol.Fr :: ChemicalSymbol.ChemicalSymbol
ra = ChemicalSymbol.Ra :: ChemicalSymbol.ChemicalSymbol
rf = ChemicalSymbol.Rf :: ChemicalSymbol.ChemicalSymbol
db = ChemicalSymbol.Db :: ChemicalSymbol.ChemicalSymbol
sg = ChemicalSymbol.Sg :: ChemicalSymbol.ChemicalSymbol
bh = ChemicalSymbol.Bh :: ChemicalSymbol.ChemicalSymbol
hs = ChemicalSymbol.Hs :: ChemicalSymbol.ChemicalSymbol
mt = ChemicalSymbol.Mt :: ChemicalSymbol.ChemicalSymbol
la = ChemicalSymbol.La :: ChemicalSymbol.ChemicalSymbol
ce = ChemicalSymbol.Ce :: ChemicalSymbol.ChemicalSymbol
pr = ChemicalSymbol.Pr :: ChemicalSymbol.ChemicalSymbol
nd = ChemicalSymbol.Nd :: ChemicalSymbol.ChemicalSymbol
pm = ChemicalSymbol.Pm :: ChemicalSymbol.ChemicalSymbol
sm = ChemicalSymbol.Sm :: ChemicalSymbol.ChemicalSymbol
eu = ChemicalSymbol.Eu :: ChemicalSymbol.ChemicalSymbol
gd = ChemicalSymbol.Gd :: ChemicalSymbol.ChemicalSymbol
tb = ChemicalSymbol.Tb :: ChemicalSymbol.ChemicalSymbol
dy = ChemicalSymbol.Dy :: ChemicalSymbol.ChemicalSymbol
ho = ChemicalSymbol.Ho :: ChemicalSymbol.ChemicalSymbol
er = ChemicalSymbol.Er :: ChemicalSymbol.ChemicalSymbol
tm = ChemicalSymbol.Tm :: ChemicalSymbol.ChemicalSymbol
yb = ChemicalSymbol.Yb :: ChemicalSymbol.ChemicalSymbol
lu = ChemicalSymbol.Lu :: ChemicalSymbol.ChemicalSymbol
ac = ChemicalSymbol.Ac :: ChemicalSymbol.ChemicalSymbol
th = ChemicalSymbol.Th :: ChemicalSymbol.ChemicalSymbol
pa = ChemicalSymbol.Pa :: ChemicalSymbol.ChemicalSymbol
u  = ChemicalSymbol.U  :: ChemicalSymbol.ChemicalSymbol
np = ChemicalSymbol.Np :: ChemicalSymbol.ChemicalSymbol
pu = ChemicalSymbol.Pu :: ChemicalSymbol.ChemicalSymbol
am = ChemicalSymbol.Am :: ChemicalSymbol.ChemicalSymbol
cm = ChemicalSymbol.Cm :: ChemicalSymbol.ChemicalSymbol
bk = ChemicalSymbol.Bk :: ChemicalSymbol.ChemicalSymbol
cf = ChemicalSymbol.Cf :: ChemicalSymbol.ChemicalSymbol
es = ChemicalSymbol.Es :: ChemicalSymbol.ChemicalSymbol
fm = ChemicalSymbol.Fm :: ChemicalSymbol.ChemicalSymbol
md = ChemicalSymbol.Md :: ChemicalSymbol.ChemicalSymbol
no = ChemicalSymbol.No :: ChemicalSymbol.ChemicalSymbol
lr = ChemicalSymbol.Lr :: ChemicalSymbol.ChemicalSymbol


show :: ChemicalSymbol.ChemicalSymbol -> String
show ChemicalSymbol.H  = "H"
show ChemicalSymbol.He = "He"
show ChemicalSymbol.Li = "Li"
show ChemicalSymbol.Be = "Be"
show ChemicalSymbol.B  = "B"
show ChemicalSymbol.C  = "C"
show ChemicalSymbol.N  = "N"
show ChemicalSymbol.O  = "O"
show ChemicalSymbol.F  = "F"
show ChemicalSymbol.Ne = "Ne"
show ChemicalSymbol.Na = "Na"
show ChemicalSymbol.Mg = "Mg"
show ChemicalSymbol.Al = "Al"
show ChemicalSymbol.Si = "Si"
show ChemicalSymbol.P  = "P"
show ChemicalSymbol.S  = "S"
show ChemicalSymbol.Cl = "Cl"
show ChemicalSymbol.Ar = "Ar"
show ChemicalSymbol.K  = "K"
show ChemicalSymbol.Ca = "Ca"
show ChemicalSymbol.Sc = "Sc"
show ChemicalSymbol.Ti = "Ti"
show ChemicalSymbol.V  = "V"
show ChemicalSymbol.Cr = "Cr"
show ChemicalSymbol.Mn = "Mn"
show ChemicalSymbol.Fe = "Fe"
show ChemicalSymbol.Co = "Co"
show ChemicalSymbol.Ni = "Ni"
show ChemicalSymbol.Cu = "Cu"
show ChemicalSymbol.Zn = "Zn"
show ChemicalSymbol.Ga = "Ga"
show ChemicalSymbol.Ge = "Ge"
show ChemicalSymbol.As = "As"
show ChemicalSymbol.Se = "Se"
show ChemicalSymbol.Br = "Br"
show ChemicalSymbol.Kr = "Kr"
show ChemicalSymbol.Rb = "Rb"
show ChemicalSymbol.Sr = "Sr"
show ChemicalSymbol.Y  = "Y"
show ChemicalSymbol.Zr = "Zr"
show ChemicalSymbol.Nb = "Nb"
show ChemicalSymbol.Mo = "Mo"
show ChemicalSymbol.Tc = "Tc"
show ChemicalSymbol.Ru = "Ru"
show ChemicalSymbol.Rh = "Rh"
show ChemicalSymbol.Pd = "Pd"
show ChemicalSymbol.Ag = "Ag"
show ChemicalSymbol.Cd = "Cd"
show ChemicalSymbol.In = "In"
show ChemicalSymbol.Sn = "Sn"
show ChemicalSymbol.Sb = "Sb"
show ChemicalSymbol.Te = "Te"
show ChemicalSymbol.I  = "I"
show ChemicalSymbol.Xe = "Xe"
show ChemicalSymbol.Cs = "Cs"
show ChemicalSymbol.Ba = "Ba"
show ChemicalSymbol.Hf = "Hf"
show ChemicalSymbol.Ta = "Ta"
show ChemicalSymbol.W  = "W"
show ChemicalSymbol.Re = "Re"
show ChemicalSymbol.Os = "Os"
show ChemicalSymbol.Ir = "Ir"
show ChemicalSymbol.Pt = "Pt"
show ChemicalSymbol.Au = "Au"
show ChemicalSymbol.Hg = "Hg"
show ChemicalSymbol.Tl = "Tl"
show ChemicalSymbol.Pb = "Pb"
show ChemicalSymbol.Bi = "Bi"
show ChemicalSymbol.Po = "Po"
show ChemicalSymbol.At = "At"
show ChemicalSymbol.Rn = "Rn"
show ChemicalSymbol.Fr = "Fr"
show ChemicalSymbol.Ra = "Ra"
show ChemicalSymbol.Rf = "Rf"
show ChemicalSymbol.Db = "Db"
show ChemicalSymbol.Sg = "Sg"
show ChemicalSymbol.Bh = "Bh"
show ChemicalSymbol.Hs = "Hs"
show ChemicalSymbol.Mt = "Mt"
show ChemicalSymbol.La = "La"
show ChemicalSymbol.Ce = "Ce"
show ChemicalSymbol.Pr = "Pr"
show ChemicalSymbol.Nd = "Nd"
show ChemicalSymbol.Pm = "Pm"
show ChemicalSymbol.Sm = "Sm"
show ChemicalSymbol.Eu = "Eu"
show ChemicalSymbol.Gd = "Gd"
show ChemicalSymbol.Tb = "Tb"
show ChemicalSymbol.Dy = "Dy"
show ChemicalSymbol.Ho = "Ho"
show ChemicalSymbol.Er = "Er"
show ChemicalSymbol.Tm = "Tm"
show ChemicalSymbol.Yb = "Yb"
show ChemicalSymbol.Lu = "Lu"
show ChemicalSymbol.Ac = "Ac"
show ChemicalSymbol.Th = "Th"
show ChemicalSymbol.Pa = "Pa"
show ChemicalSymbol.U  = "U"
show ChemicalSymbol.Np = "Np"
show ChemicalSymbol.Pu = "Pu"
show ChemicalSymbol.Am = "Am"
show ChemicalSymbol.Cm = "Cm"
show ChemicalSymbol.Bk = "Bk"
show ChemicalSymbol.Cf = "Cf"
show ChemicalSymbol.Es = "Es"
show ChemicalSymbol.Fm = "Fm"
show ChemicalSymbol.Md = "Md"
show ChemicalSymbol.No = "No"
show ChemicalSymbol.Lr = "Lr"
