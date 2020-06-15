module MolDraw.Atom
( Atom
, ChemicalSymbol (..)
, size
, position
, stringToChemicalSymbol
, atomToChemicalSymbol
, atom
) where

import MolDraw.Position (Position)
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



stringToChemicalSymbol :: String -> Maybe ChemicalSymbol
stringToChemicalSymbol "H"  = Just H
stringToChemicalSymbol "He" = Just He
stringToChemicalSymbol "Li" = Just Li
stringToChemicalSymbol "Be" = Just Be
stringToChemicalSymbol "B"  = Just B
stringToChemicalSymbol "C"  = Just C
stringToChemicalSymbol "N"  = Just N
stringToChemicalSymbol "O"  = Just O
stringToChemicalSymbol "F"  = Just F
stringToChemicalSymbol "Ne" = Just Ne
stringToChemicalSymbol "Na" = Just Na
stringToChemicalSymbol "Mg" = Just Mg
stringToChemicalSymbol "Al" = Just Al
stringToChemicalSymbol "Si" = Just Si
stringToChemicalSymbol "P"  = Just P
stringToChemicalSymbol "S"  = Just S
stringToChemicalSymbol "Cl" = Just Cl
stringToChemicalSymbol "Ar" = Just Ar
stringToChemicalSymbol "K"  = Just K
stringToChemicalSymbol "Ca" = Just Ca
stringToChemicalSymbol "Sc" = Just Sc
stringToChemicalSymbol "Ti" = Just Ti
stringToChemicalSymbol "V"  = Just V
stringToChemicalSymbol "Cr" = Just Cr
stringToChemicalSymbol "Mn" = Just Mn
stringToChemicalSymbol "Fe" = Just Fe
stringToChemicalSymbol "Co" = Just Co
stringToChemicalSymbol "Ni" = Just Ni
stringToChemicalSymbol "Cu" = Just Cu
stringToChemicalSymbol "Zn" = Just Zn
stringToChemicalSymbol "Ga" = Just Ga
stringToChemicalSymbol "Ge" = Just Ge
stringToChemicalSymbol "As" = Just As
stringToChemicalSymbol "Se" = Just Se
stringToChemicalSymbol "Br" = Just Br
stringToChemicalSymbol "Kr" = Just Kr
stringToChemicalSymbol "Rb" = Just Rb
stringToChemicalSymbol "Sr" = Just Sr
stringToChemicalSymbol "Y"  = Just Y
stringToChemicalSymbol "Zr" = Just Zr
stringToChemicalSymbol "Nb" = Just Nb
stringToChemicalSymbol "Mo" = Just Mo
stringToChemicalSymbol "Tc" = Just Tc
stringToChemicalSymbol "Ru" = Just Ru
stringToChemicalSymbol "Rh" = Just Rh
stringToChemicalSymbol "Pd" = Just Pd
stringToChemicalSymbol "Ag" = Just Ag
stringToChemicalSymbol "Cd" = Just Cd
stringToChemicalSymbol "In" = Just In
stringToChemicalSymbol "Sn" = Just Sn
stringToChemicalSymbol "Sb" = Just Sb
stringToChemicalSymbol "Te" = Just Te
stringToChemicalSymbol "I"  = Just I
stringToChemicalSymbol "Xe" = Just Xe
stringToChemicalSymbol "Cs" = Just Cs
stringToChemicalSymbol "Ba" = Just Ba
stringToChemicalSymbol "Hf" = Just Hf
stringToChemicalSymbol "Ta" = Just Ta
stringToChemicalSymbol "W"  = Just W
stringToChemicalSymbol "Re" = Just Re
stringToChemicalSymbol "Os" = Just Os
stringToChemicalSymbol "Ir" = Just Ir
stringToChemicalSymbol "Pt" = Just Pt
stringToChemicalSymbol "Au" = Just Au
stringToChemicalSymbol "Hg" = Just Hg
stringToChemicalSymbol "Tl" = Just Tl
stringToChemicalSymbol "Pb" = Just Pb
stringToChemicalSymbol "Bi" = Just Bi
stringToChemicalSymbol "Po" = Just Po
stringToChemicalSymbol "At" = Just At
stringToChemicalSymbol "Rn" = Just Rn
stringToChemicalSymbol "Fr" = Just Fr
stringToChemicalSymbol "Ra" = Just Ra
stringToChemicalSymbol "Rf" = Just Rf
stringToChemicalSymbol "Db" = Just Db
stringToChemicalSymbol "Sg" = Just Sg
stringToChemicalSymbol "Bh" = Just Bh
stringToChemicalSymbol "Hs" = Just Hs
stringToChemicalSymbol "Mt" = Just Mt
stringToChemicalSymbol "La" = Just La
stringToChemicalSymbol "Ce" = Just Ce
stringToChemicalSymbol "Pr" = Just Pr
stringToChemicalSymbol "Nd" = Just Nd
stringToChemicalSymbol "Pm" = Just Pm
stringToChemicalSymbol "Sm" = Just Sm
stringToChemicalSymbol "Eu" = Just Eu
stringToChemicalSymbol "Gd" = Just Gd
stringToChemicalSymbol "Tb" = Just Tb
stringToChemicalSymbol "Dy" = Just Dy
stringToChemicalSymbol "Ho" = Just Ho
stringToChemicalSymbol "Er" = Just Er
stringToChemicalSymbol "Tm" = Just Tm
stringToChemicalSymbol "Yb" = Just Yb
stringToChemicalSymbol "Lu" = Just Lu
stringToChemicalSymbol "Ac" = Just Ac
stringToChemicalSymbol "Th" = Just Th
stringToChemicalSymbol "Pa" = Just Pa
stringToChemicalSymbol "U"  = Just U
stringToChemicalSymbol "Np" = Just Np
stringToChemicalSymbol "Pu" = Just Pu
stringToChemicalSymbol "Am" = Just Am
stringToChemicalSymbol "Cm" = Just Cm
stringToChemicalSymbol "Bk" = Just Bk
stringToChemicalSymbol "Cf" = Just Cf
stringToChemicalSymbol "Es" = Just Es
stringToChemicalSymbol "Fm" = Just Fm
stringToChemicalSymbol "Md" = Just Md
stringToChemicalSymbol "No" = Just No
stringToChemicalSymbol "Lr" = Just Lr
stringToChemicalSymbol _    = Nothing



