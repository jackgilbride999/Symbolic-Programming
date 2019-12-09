/*
2)  The nth derangement number Dn is the integer defined inductively as follows
    D1 := 0
    D2 := 1
    Dn := (n-1)(Dn-1 + Dn-2) for n > 2
    
    so that, for example,

    D3 = 2(1 + 0) = 2
    D4 = 3(2 + 1) = 9.

    This question is about defining a binary predicate d computing derangement numbers, leading the Prolog interpreter to respond, for example, as follows.

    ?- d(3, D).
    D=2 ? ;
    no

    ?- d(4, D).
    D=9 ? ;
    no.
*/
/*
a)  A simple attempt to define d is given below, with question marks
        ?1, ?2, ?3, ?4, ?5
    that must be replaced by suitable Prolog variables.
    d(1,0).
    d(2,1).
    d(N,D) :-   N>2, 
                ?1 is N-1,
                ?2 is N-2,
                d(N1, ?3),
                d(N2, ?4),
                D is ?5*(D1+D2).
    Replace the question marks ?1, ?2, ?3, ?4, ?5 so that the code above computes derangement numbers.
*/
    d(1,0).
    d(2,1).
    d(N,D) :-   N>2, 
                N1 is N-1,
                N2 is N-2,
                d(N1, D1),
                d(N2, D2),
                D is N1*(D1+D2).

/*
b)  What is tail recursion and why is the definition of d/2 in part (a) not tail recursive?
    Tail recursion is when, in a recursive function, you leave the recursive call to the very end, once you have undergone your calculations. The result is fully calculated once we reach the base clause, rather than for a non-tail recursive predicate where there are still goals on the stack when we reach the base clause.
    The definition in part a) is not tail recursive because it has two recursive calls, neither of which are at the end of the function. Even if one were at the end, it would still not be tail recursive; as there are two calls, there will always be some processing to do after the first recursive call.
*/

/*
c)  Revise the definition of d/2 above for a tail-recursive program computing the nth derangement number.
*/
    dRecursive(1, 0).
    dRecursive(2, 1).
    dRecursive(N, D) :- N > 2, d(2, 1, 0, D, N).

    d(N, _, D, D, N).

    d(N, D1, D2, EndD, EndN) :- D is (N-1)*(D1+D2),
                                Nplus is N+1,
                                d(Nplus, D, D1, EndD, EndN).

/*
d)  What is memoization and what is it good for?
    Memoization is storing previous results to computations, in case we need to calculate the same query. It is useful because it saves time during calculations, the next time we calculate we simply read the fact as true rather than spend time recalculating.
*/

/*
e)  Use memoization to compute the nth derangement number, revising the definition of d/2 in part (a) above.
*/
:- dynamic lookup/2.

    lookup(1,0).
    lookup(2,1).
    
    dMemoize(N,D) :-   
                lookup(N, D), !.
    dMemoize(N, D) :- N>2, 
                N1 is N-1,
                N2 is N-2,
                dMemoize(N1, D1),
                dMemoize(N2, D2),
                D is N1*(D1+D2),
                assert(lookup(N, D)).