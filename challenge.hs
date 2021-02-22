module Challenge where

import Data.Char

data Result = Gene [(Char,Char,Char)] | InvalidChars Int| InvalidLength Int| UnexpectedEnd Int deriving (Eq,Show)

f :: Int -> [Char] -> [(Char,Char,Char)] -> [Char] -> [Result] -- f :: index -> currentCodon -> currentGene -> stream -> result

-- processing a read codon
f idx [a,b,c] gene str  | elem [c,b,a] ["UAG","UGA","UAA"] = if null gene then f idx [] [] str else Gene (reverse ((c,b,a):gene)) : f idx [] [] str
                        | otherwise = f idx [] ((c,b,a):gene) str

-- processing next stream char
f idx c g (a:b) | a=='>' = skipLine (idx+1) b
                | isSpace a = f (idx+1) c g b
                | elem (toUpper a) "AUGC" = f (idx+1) ((toUpper a):c) g b
                | otherwise = [InvalidChars idx]
    where
    skipLine i ('\n':r) = f (i+1) c g r -- end of comment
    skipLine i (_:r) = skipLine (i+1) r 
    skipLine i _ = f (i+1) c g [] -- end of stream
                
-- end of stream
f idx c g _     | length c /= 0 = [InvalidLength idx]
                | length g /= 0 = [UnexpectedEnd idx]
                | otherwise = []
