module Challenge where

import Data.Char

data Result = Gene [(Char,Char,Char)] | InvalidChars Int| InvalidLength Int| UnexpectedEnd Int deriving (Eq,Show)

f :: [Char] -> [(Char,Char,Char)] -> [Char] -> Int -> [Result] -- f :: currentCodon -> currentGene -> stream -> index -> result

-- processing a read codon
f [a,b,c] gene str idx  | elem [c,b,a] ["UAG","UGA","UAA"] = if null gene then f [] [] str idx else Gene (reverse ((c,b,a):gene)) : f [] [] str idx
                        | otherwise = f [] ((c,b,a):gene) str idx

-- processing next stream char
f c g (a:b) idx | a=='>' = skipLine b $! (idx+1) 
                | isSpace a = f c g b $! (idx+1) 
                | elem (toUpper a) "AUGC" = f ((toUpper a):c) g b $! (idx+1) 
                | otherwise = [InvalidChars idx]
    where
    skipLine ('\n':r) i = f c g r $! (i+1) -- end of comment
    skipLine (_:r) i = skipLine r $! (i+1) 
    skipLine _ i = f c g [] $! (i+1) -- end of stream
                
-- end of stream
f c g _ idx     | length c /= 0 = [InvalidLength idx]
                | length g /= 0 = [UnexpectedEnd idx]
                | otherwise = []
				
challenge txt = f [] [] txt 0