data Atom
    = H_  { position :: Position }
    | He_ { position :: Position }
    | Li_ { position :: Position }
    | Be_ { position :: Position }
    | B_  { position :: Position }
    | C_  { position :: Position }
    | N_  { position :: Position }
    | O_  { position :: Position }
    | F_  { position :: Position }
    | Ne_ { position :: Position }
    | Na_ { position :: Position }
    | Mg_ { position :: Position }
    | Al_ { position :: Position }
    | Si_ { position :: Position }
    | P_  { position :: Position }
    | S_  { position :: Position }
    | Cl_ { position :: Position }
    | Ar_ { position :: Position }
    | K_  { position :: Position }
    | Ca_ { position :: Position }
    | Sc_ { position :: Position }
    | Ti_ { position :: Position }
    | V_  { position :: Position }
    | Cr_ { position :: Position }
    | Mn_ { position :: Position }
    | Fe_ { position :: Position }
    | Co_ { position :: Position }
    | Ni_ { position :: Position }
    | Cu_ { position :: Position }
    | Zn_ { position :: Position }
    | Ga_ { position :: Position }
    | Ge_ { position :: Position }
    | As_ { position :: Position }
    | Se_ { position :: Position }
    | Br_ { position :: Position }
    | Kr_ { position :: Position }
    | Rb_ { position :: Position }
    | Sr_ { position :: Position }
    | Y_  { position :: Position }
    | Zr_ { position :: Position }
    | Nb_ { position :: Position }
    | Mo_ { position :: Position }
    | Tc_ { position :: Position }
    | Ru_ { position :: Position }
    | Rh_ { position :: Position }
    | Pd_ { position :: Position }
    | Ag_ { position :: Position }
    | Cd_ { position :: Position }
    | In_ { position :: Position }
    | Sn_ { position :: Position }
    | Sb_ { position :: Position }
    | Te_ { position :: Position }
    | I_  { position :: Position }
    | Xe_ { position :: Position }
    | Cs_ { position :: Position }
    | Ba_ { position :: Position }
    | Hf_ { position :: Position }
    | Ta_ { position :: Position }
    | W_  { position :: Position }
    | Re_ { position :: Position }
    | Os_ { position :: Position }
    | Ir_ { position :: Position }
    | Pt_ { position :: Position }
    | Au_ { position :: Position }
    | Hg_ { position :: Position }
    | Tl_ { position :: Position }
    | Pb_ { position :: Position }
    | Bi_ { position :: Position }
    | Po_ { position :: Position }
    | At_ { position :: Position }
    | Rn_ { position :: Position }
    | Fr_ { position :: Position }
    | Ra_ { position :: Position }
    | Rf_ { position :: Position }
    | Db_ { position :: Position }
    | Sg_ { position :: Position }
    | Bh_ { position :: Position }
    | Hs_ { position :: Position }
    | Mt_ { position :: Position }
    | La_ { position :: Position }
    | Ce_ { position :: Position }
    | Pr_ { position :: Position }
    | Nd_ { position :: Position }
    | Pm_ { position :: Position }
    | Sm_ { position :: Position }
    | Eu_ { position :: Position }
    | Gd_ { position :: Position }
    | Tb_ { position :: Position }
    | Dy_ { position :: Position }
    | Ho_ { position :: Position }
    | Er_ { position :: Position }
    | Tm_ { position :: Position }
    | Yb_ { position :: Position }
    | Lu_ { position :: Position }
    | Ac_ { position :: Position }
    | Th_ { position :: Position }
    | Pa_ { position :: Position }
    | U_  { position :: Position }
    | Np_ { position :: Position }
    | Pu_ { position :: Position }
    | Am_ { position :: Position }
    | Cm_ { position :: Position }
    | Bk_ { position :: Position }
    | Cf_ { position :: Position }
    | Es_ { position :: Position }
    | Fm_ { position :: Position }
    | Md_ { position :: Position }
    | No_ { position :: Position }
    | Lr_ { position :: Position }



