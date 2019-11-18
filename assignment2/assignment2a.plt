:- begin_tests(assignment2a).

:- include(assignment2a).

test(s) :- s([0,1,0,1,2,0,0,1,0],L), assertion(L = []; L = [0]).

:- end_tests(inference).