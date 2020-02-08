/*  Write a DCG that given a non-negative integer Sum, 
    accepts a list of integers >= 1 that add up to Sum.
*/
s(0) --> [].
s(Sum) --> [Digit], {mkList(Sum, L), member(Digit, L), Acc is Sum-Digit, Acc >= 0}, s(Acc).

% predicate mkList
mkList(1, [1]).
mkList(H, [H|T]) :- H \= 0, Hminus is H-1, mkList(Hminus, T).