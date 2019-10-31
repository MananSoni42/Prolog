%% Problem 1
% V - Vertices

equals(A,A).
member(X,[X|_]).
member(X,[_|T]):-
    member(X,T).

vertices([p,q,r]).
weight(p,q,20).
weight(q,r,5).
weight(r,p,10).

findPath(Start,End,Path,Length):-
	vertices(Ver),
    format('~w~n',[Ver]),
    dfs(End,Start,0,[Start],Ver,[Start],Path,Length).

dfs(A,A,B,C,_,_,C,B).
dfs(End,Curr,Len,Path,[VH|VT],Used,P1,L1):-
    format('~w|~w|~w|~w~n',[Curr,VH,VT,Used]),
    member(VH,Used) ->  
	    format('~w~n',[1]),
    	dfs(End,Curr,Len,Path,VT,Used,P1,L1); 
            weight(Curr,VH,L) ->
                Len1 is Len + L,
                append(Path,[VH],Path1),
                append(Used,[VH],Used1),
			    format('~w~n',[2]),
                dfs(End,VH,Len1,Path1,V,Used1,P1,L1);
    				weight(V_H,Curr,L) ->
    			    	format('~w~n',[3]),
                        Len1 is Len + L,
                        append(Path,[VH],Path1),
                        append(Used,[VH],Used1),
                        vertices(V),
                        dfs(End,VH,Len1,Path1,V,Used1,P1,L1);
	    			    	format('~w~n',[4]),
                            dfs(End,Curr,Len,Path,VT,Used,P1,L1).

