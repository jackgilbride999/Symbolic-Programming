numeral(0).
numeral(s(X)) :- numeral(X).
numeral(X+Y) :- numeral(X), numeral(Y).
numeral(p(X)) :- numeral(X).
numeral(-X) :- numeral(X).


add(0,X,X).
add(s(X),Y,s(Z)) :- add(X,Y,Z).

% Helper predicate simp(X, Z)
simp(-0, 0).                        % 0 negated is just 0
simp(-p(X), Z) :- minus(p(X), Z).  % put the negation into the preferred numeral form
simp(-s(X), Z) :- minus(s(X), Z).  % put the negation into the preferred numeral form

simp(0, 0).                         % 0 simplified is just 0
simp(0+X, Z) :- simp(X, Z).         % 0 added to X is just the simplification of X
simp(X+0, Z) :- simp(X, Z).         % 0 added to X is just the simplification of X
simp(X+s(Y), Z) :- simp(s(X)+Y, Z). % For X+Y, subtract one from Y, add it to X, and resimplify
simp(X+p(Y), Z) :- simp(p(X)+Y, Z).

simp(p(s(X)), Z) :- simp(X, Z).     % X - 1 + 1 is just X (but simplify)
simp(s(p(X)), Z) :- simp(X, Z).     % X + 1 - 1 is just X (but simplify)
simp(p(X), p(Z)) :- simp(X, Z).     % Recursive call to simplify the numeral inside s()
simp(s(X), s(Z)) :- simp(X, Z).     % Recursive call to simplify the numberal inside p()

% Define predicate add2(X, Y, Z), where we simplify x, simplify y, and add
add2(X, Y, Z) :- simp(X, SimpX), simp(Y, SimpY), simp(SimpX+SimpY, Z).

% Helper predicate negate(X, Y)
negate(0, 0).
negate(s(X), p(Z)) :- negate(X, Z).
negate(p(X), s(Z)) :- negate(X, Z).

% Define predicate minus, where we negate X, then simplify it
minus(X, Y) :- negate(X, NegateX), simp(NegateX, Y).