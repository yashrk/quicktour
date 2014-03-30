-module(number_input).
-export([read_numbers/0]).

read_numbers(0) -> ok;
read_numbers(Previous) ->
    {ok, Next} = io:read("> "),
    read_numbers(Next),
    io:format("~w~n", [Previous]).

read_numbers() ->
    {ok, Next} = io:read("> "),
    read_numbers(Next).

