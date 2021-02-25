module Main where

import Challenge

main=readFile "input.txt" >>= writeFile "output.txt" . unlines . (map show) . challenge
