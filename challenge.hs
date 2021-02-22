import Data.Char

data Result = Gene [(Char,Char,Char)] | InvalidChars Int| InvalidLength Int| UnexpectedEnd Int deriving Show

f :: Int -> [Char] -> [(Char,Char,Char)] -> [Char] -> [Result] -- f :: index -> currentCodon -> currentGene -> stream -> result

-- processing a read codon
f idx [a,b,c] gene str  | elem [c,b,a] ["UAG","UGA","UAA"] = if null gene then f idx [] [] str else Gene (reverse ((c,b,a):gene)) : f idx [] [] str
                        | otherwise = f idx [] ((c,b,a):gene) str

-- processing comments
f idx c g ('\n':'>':rem) = skipLine (idx+2) rem
    where
    skipLine i ('\n':'>':r) = skipLine (i+2) r  -- another comment
    skipLine i ('\n':r) = f (i+1) c g r -- end of comment
    skipLine i (_:r) = skipLine (i+1) r 
    skipLine i _ = f (i+1) c g [] -- end of stream

-- processing next stream char
f idx c g (a:b) | isSpace a=f (idx+1) c g b
                | elem (toUpper a) "AUGC" = f (idx+1) ((toUpper a):c) g b
                | otherwise = [InvalidChars idx]
                
-- end of stream
f idx c g _     | length c /= 0 = [InvalidLength idx]
                | length g /= 0 = [UnexpectedEnd idx]
                | otherwise = []

-- challenge
-- main=putStr $ unlines . (map show) . (f 0 [] []) $ "uuucaugugcccaaaauccucucaggcauggucaagcccauccuuuuccacaacacagccuag\n>NM_001293063 1\naugugcgaggacugcugugcugcaacuguuuuccguccuuucuuucacuaa"

--challenge 2
main=interact $ unlines . (map show) . (f 0 [] [])