/*
a)  State how a Prolog interpreter responds to the following queries, assuming no Prolog program has been consulted.

i)      ?-  X = 1+1
        X = 1+1

ii)     ?- X is 1+1
        X = 2

iii)    ?- love(john, mary)
        error

iv)     ?- assert(love(john, mary))
        true

v)      ?- .([], .(a,Y)) = [X, a]
        X = [], Y = []  ? 

vi)     ?- setof(X,X=X,L)
        L = [_9930]

vii)    ?- findall(X,X=f(X),L)
        L = [_S1], _S1 = f(_S1)

viii)   ?- X=1, X<2
        X = 1, true

ix)     ?- X\=2, X=1
        false

x)      ?- X < 2
        error
*/

/*
b)  Suppose we have the following Prolog program
*/
q(a).
q(X) :- X=b, !.
q(c).
/*
    Write all of Prolog's answers to the following queries.

i)      ?- q(X).
        X = a ;
        X = b.

ii)     ?- q(X), q(Y).
        X = a, Y = a;
        X = a; Y = b;
        X = b; Y = a;
        X = b; Y = b;

iii)    ?- q(X), !, q(Y).
        
*/