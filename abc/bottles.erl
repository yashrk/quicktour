-module(bottles).
-export([bottles/0]).

bottles(0) ->
    io:format("No more bottles of beer on the wall, "),
    io:format("no more bottles of beer.~n"),
    io:format("Go to the store and buy some more, "),
    io:format("99 bottles of beer on the wall.~n");
bottles(1) ->
    io:format("1 bottle of beer on the wall, "),
    io:format("1 bottle of beer.~n"),
    io:format("Take one down and pass it around, "),
    io:format("no more bottles of beer on the wall.~n"),
    bottles(0);
bottles(N) ->
    NewN = N - 1,
    io:format("~w bottles of beer on the wall, "),
    io:format("~w bottles of beer.~n", [N, N]),
    io:format("Take one down and pass it around, "),
    io:format("~w bottles of beer on the wall.~n~n", [NewN]),
    bottles(NewN).

bottles() ->
    bottles(99).

