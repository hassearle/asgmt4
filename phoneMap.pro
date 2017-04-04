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
room(2, 1). room(2, 8).
room(3, 8).
room(4, 8). room(4, 9). 
room(5, 6). room(5, 9).
room(6, 5). room(6, 9).
room(7, 1). room(7, 8). room(7, 9). room(7, 10). room(7, 11).
	room(7, 12). room(7, 13). room(7, 14). 
room(8, 2). room(8, 3). room(8, 4). room(8, 7).
room(9, 4). room(9, 5). room(9, 6). room(9, 7).
room(10, 7).
room(11, 7).
room(12, 7).
room(13, 7).
room(14, 7). room(14, 15). 
room(15, 14). room(15, 16).



% path(This, Next):- room(This, Next).
% path(This, NextNext):- room(This, Next), path(Next, NextNext).

path(Y, Z) :- room(Y, Z).
path(X, Z) :- room(Y, Z), path(X, Y). 


path_(Y, Z) :- room(Y, Z).
path_(X, Z) :- room(Y, Z), path_(X, Y).
path_(X, Z, [Path]) :- path_(Path, X), path_(X, Z). 