# CSU33061 Artificial Intelligence Assignment 2
Apply the A∗ search algorithm to the processing of propositional Prolog knowledge bases such as 'example',
which we can represent as the list `[[q,a,b], [q,c], [a,f], [c,b], [c,d,e,f], [d,e], [e], [f,e,d]]`
 and use in the clauses
 ```prolog
arc([H|T],Node,Cost,KB) :- member([H|B],KB), append(B,T,Node), length(B,L), Cost is L+1.
heuristic(Node,H) :- length(Node,H).
goal([]).
```

A file incomplete is supplied.
Your task is to define the predicate `astar(+Node,?Path,?Cost,+KB)`,
that implements A∗, returning a path to the goal node [] with minimal cost, given Node and KB. 

Hint: Modify the skeletal search algorithm
```prolog
search([Node|_]) :- goal(Node).
search([Node|More]) :- findall(X,arc(Node,X),Children),
add-to-frontier(Children,More,New),
search(New).
```
    
so that the head of the list New obtained in add-to-frontier has f-value no larger than any in New’s tail, where *f(node) = cost(node) + h(node)* i.e. *f(node) = cost to travel to that node from current node + heuristic cost of that node*.

Let the frontier be a list of path-cost pairs (instead of just nodes), being careful to update path cost, and to bring in the heuristic function in forming the frontier New.