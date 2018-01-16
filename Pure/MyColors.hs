data MyColors = Orange | Red | Blue | Green | Silver
 deriving (Show, Eq)
 -- deriving (Show, Eq, Ord) -> the compiler generates a compare function for the type MyColors that orders values
 -- by the order that they appear in the data do expression

instance Ord MyColors where -- this way we use String's compare
  compare c1 c2 = compare (show c1) (show c2)
