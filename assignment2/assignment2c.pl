/*  Write a DCG that given a non-negative integer Sum, 
    accepts a list of integers >= 1 that add up to Sum.
*/


% helper predicate mkList
mkList(1, [1]).
mkList(H, [H|T]) :- H \= 0, Hminus is H-1, mkList(Hminus, T).