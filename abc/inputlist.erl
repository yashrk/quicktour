-module(inputlist).
-export([numbers/0]).

numbers() ->
    {ok, [Number]} = io:fread("> ", "~d"),
    case Number of
        0 -> [];
        _ -> [Number|numbers()]
    end.
