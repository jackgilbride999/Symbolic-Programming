:- begin_tests(assignment2c).

:- include(assignment2c).

test(mkList, all(L=[[3,2,1]])) :- mkList(3,L).
test(s, all(L==[[3], [2,1], [1,2], [1,1,1]])) :- s(3,L,[]).

:- end_tests(assignment2c).