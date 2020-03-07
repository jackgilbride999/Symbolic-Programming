%   In a dynamic procedure, there is a starter set of facts/rules. But we may wish to infer extra facts during execution and add them to the data base.
:- dynamic(kb/1).

%   Read in the file, reformat it and add it to the knowledge base.
makeKB(File):- 
    open(File,read,Str),
    readK(Str,K),
    reformat(K,KB),
    asserta(kb(KB)),
    close(Str).

%   Helper files for converting knowledge base file to list format.
readK(Stream,[]):- at_end_of_stream(Stream),!.
readK(Stream,[X|L]):- 
    read(Stream,X),
    readK(Stream,L).
reformat([],[]).
reformat([end_of_file],[]) :- !.
reformat([:-(H,B)|L],[[H|BL]|R]) :- 
    !,
    mkList(B,BL),
    reformat(L,R).
reformat([A|L],[[A]|R]) :- reformat(L,R).
mkList((X,T),[X|R]) :- !, mkList(T,R).
mkList(X,[X]).

%   Pull in the file, convert it to list format and add it to the knowledge base. By calling the formulae above.
initKB(File) :- retractall(kb(_)), makeKB(File).

%   The list can be used in the clauses:
arc([H|T],Node,Cost,KB) :- member([H|B],KB), append(B,T,Node), length(B,L), Cost is L+1.
heuristic(Node,H) :- length(Node,H).
goal([]).

%   astar function to be called from the command line to test the recursive function.
astar(Node,Path,Cost) :- kb(KB), astar(Node,Path,Cost,KB).

%   Insert code here.
 astar(Node,Path,Cost,KB) :- search(Node, Path, Cost, KB).

 %   Modify this so so that the head of the list New obtained in add-to-frontier has f-value no larger than any in New’s tail, where f(node) = cost(node) + h(node).
search([Node|_]) :- goal(Node).
search([Node|More]) :- findall(X,arc(Node,X),Children),
    add-to-frontier(Children,More,New),
    search(New).
    
%   Let the frontier be a list of path-cost pairs (instead of just nodes), being careful to update path cost, and to bring in the heuristic function in forming the frontier New.
less-than([[Node1|_],Cost1],[[Node2|_],Cost2]) :-
    heuristic(Node1,Hvalue1), heuristic(Node2,Hvalue2),
    F1 is Cost1+Hvalue1, F2 is Cost2+Hvalue2,
    F1 =< F2.

%   From slides
add2frontier(Children,[],Children).
add2frontier(Children,[H|T],[H|More]) :-
add2frontier(Children,T,More).