size :: Atom -> Number
size (H_  {}) = 0.53
size (He_ {}) = 0.31
size (Li_ {}) = 1.67
size (Be_ {}) = 1.12
size (B_  {}) = 0.87
size (C_  {}) = 0.67
size (N_  {}) = 0.56
size (O_  {}) = 0.48
size (F_  {}) = 0.42
size (Ne_ {}) = 0.38
size (Na_ {}) = 1.90
size (Mg_ {}) = 1.45
size (Al_ {}) = 1.18
size (Si_ {}) = 1.11
size (P_  {}) = 0.98
size (S_  {}) = 0.88
size (Cl_ {}) = 0.79
size (Ar_ {}) = 0.71
size (K_  {}) = 2.43
size (Ca_ {}) = 1.94
size (Sc_ {}) = 1.84
size (Ti_ {}) = 1.76
size (V_  {}) = 1.71
size (Cr_ {}) = 1.66
size (Mn_ {}) = 1.61
size (Fe_ {}) = 1.56
size (Co_ {}) = 1.52
size (Ni_ {}) = 1.49
size (Cu_ {}) = 1.45
size (Zn_ {}) = 1.42
size (Ga_ {}) = 1.36
size (Ge_ {}) = 1.25
size (As_ {}) = 1.14
size (Se_ {}) = 1.03
size (Br_ {}) = 0.94
size (Kr_ {}) = 0.88
size (Rb_ {}) = 2.65
size (Sr_ {}) = 2.19
size (Y_  {}) = 2.12
size (Zr_ {}) = 2.06
size (Nb_ {}) = 1.98
size (Mo_ {}) = 1.90
size (Tc_ {}) = 1.83
size (Ru_ {}) = 1.78
size (Rh_ {}) = 1.73
size (Pd_ {}) = 1.69
size (Ag_ {}) = 1.65
size (Cd_ {}) = 1.61
size (In_ {}) = 1.56
size (Sn_ {}) = 1.45
size (Sb_ {}) = 1.33
size (Te_ {}) = 1.23
size (I_  {}) = 1.15
size (Xe_ {}) = 1.08
size (Cs_ {}) = 2.98
size (Ba_ {}) = 2.53
size (La_ {}) = 1.95
size (Ce_ {}) = 1.85
size (Pr_ {}) = 2.47
size (Nd_ {}) = 2.06
size (Pm_ {}) = 2.05
size (Sm_ {}) = 2.38
size (Eu_ {}) = 2.31
size (Gd_ {}) = 2.33
size (Tb_ {}) = 2.25
size (Dy_ {}) = 2.28
size (Ho_ {}) = 2.26
size (Er_ {}) = 2.26
size (Tm_ {}) = 2.22
size (Yb_ {}) = 2.22
size (Lu_ {}) = 2.17
size (Hf_ {}) = 2.08
size (Ta_ {}) = 2.00
size (W_  {}) = 1.93
size (Re_ {}) = 1.88
size (Os_ {}) = 1.85
size (Ir_ {}) = 1.80
size (Pt_ {}) = 1.77
size (Au_ {}) = 1.74
size (Hg_ {}) = 1.71
size (Tl_ {}) = 1.56
size (Pb_ {}) = 1.54
size (Bi_ {}) = 1.43
size (Po_ {}) = 1.35
size (At_ {}) = 1.27
size (Rn_ {}) = 1.20
size (Ac_ {}) = 1.95
size (Th_ {}) = 1.80
size (Pa_ {}) = 1.80
size (U_  {}) = 1.75
size (Np_ {}) = 1.75
size (Pu_ {}) = 1.75
size (Am_ {}) = 1.75
size _     = 2.0



