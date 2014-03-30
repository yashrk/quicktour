-module(multiplication).
-export([table/0]).

table() ->
    [io:format("~w * ~w = ~w~n", [X, Y, X*Y]) ||
     X <- lists:seq(2, 9), Y <- lists:seq(2, 9)].
