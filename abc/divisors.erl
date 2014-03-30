-module(divisors).
-export([divisors/1]).

divisors(N, Limit, Limit) ->
    io:format("~w~n", [N]);
divisors(N, Limit, Current) when N rem Current =:= 0 ->
    io:format("~w ", [Current]),
    divisors(N, Limit, Current+1);
divisors(N, Limit, Current) ->
    divisors(N, Limit, Current+1).

divisors(N) ->
    Limit = (N div 2) + 1,
    divisors(N, Limit, 1).

