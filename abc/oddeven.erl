-module(oddeven).
-export([oddeven/1]).

oddeven(N) ->
    case N rem 2 of
        0  -> "Even";
        1  -> "Odd";
        -1 -> "Odd"
    end.
