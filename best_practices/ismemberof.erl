-module(ismemberof).
-export([ismemberof/1]).

ismemberof(L) ->
    fun(X) -> lists:member(X, L) end.
