%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Room layout
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Doubly links each room
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	linked(X,Y) :- room(X,Y) ; room(Y,X). 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Finds a path between two given points
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	path(Start, Stop, Path) :- 					%test for path()
		path(Start, Stop, [Start], Path).

	path(Start, Stop, Visited, Path) :- 
		linked(Start, Next), 
		Next \== Stop, 
		\+member(Next, Visited), 
		path(Next, Stop, [Next|Visited], Path). 

	path(Start, Stop, Path, [Stop|Path]) :- linked(Start, Stop). 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Maps the phones
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	phone(X, [X|_Xs]).
	phone(X, [_Y|Ys]) :- phone(X, Ys). 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Drives the program, allows for user input
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	phonePath(Start, Stop, Path) :-
		phone(Stop, [3,12,16]),
		path(Start, Stop, [Start], ReversePath),
		reverse(ReversePath, Path).  