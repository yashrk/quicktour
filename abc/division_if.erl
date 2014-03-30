-module(division_if).
-export([safe_division/2]).

safe_division(N, M) ->
    if
        M == 0 -> undefined;
        true   -> N / M
    end.

