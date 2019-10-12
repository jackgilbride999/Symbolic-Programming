numeral(0).
numeral(s(X)) :- numeral(X).
numeral(X+Y) :- numeral(X), numeral(Y).


add(0,X,X).
add(s(X),Y,s(Z)) :- add(X,Y,Z).

% Helper predicate simp(X, Z)
simp(0, 0).                         % 0 simplified is just 0
simp(0+X, Z) :- simp(X, Z).         % 0 added to X is just the simplification of X
simp(X+0, Z) :- simp(X, Z).         % 0 added to X is just the simplification of X
simp(X+s(Y), Z) :- simp(s(X)+Y, Z). % For X+Y, subtract one from Y, add it to X, and resimplify
simp(s(X), s(Z)) :- simp(X, Z).     % When X is not 0 or of the form X+Y, simp(X) is X

% Define predicate add2(X, Y, Z), where we simplify x, simplify y, and add
add2(X, Y, Z) :- simp(X, SimpX), simp(Y, SimpY), add(SimpX, SimpY, Z).