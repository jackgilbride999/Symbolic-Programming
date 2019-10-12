numeral(0).
numeral(s(X)) :- numeral(X).
numeral(X+Y) :- numeral(X), numeral(Y).


add(0,X,X).
add(s(X),Y,s(Z)) :- add(X,Y,Z).

% Helper predicate simp(X, Z)
simp(X, 0) :- X = 0.                % 0 simplified is just 0
simp(X+0, Z) :- simp(X, Z).         % X+0 simplified is the simplification of X
simp(X+s(Y), Z) :- simp(s(X)+Y, Z). % For X+Y, subtract one from Y, add it to X, and resimplify
simp(X, X).                         % When X is not 0 or of the form X+Y, simp(X) is X

% Define predicate add2(X, Y, Z)
