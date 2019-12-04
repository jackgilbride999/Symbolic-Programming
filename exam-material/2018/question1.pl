/*
a)  State how a Prolog interpreter responds to the following queries, assuming no Prolog program has been consulted
 
i) ?- [1, 2] = [X|Y].
    X = 1 ;
    Y = [2].
ii) ?- X is 0+Y. 
    Error: Arguments are not sufficiently instantiated
    % (Because all arguments to the right of 'is' must be instantiated)
iii) ?- X = 0+Y.
    X = 0+Y.
    % (Beacuse prolog unifies the terms but does not treat the right of '=' as a calculation) 
iv) ?- <(0,1).
    true.
v) ?- assert(r(a)), r(a).
    Undefined procedure: r/1
    % (Because prolog undergoes the assertion at the end of the query, so  when we check r(a) it hasn't been asserted yet so causes an error)
vi) ?- retract(r(a)), r(a), assert(r(a)).
    Undefined procedure: r/1
    % (Same reason as above)
vii) ?- (X=1; X=2), Y = X+1.
    X = 1,
    Y = 1+1 ;
    X = 2,
    Y = 2+1.
viii) ?- (X=1; X=2), !, X=Y.
    X = 1,
    Y = 1.
    % (Because the ! means prolog won't try to evaluate X=2 if X=1 succeeds for X=1).
ix) ?- findall(X,X=Y,L).
    L = [_10454].
    % Every value will satisfy the condition X=Y, as any Y can be instantiated to any X. As any value fits, this is the same as saying an anonymous variable fits.
x) ?- setof(X,X\=1,L).
    false.
 */

 /*
b)  The predicate memb below is like member, except the recursive (or inductive) clause is declared before the base case.
*/
memb(X, [_|T]) :- memb(X, T).
memb(X, [X|_]).

/*
    How does Prolog respond to the query ?- memb(X, [1,2,3]).
    X = 3;
    X = 2;
    X = 1.
*/

/*
c) Recall that the non-negative integers can be encoded as follows
*/
numeral(0).
numeral(succ(X)) :- numeral(X).
/*
    Define the 3-ary predicates add(X, Y, Z) and multiply (X, Y, Z) to encode addition and multiplication so that, for example,
    ?- add(succ(0), Y, succ(succ(0))).
    Y = succ(0) ; 
    no.
    ?- multiply(succ(0), Y, succ(succ(0))).
    Y = succ(succ(0)) ; 
    no.
*/
add(0, X, X).
add(succ(X), Y, succ(Z)) :- add(X, Y, Z).

multiply(0, _, 0).
multiply(succ(X), Y, Z) :- multiply(X, Y, A), add(Y, A, Z).