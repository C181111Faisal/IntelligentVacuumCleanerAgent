start:-
	writeln('+----------------------------------------------+'),
	writeln(' Instructions for giving inputs-'),
	writeln(' Enter initial location of the agent as A/B'),
	writeln(' Enter status for location as'),
	writeln(' 1 for \'Dirty\' and 0 for \'Clean.\''),
	write('+----------------------------------------------+'),nl,
	writeln(' Agent goal state [A: 0, B: 0]'),nl,
	writeln('Enter initial location of vacuum:'),
	read(X),
	write('Enter status of location '),
	writeln(X),
	read(Y),
	check(X,Y).

check(X,Y):-
	(X=:="A"->
	writeln('Enter status of location B'),
	read(Z),nl,
	C is 1,
	status_of_A(X),
	is_dirty_A(Y),
	take_actions_for_A(Z,Y,X,C)
	;X=:="B"->
	writeln('Enter status of location A:'),
	read(Z),nl,
	C is 1,
	status_of_B(X),
	is_dirty_B(Y),
	take_actions_for_B(Z,Y,X,C)
	).
	
status_of_A(X):-
	write('Vacuum is placed in location '),
	write(X),nl,
	write('Location '),
	write(X),
	write(' is ').

is_dirty_A(Y):-
	(Y=:=1->
	 writeln('dirty')
	 ;Y=:=0->
	 writeln('clean')
	).
	
take_actions_for_A(Z,Y,X,C):-
	(Y=:=1->
	 write('Status: ['),write(X),write(',Dirty],  '),
	 writeln('Action: Suck'),nl,
	 write('Cost for cleaning location '),write(X),
	 write(' is 1'),nl,D is C+1,
	 write('Status: ['),write(X),write(',Clean],  '),
	 writeln('Action: Right'),nl,
	 writeln('Moving to location B'),
	 writeln('Cost for moving to location B is 1'),nl,
	 cleanA(Z,D)
	 ;Y=:=0->
	 write('Status: ['),write(X),write(',Clean],  '),
	 writeln('Action: Right'),nl,
	 write('Location '),write(X),write(' is already clean'),nl,
	 writeln('Moving to location B'),
	 writeln('Cost for moving to location B is 1'),nl,D is C,
	 cleanA(Z,D)
	).
	
cleanA(Z,D):-
	(Z=:=1->
	 write('Status: ['),write('B'),write(',Dirty],  '),
	 writeln('Action: Suck'),nl,
	 writeln('location B is also dirty'),
	 writeln('Cost for cleaning location B is 1'),nl,
	 E is D+1,performanceA(E)
	 ;Z=:=0->
	 write('Status: ['),write('B'),write(',Clean],  '),
	 writeln('Action: NoOP'),nl,
	 writeln('Location B is already clean'),nl,
	 E is D,performanceA(E)
	).
	
performanceA(E):-
	write('Performance of the agent is '),writeln(E).

status_of_B(X):-
	write('Vacuum is placed in location '),
	write(X),nl,
	write('Location '),
	write(X),
	write(' is ').

is_dirty_B(Y):-
	(Y=:=1->
	 writeln('dirty')
	 ;Y=:=0->
	 writeln('clean')
	).
	
take_actions_for_B(Z,Y,X,C):-
	(Y=:=1->
	 write('Status: ['),write(X),write(',Dirty],  '),
	 writeln('Action: Suck'),nl,
	 write('Cost for cleaning location '),write(X),
	 write(' is 1'),nl,D is C+1,
	 write('Status: ['),write(X),write(',Clean],  '),
	 writeln('Action: Right'),nl,
	 writeln('Moving to location A'),
	 writeln('Cost for moving to location A is 1'),nl,
	 cleanB(Z,D)
	 ;Y=:=0->
	 write('Status: ['),write(X),write(',Clean],  '),
	 writeln('Action: Right'),nl,
	 write('Location '),write(X),write(' is already clean'),nl,
	 writeln('Moving to location A'),
	 writeln('Cost for moving to location A is 1'),nl,D is C,
	 cleanB(Z,D)
	).
	
cleanB(Z,D):-
	(Z=:=1->
	 write('Status: ['),write('A'),write(',Dirty],  '),
	 writeln('Action: Suck'),nl,
	 writeln('location A is also dirty'),
	 writeln('Cost for cleaning location A is 1'),nl,
	 E is D+1,performanceB(E)
	 ;Z=:=0->
	 write('Status: ['),write('A'),write(',Clean],  '),
	 writeln('Action: NoOP'),nl,
	 writeln('No action needed for location A'),nl,
	 E is D,performanceB(E)
	).
	
performanceB(E):-
	write('Performance of the agent is '),writeln(E).

