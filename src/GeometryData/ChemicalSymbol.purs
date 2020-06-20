module MolDraw.GeometryData.ChemicalSymbol
( ChemicalSymbol (..)
) where


import Prelude
import Data.Maybe (Maybe (..))


data ChemicalSymbol
    = H
    | He
    | Li
    | Be
    | B
    | C
    | N
    | O
    | F
    | Ne
    | Na
    | Mg
    | Al
    | Si
    | P
    | S
    | Cl
    | Ar
    | K
    | Ca
    | Sc
    | Ti
    | V
    | Cr
    | Mn
    | Fe
    | Co
    | Ni
    | Cu
    | Zn
    | Ga
    | Ge
    | As
    | Se
    | Br
    | Kr
    | Rb
    | Sr
    | Y
    | Zr
    | Nb
    | Mo
    | Tc
    | Ru
    | Rh
    | Pd
    | Ag
    | Cd
    | In
    | Sn
    | Sb
    | Te
    | I
    | Xe
    | Cs
    | Ba
    | Hf
    | Ta
    | W
    | Re
    | Os
    | Ir
    | Pt
    | Au
    | Hg
    | Tl
    | Pb
    | Bi
    | Po
    | At
    | Rn
    | Fr
    | Ra
    | Rf
    | Db
    | Sg
    | Bh
    | Hs
    | Mt
    | La
    | Ce
    | Pr
    | Nd
    | Pm
    | Sm
    | Eu
    | Gd
    | Tb
    | Dy
    | Ho
    | Er
    | Tm
    | Yb
    | Lu
    | Ac
    | Th
    | Pa
    | U
    | Np
    | Pu
    | Am
    | Cm
    | Bk
    | Cf
    | Es
    | Fm
    | Md
    | No
    | Lr



chemicalSymbol :: String -> Maybe ChemicalSymbol
chemicalSymbol "H"  = Just H
chemicalSymbol "He" = Just He
chemicalSymbol "Li" = Just Li
chemicalSymbol "Be" = Just Be
chemicalSymbol "B"  = Just B
chemicalSymbol "C"  = Just C
chemicalSymbol "N"  = Just N
chemicalSymbol "O"  = Just O
chemicalSymbol "F"  = Just F
chemicalSymbol "Ne" = Just Ne
chemicalSymbol "Na" = Just Na
chemicalSymbol "Mg" = Just Mg
chemicalSymbol "Al" = Just Al
chemicalSymbol "Si" = Just Si
chemicalSymbol "P"  = Just P
chemicalSymbol "S"  = Just S
chemicalSymbol "Cl" = Just Cl
chemicalSymbol "Ar" = Just Ar
chemicalSymbol "K"  = Just K
chemicalSymbol "Ca" = Just Ca
chemicalSymbol "Sc" = Just Sc
chemicalSymbol "Ti" = Just Ti
chemicalSymbol "V"  = Just V
chemicalSymbol "Cr" = Just Cr
chemicalSymbol "Mn" = Just Mn
chemicalSymbol "Fe" = Just Fe
chemicalSymbol "Co" = Just Co
chemicalSymbol "Ni" = Just Ni
chemicalSymbol "Cu" = Just Cu
chemicalSymbol "Zn" = Just Zn
chemicalSymbol "Ga" = Just Ga
chemicalSymbol "Ge" = Just Ge
chemicalSymbol "As" = Just As
chemicalSymbol "Se" = Just Se
chemicalSymbol "Br" = Just Br
chemicalSymbol "Kr" = Just Kr
chemicalSymbol "Rb" = Just Rb
chemicalSymbol "Sr" = Just Sr
chemicalSymbol "Y"  = Just Y
chemicalSymbol "Zr" = Just Zr
chemicalSymbol "Nb" = Just Nb
chemicalSymbol "Mo" = Just Mo
chemicalSymbol "Tc" = Just Tc
chemicalSymbol "Ru" = Just Ru
chemicalSymbol "Rh" = Just Rh
chemicalSymbol "Pd" = Just Pd
chemicalSymbol "Ag" = Just Ag
chemicalSymbol "Cd" = Just Cd
chemicalSymbol "In" = Just In
chemicalSymbol "Sn" = Just Sn
chemicalSymbol "Sb" = Just Sb
chemicalSymbol "Te" = Just Te
chemicalSymbol "I"  = Just I
chemicalSymbol "Xe" = Just Xe
chemicalSymbol "Cs" = Just Cs
chemicalSymbol "Ba" = Just Ba
chemicalSymbol "Hf" = Just Hf
chemicalSymbol "Ta" = Just Ta
chemicalSymbol "W"  = Just W
chemicalSymbol "Re" = Just Re
chemicalSymbol "Os" = Just Os
chemicalSymbol "Ir" = Just Ir
chemicalSymbol "Pt" = Just Pt
chemicalSymbol "Au" = Just Au
chemicalSymbol "Hg" = Just Hg
chemicalSymbol "Tl" = Just Tl
chemicalSymbol "Pb" = Just Pb
chemicalSymbol "Bi" = Just Bi
chemicalSymbol "Po" = Just Po
chemicalSymbol "At" = Just At
chemicalSymbol "Rn" = Just Rn
chemicalSymbol "Fr" = Just Fr
chemicalSymbol "Ra" = Just Ra
chemicalSymbol "Rf" = Just Rf
chemicalSymbol "Db" = Just Db
chemicalSymbol "Sg" = Just Sg
chemicalSymbol "Bh" = Just Bh
chemicalSymbol "Hs" = Just Hs
chemicalSymbol "Mt" = Just Mt
chemicalSymbol "La" = Just La
chemicalSymbol "Ce" = Just Ce
chemicalSymbol "Pr" = Just Pr
chemicalSymbol "Nd" = Just Nd
chemicalSymbol "Pm" = Just Pm
chemicalSymbol "Sm" = Just Sm
chemicalSymbol "Eu" = Just Eu
chemicalSymbol "Gd" = Just Gd
chemicalSymbol "Tb" = Just Tb
chemicalSymbol "Dy" = Just Dy
chemicalSymbol "Ho" = Just Ho
chemicalSymbol "Er" = Just Er
chemicalSymbol "Tm" = Just Tm
chemicalSymbol "Yb" = Just Yb
chemicalSymbol "Lu" = Just Lu
chemicalSymbol "Ac" = Just Ac
chemicalSymbol "Th" = Just Th
chemicalSymbol "Pa" = Just Pa
chemicalSymbol "U"  = Just U
chemicalSymbol "Np" = Just Np
chemicalSymbol "Pu" = Just Pu
chemicalSymbol "Am" = Just Am
chemicalSymbol "Cm" = Just Cm
chemicalSymbol "Bk" = Just Bk
chemicalSymbol "Cf" = Just Cf
chemicalSymbol "Es" = Just Es
chemicalSymbol "Fm" = Just Fm
chemicalSymbol "Md" = Just Md
chemicalSymbol "No" = Just No
chemicalSymbol "Lr" = Just Lr
chemicalSymbol _    = Nothing


