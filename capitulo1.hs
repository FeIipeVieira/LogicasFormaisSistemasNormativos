-- Capitulo 1 --

allFourEqual :: Int -> Int -> Int -> Int -> Bool
allFourEqual w x y z
  |(w == x) && (x == y) && (y == z) = True
  |otherwise = False

allEqual :: Int -> Int -> Int -> Bool
allEqual x y z = (x == y) && (y == z)

allFourEqual' :: Int -> Int -> Int -> Int -> Bool
allFourEqual' w x y z = (allEqual w x y) && (allEqual x y z)

isEqual :: Int -> Int -> Int
isEqual x y
  | x == y = 1
  | otherwise = 0
  
howManyEqual :: Int -> Int -> Int -> Int
 --howManyEqual x y z
 -- | (x /= y) && (x /= z) = (+) 0 (howManyEqual y z x)
 -- | (isEqual x y == 1) && (isEqual x z == 1) = 3
 -- | (isEqual x y == 1) && (isEqual x z == 0) = 1 + 

howManyEqual x y z
  | (x /= y) && (x /= z) && (y /= z) = 0
  | (x == y) && (y == z) = 3
  | (x /= y || x /= z) && (x == z || y == z) = 2
 
allDifferent :: Int -> Int -> Int -> Bool 
allDifferent x y z = (x /= y) && (x /= z) && (y /= z)

howManyEqual' :: Int -> Int -> Int -> Int
howManyEqual' x y z
  | allDifferent x y z = 0
  | allEqual x y z = 3
  | (x /= y || x /= z) && (x == z || y == z) = 2
  
square :: Int -> Int
square x = x*x

fourPower :: Int -> Int
fourPower x = (square x) * (square x)

tester :: Int -> Int -> Int -> Int
tester n m p = ((n+m+p) == 3*p)

-- Final Capitulo 1 --