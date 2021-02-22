module Main where

import Challenge

main=interact $ unlines . (map show) . (f 0 [] [])
