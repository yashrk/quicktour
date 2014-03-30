-module(listrev).
-export([listrev/1]).

listrev([], Res) -> Res;
listrev([H|T], Res) -> listrev(T, [H|Res]).

listrev(L) -> listrev(L, []).
