-- | Defines default element colors.

module MolDraw.Utils.ElementColors
( color
) where


import MolDraw.ChemicalSymbol (ChemicalSymbol(..))



type Color = Int

-- | Get the default color of an element.
color :: ChemicalSymbol -> Color
color H  = 0xFFFFFF
color He = 0xD9FFFF
color Li = 0xCC80FF
color Be = 0xC2FF00
color B  = 0xFFB5B5
color C  = 0x909090
color N  = 0x3050F8
color O  = 0xFF0D0D
color F  = 0x90E050
color Ne = 0xB3E3F5
color Na = 0xAB5CF2
color Mg = 0x8AFF00
color Al = 0xBFA6A6
color Si = 0xF0C8A0
color P  = 0xFF8000
color S  = 0xFFFF30
color Cl = 0x1FF01F
color Ar = 0x80D1E3
color K  = 0x8F40D4
color Ca = 0x3DFF00
color Sc = 0xE6E6E6
color Ti = 0xBFC2C7
color V  = 0xA6A6AB
color Cr = 0x8A99C7
color Mn = 0x9C7AC7
color Fe = 0xE06633
color Co = 0xF090A0
color Ni = 0x50D050
color Cu = 0xC88033
color Zn = 0x7D80B0
color Ga = 0xC28F8F
color Ge = 0x668F8F
color As = 0xBD80E3
color Se = 0xFFA100
color Br = 0xA62929
color Kr = 0x5CB8D1
color Rb = 0x702EB0
color Sr = 0x00FF00
color Y  = 0x94FFFF
color Zr = 0x94E0E0
color Nb = 0x73C2C9
color Mo = 0x54B5B5
color Tc = 0x3B9E9E
color Ru = 0x248F8F
color Rh = 0x0A7D8C
color Pd = 0x006985
color Ag = 0xC0C0C0
color Cd = 0xFFD98F
color In = 0xA67573
color Sn = 0x668080
color Sb = 0x9E63B5
color Te = 0xD47A00
color I  = 0x940094
color Xe = 0x429EB0
color Cs = 0x57178F
color Ba = 0x00C900
color Hf = 0x4DC2FF
color Ta = 0x4DA6FF
color W  = 0x2194D6
color Re = 0x267DAB
color Os = 0x266696
color Ir = 0x175487
color Pt = 0xD0D0E0
color Au = 0xFFD123
color Hg = 0xB8B8D0
color Tl = 0xA6544D
color Pb = 0x575961
color Bi = 0x9E4FB5
color Po = 0xAB5C00
color At = 0x754F45
color Rn = 0x428296
color Fr = 0x420066
color Ra = 0x007D00
color Rf = 0xCC0059
color Db = 0xD1004F
color Sg = 0xD90045
color Bh = 0xE00038
color Hs = 0xE6002E
color Mt = 0xEB0026
color La = 0x70D4FF
color Ce = 0xFFFFC7
color Pr = 0xD9FFC7
color Nd = 0xC7FFC7
color Pm = 0xA3FFC7
color Sm = 0x8FFFC7
color Eu = 0x61FFC7
color Gd = 0x45FFC7
color Tb = 0x30FFC7
color Dy = 0x1FFFC7
color Ho = 0x00FF9C
color Er = 0x00E675
color Tm = 0x00D452
color Yb = 0x00BF38
color Lu = 0x00AB24
color Ac = 0x70ABFA
color Th = 0x00BAFF
color Pa = 0x00A1FF
color U  = 0x008FFF
color Np = 0x0080FF
color Pu = 0x006BFF
color Am = 0x545CF2
color Cm = 0x785CE3
color Bk = 0x8A4FE3
color Cf = 0xA136D4
color Es = 0xB31FD4
color Fm = 0xB31FBA
color Md = 0xB30DA6
color No = 0xBD0D87
color Lr = 0xC70066
