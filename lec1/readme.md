<!-- http://web.mit.edu/gnu/doc/html/flex_1.html#SEC3 -->

A simple scanner based on FLEX


# build 
```
flex -o scanner.c pl0.lex 
g++  -o scanner   scanner.c
./scanner [character stream]
```

e.g.

```
myVar =  32;
```

Output:
```
(my, identifier)
Unrecognized character: V
(ar, identifier)
(=, assignment)
(32, int)
(;, line terminator)
```

```
myVar <- (myVar + 32)*2;
```

Output:
```
(myVar, identifier)
(<-, assignment)
((, open parent)
(myVar, identifier)
(+, operator)
(32, int)
(), close parent)
(*, operator)
(2, int)
(;, line terminator)
```