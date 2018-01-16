module Main  where

import Data.Time.Clock.POSIX

data GameState = GameState { numberToGuess::Integer, numTries::Integer}
                   deriving (Show)

gameLoop :: GameState -> IO GameState
gameLoop gs = do
  print $ numberToGuess gs
  putStrLn "Enter a number:"
  s <- getLine
  let num = read s :: Integer
  if num == numberToGuess gs then
    return gs
  else gameLoop $ GameState (numberToGuess gs) ((numTries gs) + 1)

main = do
  pTime <- round `fmap` getPOSIXTime
  let gameState = GameState (pTime `mod` 5) 1
  print "Guess a number between 1 and 4"
  gameLoop gameState

