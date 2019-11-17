:- begin_tests(assignment2a).

:- include(assignment2a).

test(s1) :- s1([0,1,0,1,2,0,0,1,0],L), L = [], L = [0];