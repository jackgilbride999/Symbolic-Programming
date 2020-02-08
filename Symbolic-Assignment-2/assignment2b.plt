:- begin_tests(assignment2b).
:- include(assignment2b).

test(s, all(Z=[zebra])) :- s([red,english,snail, blue,japanese,jaguar, green,spanish,Z],[]).

:- end_tests(assignment2b).