module MolDraw.Bond
( Bond
, atom1Id
, atom2Id
, order
, bond
) where


data Bond = Bond
    { _atom1Id :: Int
    , _atom2Id :: Int
    , _order   :: Int
    }


atom1Id :: Bond -> Int
atom1Id (Bond { _atom1Id }) = _atom1Id

atom2Id :: Bond -> Int
atom2Id (Bond { _atom2Id }) = _atom2Id

order :: Bond -> Int
order (Bond { _order }) = _order


bond :: Int -> Int -> Int -> Bond
bond order' atom1Id' atom2Id' =
    Bond { _atom1Id: atom1Id', _atom2Id: atom2Id', _order: order' }
