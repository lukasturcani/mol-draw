module MolDraw.Atom
( Atom
, size
, position
, chemicalSymbol
, atom
) where

import Prelude
import MolDraw.Position (Position)
import MolDraw.ChemicalSymbol (ChemicalSymbol (..))


data Atom = Atom
    { chemicalSymbol :: ChemicalSymbol
    , position       :: Position
    }


instance showAtom :: Show Atom where
    show (Atom { chemicalSymbol: symbol, position: pos })
        =  "Atom { chemicalSymbol: "
        <> show symbol
        <> ", position: "
        <> show pos
        <> " }"


position :: Atom -> Position
position (Atom { position: pos }) = pos

chemicalSymbol :: Atom -> ChemicalSymbol
chemicalSymbol (Atom { chemicalSymbol: symbol }) = symbol

atom :: ChemicalSymbol -> Position -> Atom
atom symbol pos = Atom  { chemicalSymbol: symbol, position: pos }


size :: Atom -> Number
size (Atom { chemicalSymbol: H  }) = 0.53
size (Atom { chemicalSymbol: He }) = 0.31
size (Atom { chemicalSymbol: Li }) = 1.67
size (Atom { chemicalSymbol: Be }) = 1.12
size (Atom { chemicalSymbol: B  }) = 0.87
size (Atom { chemicalSymbol: C  }) = 0.67
size (Atom { chemicalSymbol: N  }) = 0.56
size (Atom { chemicalSymbol: O  }) = 0.48
size (Atom { chemicalSymbol: F  }) = 0.42
size (Atom { chemicalSymbol: Ne }) = 0.38
size (Atom { chemicalSymbol: Na }) = 1.90
size (Atom { chemicalSymbol: Mg }) = 1.45
size (Atom { chemicalSymbol: Al }) = 1.18
size (Atom { chemicalSymbol: Si }) = 1.11
size (Atom { chemicalSymbol: P  }) = 0.98
size (Atom { chemicalSymbol: S  }) = 0.88
size (Atom { chemicalSymbol: Cl }) = 0.79
size (Atom { chemicalSymbol: Ar }) = 0.71
size (Atom { chemicalSymbol: K })  = 2.43
size (Atom { chemicalSymbol: Ca }) = 1.94
size (Atom { chemicalSymbol: Sc }) = 1.84
size (Atom { chemicalSymbol: Ti }) = 1.76
size (Atom { chemicalSymbol: V  }) = 1.71
size (Atom { chemicalSymbol: Cr }) = 1.66
size (Atom { chemicalSymbol: Mn }) = 1.61
size (Atom { chemicalSymbol: Fe }) = 1.56
size (Atom { chemicalSymbol: Co }) = 1.52
size (Atom { chemicalSymbol: Ni }) = 1.49
size (Atom { chemicalSymbol: Cu }) = 1.45
size (Atom { chemicalSymbol: Zn }) = 1.42
size (Atom { chemicalSymbol: Ga }) = 1.36
size (Atom { chemicalSymbol: Ge }) = 1.25
size (Atom { chemicalSymbol: As }) = 1.14
size (Atom { chemicalSymbol: Se }) = 1.03
size (Atom { chemicalSymbol: Br }) = 0.94
size (Atom { chemicalSymbol: Kr }) = 0.88
size (Atom { chemicalSymbol: Rb }) = 2.65
size (Atom { chemicalSymbol: Sr }) = 2.19
size (Atom { chemicalSymbol: Y  }) = 2.12
size (Atom { chemicalSymbol: Zr }) = 2.06
size (Atom { chemicalSymbol: Nb }) = 1.98
size (Atom { chemicalSymbol: Mo }) = 1.90
size (Atom { chemicalSymbol: Tc }) = 1.83
size (Atom { chemicalSymbol: Ru }) = 1.78
size (Atom { chemicalSymbol: Rh }) = 1.73
size (Atom { chemicalSymbol: Pd }) = 1.69
size (Atom { chemicalSymbol: Ag }) = 1.65
size (Atom { chemicalSymbol: Cd }) = 1.61
size (Atom { chemicalSymbol: In }) = 1.56
size (Atom { chemicalSymbol: Sn }) = 1.45
size (Atom { chemicalSymbol: Sb }) = 1.33
size (Atom { chemicalSymbol: Te }) = 1.23
size (Atom { chemicalSymbol: I  }) = 1.15
size (Atom { chemicalSymbol: Xe }) = 1.08
size (Atom { chemicalSymbol: Cs }) = 2.98
size (Atom { chemicalSymbol: Ba }) = 2.53
size (Atom { chemicalSymbol: La }) = 1.95
size (Atom { chemicalSymbol: Ce }) = 1.85
size (Atom { chemicalSymbol: Pr }) = 2.47
size (Atom { chemicalSymbol: Nd }) = 2.06
size (Atom { chemicalSymbol: Pm }) = 2.05
size (Atom { chemicalSymbol: Sm }) = 2.38
size (Atom { chemicalSymbol: Eu }) = 2.31
size (Atom { chemicalSymbol: Gd }) = 2.33
size (Atom { chemicalSymbol: Tb }) = 2.25
size (Atom { chemicalSymbol: Dy }) = 2.28
size (Atom { chemicalSymbol: Ho }) = 2.26
size (Atom { chemicalSymbol: Er }) = 2.26
size (Atom { chemicalSymbol: Tm }) = 2.22
size (Atom { chemicalSymbol: Yb }) = 2.22
size (Atom { chemicalSymbol: Lu }) = 2.17
size (Atom { chemicalSymbol: Hf }) = 2.08
size (Atom { chemicalSymbol: Ta }) = 2.00
size (Atom { chemicalSymbol: W  }) = 1.93
size (Atom { chemicalSymbol: Re }) = 1.88
size (Atom { chemicalSymbol: Os }) = 1.85
size (Atom { chemicalSymbol: Ir }) = 1.80
size (Atom { chemicalSymbol: Pt }) = 1.77
size (Atom { chemicalSymbol: Au }) = 1.74
size (Atom { chemicalSymbol: Hg }) = 1.71
size (Atom { chemicalSymbol: Tl }) = 1.56
size (Atom { chemicalSymbol: Pb }) = 1.54
size (Atom { chemicalSymbol: Bi }) = 1.43
size (Atom { chemicalSymbol: Po }) = 1.35
size (Atom { chemicalSymbol: At }) = 1.27
size (Atom { chemicalSymbol: Rn }) = 1.20
size (Atom { chemicalSymbol: Ac }) = 1.95
size (Atom { chemicalSymbol: Th }) = 1.80
size (Atom { chemicalSymbol: Pa }) = 1.80
size (Atom { chemicalSymbol: U  }) = 1.75
size (Atom { chemicalSymbol: Np }) = 1.75
size (Atom { chemicalSymbol: Pu }) = 1.75
size (Atom { chemicalSymbol: Am }) = 1.75
size _     = 2.0