position :: Atom -> Position
position (H_  { position: pos }) = pos
position (He_ { position: pos }) = pos
position (Li_ { position: pos }) = pos
position (Be_ { position: pos }) = pos
position (B_  { position: pos }) = pos
position (C_  { position: pos }) = pos
position (N_  { position: pos }) = pos
position (O_  { position: pos }) = pos
position (F_  { position: pos }) = pos
position (Ne_ { position: pos }) = pos
position (Na_ { position: pos }) = pos
position (Mg_ { position: pos }) = pos
position (Al_ { position: pos }) = pos
position (Si_ { position: pos }) = pos
position (P_  { position: pos }) = pos
position (S_  { position: pos }) = pos
position (Cl_ { position: pos }) = pos
position (Ar_ { position: pos }) = pos
position (K_  { position: pos }) = pos
position (Ca_ { position: pos }) = pos
position (Sc_ { position: pos }) = pos
position (Ti_ { position: pos }) = pos
position (V_  { position: pos }) = pos
position (Cr_ { position: pos }) = pos
position (Mn_ { position: pos }) = pos
position (Fe_ { position: pos }) = pos
position (Co_ { position: pos }) = pos
position (Ni_ { position: pos }) = pos
position (Cu_ { position: pos }) = pos
position (Zn_ { position: pos }) = pos
position (Ga_ { position: pos }) = pos
position (Ge_ { position: pos }) = pos
position (As_ { position: pos }) = pos
position (Se_ { position: pos }) = pos
position (Br_ { position: pos }) = pos
position (Kr_ { position: pos }) = pos
position (Rb_ { position: pos }) = pos
position (Sr_ { position: pos }) = pos
position (Y_  { position: pos }) = pos
position (Zr_ { position: pos }) = pos
position (Nb_ { position: pos }) = pos
position (Mo_ { position: pos }) = pos
position (Tc_ { position: pos }) = pos
position (Ru_ { position: pos }) = pos
position (Rh_ { position: pos }) = pos
position (Pd_ { position: pos }) = pos
position (Ag_ { position: pos }) = pos
position (Cd_ { position: pos }) = pos
position (In_ { position: pos }) = pos
position (Sn_ { position: pos }) = pos
position (Sb_ { position: pos }) = pos
position (Te_ { position: pos }) = pos
position (I_  { position: pos }) = pos
position (Xe_ { position: pos }) = pos
position (Cs_ { position: pos }) = pos
position (Ba_ { position: pos }) = pos
position (Hf_ { position: pos }) = pos
position (Ta_ { position: pos }) = pos
position (W_  { position: pos }) = pos
position (Re_ { position: pos }) = pos
position (Os_ { position: pos }) = pos
position (Ir_ { position: pos }) = pos
position (Pt_ { position: pos }) = pos
position (Au_ { position: pos }) = pos
position (Hg_ { position: pos }) = pos
position (Tl_ { position: pos }) = pos
position (Pb_ { position: pos }) = pos
position (Bi_ { position: pos }) = pos
position (Po_ { position: pos }) = pos
position (At_ { position: pos }) = pos
position (Rn_ { position: pos }) = pos
position (Fr_ { position: pos }) = pos
position (Ra_ { position: pos }) = pos
position (Rf_ { position: pos }) = pos
position (Db_ { position: pos }) = pos
position (Sg_ { position: pos }) = pos
position (Bh_ { position: pos }) = pos
position (Hs_ { position: pos }) = pos
position (Mt_ { position: pos }) = pos
position (La_ { position: pos }) = pos
position (Ce_ { position: pos }) = pos
position (Pr_ { position: pos }) = pos
position (Nd_ { position: pos }) = pos
position (Pm_ { position: pos }) = pos
position (Sm_ { position: pos }) = pos
position (Eu_ { position: pos }) = pos
position (Gd_ { position: pos }) = pos
position (Tb_ { position: pos }) = pos
position (Dy_ { position: pos }) = pos
position (Ho_ { position: pos }) = pos
position (Er_ { position: pos }) = pos
position (Tm_ { position: pos }) = pos
position (Yb_ { position: pos }) = pos
position (Lu_ { position: pos }) = pos
position (Ac_ { position: pos }) = pos
position (Th_ { position: pos }) = pos
position (Pa_ { position: pos }) = pos
position (U_  { position: pos }) = pos
position (Np_ { position: pos }) = pos
position (Pu_ { position: pos }) = pos
position (Am_ { position: pos }) = pos
position (Cm_ { position: pos }) = pos
position (Bk_ { position: pos }) = pos
position (Cf_ { position: pos }) = pos
position (Es_ { position: pos }) = pos
position (Fm_ { position: pos }) = pos
position (Md_ { position: pos }) = pos
position (No_ { position: pos }) = pos
position (Lr_ { position: pos }) = pos

