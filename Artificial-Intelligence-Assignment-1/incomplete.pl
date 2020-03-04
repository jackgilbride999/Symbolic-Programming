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

%   astar function to be called from the command line to test the recursive function.
astar(Node,Path,Cost) :- kb(KB), astar(Node,Path,Cost,KB).

%   Insert code here.
% astar(Node,Path,Cost,KB) :- ???