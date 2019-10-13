:- begin_tests(assignment1).  % for plunit

:- include(assignment1).  % include for everything in local namespace

% Exercise 1, define a predicate add2(X,Y,Z) such that
test(add2) :-  add2(s(0)+s(s(0)), s(s(0)), Z), Z=s(s(s(s(s(0))))). 
test(add2) :- add2(0, s(0)+s(s(0)), Z), Z=s(s(s(0))).
test(add2) :- add2(s(s(0)), s(0)+s(s(0)), Z), Z = s(s(s(s(s(0))))).
test(add2) :- add2(s(0)+s(0), s(0+s(s(0))), Z), Z = s(s(s(s(s(0))))).

% Exercise 2, extend the predicate add2 such that
test(add2) :- add2(p(s(0)), s(s(0)), Z), Z = s(s(0)).
test(add2) :- add2(0, s(p(0)), Z), Z = 0.
test(add2) :- add2(p(0)+s(s(0)),s(s(0)),Z), Z = s(s(s(0))).
test(add2) :- add2(p(0), p(0)+s(p(0)), Z), Z = p(p(0)).

% Exercise 3, define a predicate minus(X,Y) such that
test(minus) :- minus(0, Z), Z = 0.
test(minus) :- minus(s(s(0)), Z), Z = p(p(0)).
test(minus) :- minus(s(p(0)), Z), Z = 0.
test(minus) :- minus(p(s(p(0))), Z), Z = s(0).

% Exercise 4, revise the predicate add2(X,Y,Z) such that
test(add2) :- add2(-p(s(0)), s(s(0)), Z), Z = s(s(0)).
test(add2) :- add2(p(0)+s(s(0)), -s(s(0)), Z), Z = p(0).

% Exercise 5, define the predicate subtract(X,Y,Z) for subtracting Y from X to get Z such that
test(subtract) :- subtract(p(s(0)), s(s(0)), Z), Z = p(p(0)).
test(subtract) :- subtract(p(0), -s(s(0)), Z), Z = s(0).

% Exercise 6, extend the predicates add2 and subtract to handle the new rule numeral(X-Y) :- numeral(X), numeral(Y) such that
test(add2) :- add2(-(s(0)-p(0)),s(0),Z), Z = p(0).
test(add2) :- subtract(p(0), p(s(0))-s(s(0)), Z), Z = s(0).
 