atomToChemicalSymbol :: Atom -> ChemicalSymbol
atomToChemicalSymbol (H_  {}) = H
atomToChemicalSymbol (He_ {}) = He
atomToChemicalSymbol (Li_ {}) = Li
atomToChemicalSymbol (Be_ {}) = Be
atomToChemicalSymbol (B_  {}) = B
atomToChemicalSymbol (C_  {}) = C
atomToChemicalSymbol (N_  {}) = N
atomToChemicalSymbol (O_  {}) = O
atomToChemicalSymbol (F_  {}) = F
atomToChemicalSymbol (Ne_ {}) = Ne
atomToChemicalSymbol (Na_ {}) = Na
atomToChemicalSymbol (Mg_ {}) = Mg
atomToChemicalSymbol (Al_ {}) = Al
atomToChemicalSymbol (Si_ {}) = Si
atomToChemicalSymbol (P_  {}) = P
atomToChemicalSymbol (S_  {}) = S
atomToChemicalSymbol (Cl_ {}) = Cl
atomToChemicalSymbol (Ar_ {}) = Ar
atomToChemicalSymbol (K_  {}) = K
atomToChemicalSymbol (Ca_ {}) = Ca
atomToChemicalSymbol (Sc_ {}) = Sc
atomToChemicalSymbol (Ti_ {}) = Ti
atomToChemicalSymbol (V_  {}) = V
atomToChemicalSymbol (Cr_ {}) = Cr
atomToChemicalSymbol (Mn_ {}) = Mn
atomToChemicalSymbol (Fe_ {}) = Fe
atomToChemicalSymbol (Co_ {}) = Co
atomToChemicalSymbol (Ni_ {}) = Ni
atomToChemicalSymbol (Cu_ {}) = Cu
atomToChemicalSymbol (Zn_ {}) = Zn
atomToChemicalSymbol (Ga_ {}) = Ga
atomToChemicalSymbol (Ge_ {}) = Ge
atomToChemicalSymbol (As_ {}) = As
atomToChemicalSymbol (Se_ {}) = Se
atomToChemicalSymbol (Br_ {}) = Br
atomToChemicalSymbol (Kr_ {}) = Kr
atomToChemicalSymbol (Rb_ {}) = Rb
atomToChemicalSymbol (Sr_ {}) = Sr
atomToChemicalSymbol (Y_  {}) = Y
atomToChemicalSymbol (Zr_ {}) = Zr
atomToChemicalSymbol (Nb_ {}) = Nb
atomToChemicalSymbol (Mo_ {}) = Mo
atomToChemicalSymbol (Tc_ {}) = Tc
atomToChemicalSymbol (Ru_ {}) = Ru
atomToChemicalSymbol (Rh_ {}) = Rh
atomToChemicalSymbol (Pd_ {}) = Pd
atomToChemicalSymbol (Ag_ {}) = Ag
atomToChemicalSymbol (Cd_ {}) = Cd
atomToChemicalSymbol (In_ {}) = In
atomToChemicalSymbol (Sn_ {}) = Sn
atomToChemicalSymbol (Sb_ {}) = Sb
atomToChemicalSymbol (Te_ {}) = Te
atomToChemicalSymbol (I_  {}) = I
atomToChemicalSymbol (Xe_ {}) = Xe
atomToChemicalSymbol (Cs_ {}) = Cs
atomToChemicalSymbol (Ba_ {}) = Ba
atomToChemicalSymbol (Hf_ {}) = Hf
atomToChemicalSymbol (Ta_ {}) = Ta
atomToChemicalSymbol (W_  {}) = W
atomToChemicalSymbol (Re_ {}) = Re
atomToChemicalSymbol (Os_ {}) = Os
atomToChemicalSymbol (Ir_ {}) = Ir
atomToChemicalSymbol (Pt_ {}) = Pt
atomToChemicalSymbol (Au_ {}) = Au
atomToChemicalSymbol (Hg_ {}) = Hg
atomToChemicalSymbol (Tl_ {}) = Tl
atomToChemicalSymbol (Pb_ {}) = Pb
atomToChemicalSymbol (Bi_ {}) = Bi
atomToChemicalSymbol (Po_ {}) = Po
atomToChemicalSymbol (At_ {}) = At
atomToChemicalSymbol (Rn_ {}) = Rn
atomToChemicalSymbol (Fr_ {}) = Fr
atomToChemicalSymbol (Ra_ {}) = Ra
atomToChemicalSymbol (Rf_ {}) = Rf
atomToChemicalSymbol (Db_ {}) = Db
atomToChemicalSymbol (Sg_ {}) = Sg
atomToChemicalSymbol (Bh_ {}) = Bh
atomToChemicalSymbol (Hs_ {}) = Hs
atomToChemicalSymbol (Mt_ {}) = Mt
atomToChemicalSymbol (La_ {}) = La
atomToChemicalSymbol (Ce_ {}) = Ce
atomToChemicalSymbol (Pr_ {}) = Pr
atomToChemicalSymbol (Nd_ {}) = Nd
atomToChemicalSymbol (Pm_ {}) = Pm
atomToChemicalSymbol (Sm_ {}) = Sm
atomToChemicalSymbol (Eu_ {}) = Eu
atomToChemicalSymbol (Gd_ {}) = Gd
atomToChemicalSymbol (Tb_ {}) = Tb
atomToChemicalSymbol (Dy_ {}) = Dy
atomToChemicalSymbol (Ho_ {}) = Ho
atomToChemicalSymbol (Er_ {}) = Er
atomToChemicalSymbol (Tm_ {}) = Tm
atomToChemicalSymbol (Yb_ {}) = Yb
atomToChemicalSymbol (Lu_ {}) = Lu
atomToChemicalSymbol (Ac_ {}) = Ac
atomToChemicalSymbol (Th_ {}) = Th
atomToChemicalSymbol (Pa_ {}) = Pa
atomToChemicalSymbol (U_  {}) = U
atomToChemicalSymbol (Np_ {}) = Np
atomToChemicalSymbol (Pu_ {}) = Pu
atomToChemicalSymbol (Am_ {}) = Am
atomToChemicalSymbol (Cm_ {}) = Cm
atomToChemicalSymbol (Bk_ {}) = Bk
atomToChemicalSymbol (Cf_ {}) = Cf
atomToChemicalSymbol (Es_ {}) = Es
atomToChemicalSymbol (Fm_ {}) = Fm
atomToChemicalSymbol (Md_ {}) = Md
atomToChemicalSymbol (No_ {}) = No
atomToChemicalSymbol (Lr_ {}) = Lr


