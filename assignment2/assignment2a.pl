/*  Write a DCG that accepts strings of the form u2v where 
    u and v are strings over the alphabet {0, 1} such that
    the number of 0's in u is twice the number of 1's in v.
*/
% test(s) :- s([0,1,0,1,2,0,0,1,0],L), L = [], L = [0];

s --> u(ZeroCount), [2], v(OneCount), {ZeroCount =:= 2*OneCount}.

u(0) --> [].
u(NewZeroCount) --> [0], u(ZeroCount), {NewZeroCount is ZeroCount+1}.
u(ZeroCount) --> [1], u(ZeroCount).

v(0) --> [].
v(NewOneCount) --> [1], v(OneCount), {NewOneCount is OneCount+1}.
v(OneCount) --> [0], v(OneCount).