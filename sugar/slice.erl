-module(slice).
-export([slice/3]).

slice([H|_T], _From, To, To) ->
    [H];
slice([_H|T], From, To, Cur) when Cur < From ->
    slice(T, From, To, Cur+1);
slice([H|T], From, To, Cur) ->
    [H|slice(T, From, To, Cur+1)].

slice(L, From, To) -> slice(L, From, To, 0).
