-module(add).
-export([addN/1]).

addN(N) ->
    fun(X) -> X + N end.
