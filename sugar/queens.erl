-module(queens).
-export([queens/0]).

safe([], _Ver, _Hor, _Cur) ->
    true;
safe([Hor|_T], _Ver, Hor, _Cur) ->
    false;
safe([H|_T], Ver, Hor, Cur) when abs(Hor-H) =:= abs(Ver-Cur) ->
    false;
safe([_H|T], Ver, Hor, Cur) ->
    safe(T, Ver, Hor, Cur-1).

safe(Queens, Ver, Hor) -> safe(Queens, Ver, Hor, Ver-1).

safeCells(Queens, Ver) ->
    lists:filter(fun(X) -> safe(Queens, Ver, X) end,
                 lists:seq(1, 8)).

queens(Queens, 9) -> Queens;
queens(Queens, Ver) ->
    queens([[Pos|Prev] || 
             Prev <- Queens,
             Pos <- safeCells(Prev, Ver)], Ver+1).

queens() -> queens([[]], 1).
