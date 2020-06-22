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


drawMol
    :: DrawMol.SceneOptions
    -> GeometryData.GeometryData
    -> Effect Prelude.Unit
drawMol = DrawMol.drawMol


drawMolWithOptions
    :: DrawMol.MeshOptions
    -> DrawMol.SceneOptions
    -> GeometryData.GeometryData
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
