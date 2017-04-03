dad(steve, ash).
mom(susan, ash).
dad(steve, paxton).
mom(susan, paxton).

parent(Parent, Child) :- dad(Parent, Child).
parent(Parent, Child) :- mom(Parent, Child).


room(outside, 1).
room(1, 2). room(1, 7).
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

path(Oldest, Youngest):- room(Oldest, Youngest).
path(Oldest, Youngest):- room(Younger, Youngest), 
						path(Oldest, Younger).
