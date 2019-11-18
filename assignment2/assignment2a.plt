:- begin_tests(assignment2a).

:- include(assignment2a).

test(s, all(L=[[0], []])) :- s([0,1,0,1,2,0,0,1,0],L).

:- end_tests(assignment2a).