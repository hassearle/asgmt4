mom(susan, ash).
mom(susan, paxton).
mom(virgina, susan).
dad(steve, ash).
dad(steve, paxton).
dad(george, steve).

parent(Parent, Child) :- dad(Parent, Child).
parent(Parent, Child) :- mom(Parent, Child).

siblings(Child1, Child2) :- dad(Father, Child1),
							dad(Father, Child2).

gma(Gparent, Gchild):- mom(Gparent, Mom), mom(Mom, Gchild).

room(outside, 1).
room(1, 2). room(1, 7).
room(2, 8).
room(3, 8).
room(4, 8). 
room(4, 9). 
room(5, 6). room(5, 9). 
room(6, 9).
room(7, 8). room(7, 9). room(7, 10). room(7, 11).
	room(7, 12). room(7, 13). room(7, 14). 
room(14, 15). 
room(15, 16). 

% path(This, Next):- room(This, Next).
% path(This, NextNext):- room(This, Next), path(Next, NextNext).


linked(X,Y) :- room(X,Y) ; room(Y,X). 

phone(X, [X|_Xs]).
phone(X, [_Y|Ys]) :- phone(X, Ys). 


path(Start, Stop, Path) :- path(Start, Stop, [Start], Path).

path(Start, Stop, Path, [Stop|Path]) :- linked(Start, Stop). 

path(Start, Stop, Visited, Path) :- 
	linked(Start, Next), 
	Next \== Stop, 
	\+member(Next, Visited), 
	path(Next, Stop, [Next|Visited], Path). 