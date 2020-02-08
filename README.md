# Assignments for CSU34011 Symbolic Programming and CSU33061 Artificial Intelligence.

## Symbolic Programming
### Assignment 1
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

### Assignment 2
1) Write a DCG that accepts strings of the form *u2v* where *u* and *v* are strings over the alphabet {0,1} such that the number of 0's in *u* is twice the number of 1's in *v*. For example,
``` prolog
| ?- s([0,1,0,1,2,0,0,1,0],L).
L = [];
L = [0];
no
```

2) Three neighbouring houses that all have a different colour, namely red, blue, and green. People of different nationalities live in the different houses and they all have a different pet.

Leaving out all other constraints, write a DCG that outputs strings `[Col1,Nat1,Pet1, Col2,Nat2,Pet2, Col3,Nat3,Pet3]` satisfying this condition, where the nationalities are *english*, *spanish*, *japanese* and the pets are *jaguar*, *snail*, *zebra*. For example,
``` prolog
| ?- s([red,english,snail, blue,japanese,jaguar, green,spanish,Z],
[]).
Z = zebra;
no
```

3) Write a DCG that given a non-negative integer *Sum*, accepts a list of integers >=1 that add up to *Sum*. For example,
``` prolog
| ?- s(3,L,[]).
L = [3];
L = [2,1];
L = [1,2];
L = [1,1,1];
no
```