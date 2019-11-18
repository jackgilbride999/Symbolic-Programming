:- begin_tests(assignment2b).
:- include(assignment2b).

test(s) :- s([red,english,snail, blue,japanese,jaguar, green,spanish,Z],[]), Z = zebra.

:- end_tests(assignment2b).