-module(foldrrev).
-export([rev/1]).

rev(L) ->
    lists:foldr(fun(X, Y) -> Y ++ [X] end, [], L).
