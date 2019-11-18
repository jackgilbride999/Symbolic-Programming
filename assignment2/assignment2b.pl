/*  Three neighbouring houses that all have a different 
    colour, namely red, blue, and green. People of different 
    nationalities live in the different houses and they all 
    have a different pet. Write a DCG that outputs strings
    [Col1,Nat1,Pet1, Col2,Nat2,Pet2, Col3,Nat3,Pet3] 
    satisfying this condition where the nationalities are
    english, spanish, japanese and the pets are jaguar, 
    snail and zebra.
*/

s --> col(Col1), nat(Nat1), pet(Pet1), col(Col2), nat(Nat2), pet(Pet2), col(Col3), nat(Nat3), pet(Pet3), {Col1 \= Col2, Col1 \= Col3, Col2 \= Col3, Nat1 \= Nat2, Nat1 \= Nat3, Nat2 \= Nat3, Pet1 \= Pet2, Pet1 \= Pet3, Pet2 \= Pet3}.

col(red) --> [red].
col(blue) --> [blue].
col(green) --> [green].

nat(spanish) --> [spanish].
nat(japanese) --> [japanese].
nat(english) --> [english].

pet(jaguar) --> [jaguar].
pet(snail) --> [snail].
pet(zebra) --> [zebra].