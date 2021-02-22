module Main where

import Challenge

tests=[
	(
		"Test1",
		"uuucaugugcccaaaauccucucaggcauggucaagcccauccuuuuccacaacacagccuag\n>NM_001293063 1\naugugcgaggacugcugugcugcaacuguuuuccguccuuucuuucacuaa",
		[Gene [('U','U','U'),('C','A','U'),('G','U','G'),('C','C','C'),('A','A','A'),('A','U','C'),('C','U','C'),('U','C','A'),('G','G','C'),('A','U','G'),('G','U','C'),('A','A','G'),('C','C','C'),('A','U','C'),('C','U','U'),('U','U','C'),('C','A','C'),('A','A','C'),('A','C','A'),('G','C','C'),('U','A','G')], Gene [('A','U','G'),('U','G','C'),('G','A','G'),('G','A','C'),('U','G','C'),('U','G','U'),('G','C','U'),('G','C','A'),('A','C','U'),('G','U','U'),('U','U','C'),('C','G','U'),('C','C','U'),('U','U','C'),('U','U','U'),('C','A','C'),('U','A','A')]]
	),
	(
		"Test2",
		">---\n-",
		[InvalidChars 5]
	)
	]
	
test (name,input,result) = name ++ (if f 0 [] [] input == result then " OK" else " FAIL")

main=putStr $ unlines $ map test tests
