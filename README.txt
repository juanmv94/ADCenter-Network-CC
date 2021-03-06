EIC Code Challenge - Haskell implementation
-----------------------------------------------

Haskell is a pure functional programming language, that allows to perform lazy evaluation for solving this problem.
Lazy evaluation is a method to evaluate a Haskell program. It means that expressions are not evaluated when they are bound to variables, but their evaluation is deferred until their results are needed by other computations. In consequence, arguments are not evaluated before they are passed to a function, but only when their values are used.
This means that input string will be read, and processed sequentially as it's needed, minimizing memory use.
* For the first challenge, string input is hardcoded. You can compile it with following command: ghc -O2 Challenge1.hs
* For the second challenge:
 * I used the "interact" function that reads input from STDIN and outputs to STDOUT the result of a function in real time.  You can compile it with following command: ghc -O2 Challenge2stdin.hs
 * I used file read/write functions that process both the input (input.txt) and output (output.txt) files in real time.  You can compile it with following command: ghc Challenge2file.hs
* There's also a unit test hs. You can compile it with following command: ghc -O2 Test.hs

For the Gene results, I'm returning a custom data defined as an array of 3-character tuple (codons), or an error. I'm using the default show method for printing results at this moment.

The string stream is passed to a function f that takes for parameters:
* Current codon, that is not completed until it has 3 elements
* Current gene (array of codons)
* Input string
* An incrementing index, meaning character position in the stream

And it returns an array of Result, being Genes and a possible error element at the end of the array (Once an error occurs, processing finishes).

function "f" reads characters from the string (ignoring white spaces, tabs, and comment lines) filling the current codon. Once the codon has 3 elements, we process it adding it to the end of the current gene, and in case it's a stop codon, we append the final gene to the result, and continue with a new empty gene (in case gene is a single noise stop codon, we don't append it to the result).

function "challenge" just calls function "f" with index=0 and empty codon and gene.

Downloading and Installing Haskell compiler (Windows)
------------------------------------------------

You can download GHC Installer here https://downloads.haskell.org/~ghc/7.4.2/ghc-7.4.2-i386-windows.exe (87 MB)

