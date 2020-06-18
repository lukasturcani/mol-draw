module MolDraw.ElementColors
( elementColors
) where


import MolDraw.ChemicalSymbol (ChemicalSymbol(..))



type Color = Int


elementColors :: ChemicalSymbol -> Color
elementColors H : 0xFFFFFF
elementColors He: 0xD9FFFF
elementColors Li: 0xCC80FF
elementColors Be: 0xC2FF00
elementColors B : 0xFFB5B5
elementColors C : 0x909090
elementColors N : 0x3050F8
elementColors O : 0xFF0D0D
elementColors F : 0x90E050
elementColors Ne: 0xB3E3F5
elementColors Na: 0xAB5CF2
elementColors Mg: 0x8AFF00
elementColors Al: 0xBFA6A6
elementColors Si: 0xF0C8A0
elementColors P : 0xFF8000
elementColors S : 0xFFFF30
elementColors Cl: 0x1FF01F
elementColors Ar: 0x80D1E3
elementColors K : 0x8F40D4
elementColors Ca: 0x3DFF00
elementColors Sc: 0xE6E6E6
elementColors Ti: 0xBFC2C7
elementColors V : 0xA6A6AB
elementColors Cr: 0x8A99C7
elementColors Mn: 0x9C7AC7
elementColors Fe: 0xE06633
elementColors Co: 0xF090A0
elementColors Ni: 0x50D050
elementColors Cu: 0xC88033
elementColors Zn: 0x7D80B0
elementColors Ga: 0xC28F8F
elementColors Ge: 0x668F8F
elementColors As: 0xBD80E3
elementColors Se: 0xFFA100
elementColors Br: 0xA62929
elementColors Kr: 0x5CB8D1
elementColors Rb: 0x702EB0
elementColors Sr: 0x00FF00
elementColors Y : 0x94FFFF
elementColors Zr: 0x94E0E0
elementColors Nb: 0x73C2C9
elementColors Mo: 0x54B5B5
elementColors Tc: 0x3B9E9E
elementColors Ru: 0x248F8F
elementColors Rh: 0x0A7D8C
elementColors Pd: 0x006985
elementColors Ag: 0xC0C0C0
elementColors Cd: 0xFFD98F
elementColors In: 0xA67573
elementColors Sn: 0x668080
elementColors Sb: 0x9E63B5
elementColors Te: 0xD47A00
elementColors I : 0x940094
elementColors Xe: 0x429EB0
elementColors Cs: 0x57178F
elementColors Ba: 0x00C900
elementColors Hf: 0x4DC2FF
elementColors Ta: 0x4DA6FF
elementColors W : 0x2194D6
elementColors Re: 0x267DAB
elementColors Os: 0x266696
elementColors Ir: 0x175487
elementColors Pt: 0xD0D0E0
elementColors Au: 0xFFD123
elementColors Hg: 0xB8B8D0
elementColors Tl: 0xA6544D
elementColors Pb: 0x575961
elementColors Bi: 0x9E4FB5
elementColors Po: 0xAB5C00
elementColors At: 0x754F45
elementColors Rn: 0x428296
elementColors Fr: 0x420066
elementColors Ra: 0x007D00
elementColors Rf: 0xCC0059
elementColors Db: 0xD1004F
elementColors Sg: 0xD90045
elementColors Bh: 0xE00038
elementColors Hs: 0xE6002E
elementColors Mt: 0xEB0026
elementColors La: 0x70D4FF
elementColors Ce: 0xFFFFC7
elementColors Pr: 0xD9FFC7
elementColors Nd: 0xC7FFC7
elementColors Pm: 0xA3FFC7
elementColors Sm: 0x8FFFC7
elementColors Eu: 0x61FFC7
elementColors Gd: 0x45FFC7
elementColors Tb: 0x30FFC7
elementColors Dy: 0x1FFFC7
elementColors Ho: 0x00FF9C
elementColors Er: 0x00E675
elementColors Tm: 0x00D452
elementColors Yb: 0x00BF38
elementColors Lu: 0x00AB24
elementColors Ac: 0x70ABFA
elementColors Th: 0x00BAFF
elementColors Pa: 0x00A1FF
elementColors U : 0x008FFF
elementColors Np: 0x0080FF
elementColors Pu: 0x006BFF
elementColors Am: 0x545CF2
elementColors Cm: 0x785CE3
elementColors Bk: 0x8A4FE3
elementColors Cf: 0xA136D4
elementColors Es: 0xB31FD4
elementColors Fm: 0xB31FBA
elementColors Md: 0xB30DA6
elementColors No: 0xBD0D87
elementColors Lr: 0xC70066
