module Main where

import Challenge

main=putStr $ unlines . (map show) . (f 0 [] []) $ "uuucaugugcccaaaauccucucaggcauggucaagcccauccuuuuccacaacacagccuag\n>NM_001293063 1\naugugcgaggacugcugugcugcaacuguuuuccguccuuucuuucacuaa"
