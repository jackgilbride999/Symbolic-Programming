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
        Y = [], X = [] 

vi)     ?- setof(X,X=X,L)
        L = [_9930]

vii)    ?- findall(X,X=f(X),L)
        L = [_S1], _S1 = f(_S1)

viii)   ?- X=1, X<2
        X = 1, true

ix)     ?- X\=2, X=1
        false

x)      ?- X < 2
        instantiation error
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
        X = Y, Y = a;
        X = a, Y = b.
        
iv)     ?- q(c).
        true.
*/

/*
c)  Given unary predicates bird, fly, penguin, write a Prolog program saying all birds fly except penguins (which do not).
*/
    fly(X) :- bird(X), \+ penguin(X).

/*
d)  Recall that positive integers can be encoded as successors of 0 (with, for example, succ(succ(0)) encoding 2),
    and similarly, negative integers can be encoded as predecessors of 0 (with, for example, pred(pred(0)) encoding -2).
*/
    pos(succ(0)).
    pos(succ(X)) :- pos(X).

    neg(pred(0)).
    neg(pred(X)) :- neg(X).

/*
    These definitions suggest two ways to represent all integers, given by the predicates pure and mixed below.
*/
    pure(0).
    pure(X) :- pos(X); neg(X).

    mixed(0).
    mixed(succ(X)) :- mixed(X).
    mixed(pred(X)) :- mixed(X).

/*
i)  Give a term t without variables such that Prolog answers yes/true to the following query
        ?- mixed(t), \+ pure(t).
        pred(succ(0)).
*/

/*
ii) State Prolog's response to the query
        ?- mixed(X), \+ pure(X).
        program runs forever
*/

/*
iii) Define a binary predicate convert(Mixed, Pure) that converts a mixed representation to its pure counterpart (representing the same integer)
*/
    convert(0, 0).
    convert(s(p(X)), Y) :- convert(X, Y).
    convert(p(s(X)), Y) :- convert(X,Y).
    convert(s(X), s(Y)) :- convert(X, Y).
    convert(p(X), p(Y)) :- convert(X, Y).