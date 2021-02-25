module Main where

import Challenge

main=interact $ unlines . (map show) . challenge
