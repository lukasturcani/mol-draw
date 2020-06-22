module MolDraw.Bond
( Bond
, atom1Id
, atom2Id
, order
) where


data Bond = Bond
    { _atom1Id :: Int
    , _atom2Id :: Int
    , _order   :: Int
    }


atom1Id (Bond { _atom1Id }) = _atom1Id
atom2Id (Bond { _atom2Id }) = _atom2Id
order (Bond { _order }) = _order
