-module(perfect).
-export([is_perfect/1]).

divisors(_, 1) -> [1];
divisors(N, M) when N rem M =:= 0 ->
    [M|divisors(N, M-1)];
divisors(N, M) ->
    divisors(N, M-1).

divisors(1) -> [1];
divisors(N) -> divisors(N, N div 2).

is_perfect(N) -> N =:= lists:sum(divisors(N)).
