:- begin_tests(assignment2).

:- include(assignment2).

test(s1) :- s1([0,1,0,1,2,0,0,1,0],L), L = [], L = [0];