atom :: ChemicalSymbol -> Position -> Atom
atom H  pos = H_  { position: pos }
atom He pos = He_ { position: pos }
atom Li pos = Li_ { position: pos }
atom Be pos = Be_ { position: pos }
atom B  pos = B_  { position: pos }
atom C  pos = C_  { position: pos }
atom N  pos = N_  { position: pos }
atom O  pos = O_  { position: pos }
atom F  pos = F_  { position: pos }
atom Ne pos = Ne_ { position: pos }
atom Na pos = Na_ { position: pos }
atom Mg pos = Mg_ { position: pos }
atom Al pos = Al_ { position: pos }
atom Si pos = Si_ { position: pos }
atom P  pos = P_  { position: pos }
atom S  pos = S_  { position: pos }
atom Cl pos = Cl_ { position: pos }
atom Ar pos = Ar_ { position: pos }
atom K  pos = K_  { position: pos }
atom Ca pos = Ca_ { position: pos }
atom Sc pos = Sc_ { position: pos }
atom Ti pos = Ti_ { position: pos }
atom V  pos = V_  { position: pos }
atom Cr pos = Cr_ { position: pos }
atom Mn pos = Mn_ { position: pos }
atom Fe pos = Fe_ { position: pos }
atom Co pos = Co_ { position: pos }
atom Ni pos = Ni_ { position: pos }
atom Cu pos = Cu_ { position: pos }
atom Zn pos = Zn_ { position: pos }
atom Ga pos = Ga_ { position: pos }
atom Ge pos = Ge_ { position: pos }
atom As pos = As_ { position: pos }
atom Se pos = Se_ { position: pos }
atom Br pos = Br_ { position: pos }
atom Kr pos = Kr_ { position: pos }
atom Rb pos = Rb_ { position: pos }
atom Sr pos = Sr_ { position: pos }
atom Y  pos = Y_  { position: pos }
atom Zr pos = Zr_ { position: pos }
atom Nb pos = Nb_ { position: pos }
atom Mo pos = Mo_ { position: pos }
atom Tc pos = Tc_ { position: pos }
atom Ru pos = Ru_ { position: pos }
atom Rh pos = Rh_ { position: pos }
atom Pd pos = Pd_ { position: pos }
atom Ag pos = Ag_ { position: pos }
atom Cd pos = Cd_ { position: pos }
atom In pos = In_ { position: pos }
atom Sn pos = Sn_ { position: pos }
atom Sb pos = Sb_ { position: pos }
atom Te pos = Te_ { position: pos }
atom I  pos = I_  { position: pos }
atom Xe pos = Xe_ { position: pos }
atom Cs pos = Cs_ { position: pos }
atom Ba pos = Ba_ { position: pos }
atom Hf pos = Hf_ { position: pos }
atom Ta pos = Ta_ { position: pos }
atom W  pos = W_  { position: pos }
atom Re pos = Re_ { position: pos }
atom Os pos = Os_ { position: pos }
atom Ir pos = Ir_ { position: pos }
atom Pt pos = Pt_ { position: pos }
atom Au pos = Au_ { position: pos }
atom Hg pos = Hg_ { position: pos }
atom Tl pos = Tl_ { position: pos }
atom Pb pos = Pb_ { position: pos }
atom Bi pos = Bi_ { position: pos }
atom Po pos = Po_ { position: pos }
atom At pos = At_ { position: pos }
atom Rn pos = Rn_ { position: pos }
atom Fr pos = Fr_ { position: pos }
atom Ra pos = Ra_ { position: pos }
atom Rf pos = Rf_ { position: pos }
atom Db pos = Db_ { position: pos }
atom Sg pos = Sg_ { position: pos }
atom Bh pos = Bh_ { position: pos }
atom Hs pos = Hs_ { position: pos }
atom Mt pos = Mt_ { position: pos }
atom La pos = La_ { position: pos }
atom Ce pos = Ce_ { position: pos }
atom Pr pos = Pr_ { position: pos }
atom Nd pos = Nd_ { position: pos }
atom Pm pos = Pm_ { position: pos }
atom Sm pos = Sm_ { position: pos }
atom Eu pos = Eu_ { position: pos }
atom Gd pos = Gd_ { position: pos }
atom Tb pos = Tb_ { position: pos }
atom Dy pos = Dy_ { position: pos }
atom Ho pos = Ho_ { position: pos }
atom Er pos = Er_ { position: pos }
atom Tm pos = Tm_ { position: pos }
atom Yb pos = Yb_ { position: pos }
atom Lu pos = Lu_ { position: pos }
atom Ac pos = Ac_ { position: pos }
atom Th pos = Th_ { position: pos }
atom Pa pos = Pa_ { position: pos }
atom U  pos = U_  { position: pos }
atom Np pos = Np_ { position: pos }
atom Pu pos = Pu_ { position: pos }
atom Am pos = Am_ { position: pos }
atom Cm pos = Cm_ { position: pos }
atom Bk pos = Bk_ { position: pos }
atom Cf pos = Cf_ { position: pos }
atom Es pos = Es_ { position: pos }
atom Fm pos = Fm_ { position: pos }
atom Md pos = Md_ { position: pos }
atom No pos = No_ { position: pos }
atom Lr pos = Lr_ { position: pos }