instance showChemicalSymbol :: Show ChemicalSymbol where
    show H  = "H"
    show He = "He"
    show Li = "Li"
    show Be = "Be"
    show B  = "B"
    show C  = "C"
    show N  = "N"
    show O  = "O"
    show F  = "F"
    show Ne = "Ne"
    show Na = "Na"
    show Mg = "Mg"
    show Al = "Al"
    show Si = "Si"
    show P  = "P"
    show S  = "S"
    show Cl = "Cl"
    show Ar = "Ar"
    show K  = "K"
    show Ca = "Ca"
    show Sc = "Sc"
    show Ti = "Ti"
    show V  = "V"
    show Cr = "Cr"
    show Mn = "Mn"
    show Fe = "Fe"
    show Co = "Co"
    show Ni = "Ni"
    show Cu = "Cu"
    show Zn = "Zn"
    show Ga = "Ga"
    show Ge = "Ge"
    show As = "As"
    show Se = "Se"
    show Br = "Br"
    show Kr = "Kr"
    show Rb = "Rb"
    show Sr = "Sr"
    show Y  = "Y"
    show Zr = "Zr"
    show Nb = "Nb"
    show Mo = "Mo"
    show Tc = "Tc"
    show Ru = "Ru"
    show Rh = "Rh"
    show Pd = "Pd"
    show Ag = "Ag"
    show Cd = "Cd"
    show In = "In"
    show Sn = "Sn"
    show Sb = "Sb"
    show Te = "Te"
    show I  = "I"
    show Xe = "Xe"
    show Cs = "Cs"
    show Ba = "Ba"
    show Hf = "Hf"
    show Ta = "Ta"
    show W  = "W"
    show Re = "Re"
    show Os = "Os"
    show Ir = "Ir"
    show Pt = "Pt"
    show Au = "Au"
    show Hg = "Hg"
    show Tl = "Tl"
    show Pb = "Pb"
    show Bi = "Bi"
    show Po = "Po"
    show At = "At"
    show Rn = "Rn"
    show Fr = "Fr"
    show Ra = "Ra"
    show Rf = "Rf"
    show Db = "Db"
    show Sg = "Sg"
    show Bh = "Bh"
    show Hs = "Hs"
    show Mt = "Mt"
    show La = "La"
    show Ce = "Ce"
    show Pr = "Pr"
    show Nd = "Nd"
    show Pm = "Pm"
    show Sm = "Sm"
    show Eu = "Eu"
    show Gd = "Gd"
    show Tb = "Tb"
    show Dy = "Dy"
    show Ho = "Ho"
    show Er = "Er"
    show Tm = "Tm"
    show Yb = "Yb"
    show Lu = "Lu"
    show Ac = "Ac"
    show Th = "Th"
    show Pa = "Pa"
    show U  = "U"
    show Np = "Np"
    show Pu = "Pu"
    show Am = "Am"
    show Cm = "Cm"
    show Bk = "Bk"
    show Cf = "Cf"
    show Es = "Es"
    show Fm = "Fm"
    show Md = "Md"
    show No = "No"
    show Lr = "Lr"
