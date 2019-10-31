%% Problem 2
% Use 1 based indexing 

% a
% Incorrect -> Order
is_in(A,[A|_]).
is_in(X,[_|T]):-
    is_in(X,T).

sublist([],_).
sublist([H|T],L):-
    is_in(H,L) -> sublist(T,L); false.

% b
count_elem(N,X,L):-
    count_elem_acc(N,X,L,0).

count_elem_acc(A,_,[],A).
count_elem_acc(N,X,[H|T],Acc):-
    X == H ->  Acc1 is Acc+1, count_elem_acc(N,X,T,Acc1); 
    			Acc1 is Acc, count_elem_acc(N,X,T,Acc1).

has_triplicate(X,[H|T]):-
	count_elem(N,H,T),
    N >= 2 -> X is H; 
    as_triplicate(X,T).

% c
remove_nth(X,L,K):-
    rem_n_acc(X,L,[],K,1).
    
rem_n_acc(A,[],A,_,_).
rem_n_acc(X,[H|T],Acc,K,N):- 
    N is K -> M is N+1, rem_n_acc(X,T,Acc,K,M); 
    M is N+1, append(Acc,[H],Acc1), rem_n_acc(X,T,Acc1,K,M).

% d
remove_every_other(X,Y):-
    rem_oth_acc(X,Y,[],1).
rem_oth_acc(A,[],A,_).
rem_oth_acc(X,[H|T],Acc,1):- append(Acc,[H],Acc1), rem_oth_acc(X,T,Acc1,0).
rem_oth_acc(X,[_|T],Acc,0):- rem_oth_acc(X,T,Acc,1).

