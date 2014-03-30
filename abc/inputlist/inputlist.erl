-module(inputlist).
-export([inputlist/0]).

inputlist(0) ->
    [];
inputlist(N) ->
    {ok, [Number]} = io:fread("> ", "~d"),
    [N|inputlist(Number)].

inputlist() ->
    {ok, [Number]} = io:fread("> ", "~d"),
    inputlist(Number).

