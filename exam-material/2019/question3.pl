/*
a)  What are difference lists and how are they useful?
    Difference lists represent information about grammatical categories not as a single list, but as the difference between two lists.
    e.g. we would represent the sentence "a woman shoots a man" as [a, woman, shoots, a, man] [] where the second list is the part we want to discard.
    This is useful when we look at an example for a sentence composed of a noun phrase and a verb phrase.
    Without difference lists: s(C) :- np(A), vp(B), append(A, B, C).
    This is very costly as it uses many calls to np(A) and vp(B) with uninstantiated variables (every possible way to break up the sentence to two parts). If we move append to the start then this just means lots of calls to append with uninstantiated variables.
    With difference lists: s(X, Z) :- np(X, Y), vp(Y, Z).
    This removes the need to call append: we use the input string to guide us. Once X is recognized as a noun phrase, we look at Y to see if it is a verb phrase (minus whatever Z is, which in many cases is an empty list). This is much more efficient and worth doing.
*/

/*
b)  A simple DCG for generating bit strings (i.e., lists of 0 and 1) is
    s --> [].
    s --> s,b.
    b --> [0].
    b --> [1].
    For example:
    ? - s(L, []).
    L = [].
    L = [0] ? ;
    L = [1] ? ;
    L = [0,0] ? ;
    L = [0,1] ? ;
    L = [1,0] ? ;
    L = [1,1] ? ;
    L = [0,0,0] ? ;

    But what is problematic about the query 
    ?- s([a], []).
    and how can we fix the DCG above so that the Prolog interpreter answers no to this query.

    The grammar is left recursive, so it will continually try to evaluate the leftmost letter of the sentence with s --> s, b. E.g. at some stage there will be a string s,s,s,s,s,s,s,b but b or s cannot be evaluated to a, so it will keep appending s to the start
    To improve:
*/
    sb --> [].
    sb --> bb, sb.
    bb --> [0].
    bb --> [1].
    % as the grammar is no longer left recursive, it will see that the string [a] does not start with valid terminals 0 or 1, so is not in the language

/*
c)  Write out the DCG given in part (b) as ordinary Prolog clauses, making the difference lists explicit.
*/
    sc([], _).
    sc(X, Z) :- bc(X, Y), sc(Y, Z).
    bc([0|W], W).
    bc([1|W], W).

/*
d)  Write a DCG for a predicate s that outputs lists of the form
    [b1, b2, ..., bn, k]
    for every integer n >= 0 such that either bi is either 0 or 1 for 1 <= i <= n, and k is the integer that the bitstring b1b2...bn encodes
    For example,
    ?- s([1,1,0,X], []).
    X=6 ? ;
    no
    ?- s([1,B,0,4], []).
    B=0 ? ;
    no
    since 110 is the binary encoding of 6, and 100 is the binary encoding of 4.
*/


