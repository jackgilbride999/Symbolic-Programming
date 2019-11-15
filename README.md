# Assignments for CSU34011 Symbolic Programming.

## Assignment 1
Working with the knowledge base:
``` prolog 
numeral(0).
numeral(s(X)) :- numeral(X).
add(0,X,X).
add(s(X),Y,s(Z)) :- add(X,Y,Z).
numeral(X+Y) :- numeral(X), numeral(Y).
numeral(p(X)) :- numeral(X).
numeral(-X) :- numeral(X).
numeral(X-Y) :- numeral(X), numeral(Y).
```

Where p(X) represents the predecessor of X and s(X) represents the successor of X, define the predicates:
``` prolog 
add2(X, Y, Z).
minus(X, Y).
subtract(X, Y, Z).
```
such that they pass multiple test cases. The predicates were put into assignment1.pl and the test cases were put into assignment1.plt.