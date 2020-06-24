-- | Defines the `Bond` type.

module MolDraw.Bond
( Bond
, AtomId
, BondOrder
, atom1Id
, atom2Id
, order
, bond
) where


type AtomId = Int
type BondOrder = Int


-- | Represents a bond.
data Bond = Bond
    { _atom1Id :: AtomId
    , _atom2Id :: AtomId
    , _order   :: BondOrder
    }


-- | Get the id of the first atom.
atom1Id :: Bond -> AtomId
atom1Id (Bond { _atom1Id }) = _atom1Id

-- | Get the id of the second atom.
atom2Id :: Bond -> AtomId
atom2Id (Bond { _atom2Id }) = _atom2Id

-- | Get the bond order.
order :: Bond -> BondOrder
order (Bond { _order }) = _order


-- | Create a bond.
bond :: BondOrder -> AtomId -> AtomId -> Bond
bond order' atom1Id' atom2Id' =
    Bond { _atom1Id: atom1Id', _atom2Id: atom2Id', _order: order' }
