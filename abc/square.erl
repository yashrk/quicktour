-module(square).
-export([square/1]).

square(X) ->
    io:format("X=~w~n", [X]),
    X * X.
