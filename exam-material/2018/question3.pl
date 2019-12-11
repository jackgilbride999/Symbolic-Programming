/*
a)  What are difference lists and how are they useful.
    Difference lists represent information aboutgrammatical categories not as a single list, but as a difference between two lists.
    e.g. We would represent the sentence "a woman shoots a man" as [a, woman, shoots, a, man] - [] where the second list is the values we want to discard from the first list
    We can see how useful this is whn we look at a sentence made up of a noun phrase and a verb phrase
    s(C) :- np(A), vp(B), append(A, B, C).
    This is very costly as it does not use the input string to guide . There are many calls to np and vp with completely uninstantiated variables.
    If we move append to the start the problem becomes calls to append with uninstantiated variables.
    With difference lists we can define:
    s(X-Z) :- np(X-Y), vp(Y-Z)
    This removes the need for append. We look at the input string X and use it to guide our input. Once we recognize our noun phrase, that is X-Y, so our verb phrase will be Y-Z.
*/

/*
b)  Define a Definite Clause Grammar (DCG) for the set of strings a^(n)b^(n+m)c^m
    of length 2n + 2m for n, m >= 0.
*/
    s --> ns, ms.
    ns --> [].
    ns --> [a], ns, [b].
    ms --> [].
    ms --> [b], ms, [c].
