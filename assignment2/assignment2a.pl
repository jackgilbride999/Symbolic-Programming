/*  Write a DCG that accepts strings of the form u2v where 
    u and v are strings over the alphabet {0, 1} such that
    the number of 0's in u is twice the number of 1's in v.
*/
% test(s1) :- s1([0,1,0,1,2,0,0,1,0],L), L = [], L = [0];
s --> term(0, 0).
term(OneCount, NewZeroCount) --> [0], term(OneCount, ZeroCount), {NewZeroCount is ZeroCount + 1, NewZeroCount is 2*OneCount}. % if we append a zero to the start, ZeroCount is incremented
term(NewOneCount, ZeroCount) --> [1], term(OneCount, ZeroCount). % if we append a one to the start, no checks are needed
term(OneCount, NewZeroCount) --> term(OneCount, ZeroCount), [0]. % if we append a zero to the end, no checks are needed
term(NewOneCount, ZeroCount) --> term(OneCount, ZeroCount), [1], {NewOneCount is OneCount + 1, ZeroCount is 2*OneCount}. % if we append a one to the end, OneCount is incremented
term(OneCount, ZeroCount) --> [2].