-module(foldrev).
-export([rev/1]).

rev(L) ->
    lists:foldl(fun(T, H) -> [T|H] end, [], L).
