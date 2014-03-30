-module(foldfac).
-export([fac/1]).

fac(N) ->
    lists:foldr(fun(A, B) -> A*B end, 1, lists:seq(1, N)).
