-module(number_input).
-export([read_numbers/0]).

read_numbers() ->
    {ok, Number} = io:read("> "),
    case Number of
        0 -> ok;
        _ -> read_numbers()
    end,
    io:format("~w~n", [Number]).
