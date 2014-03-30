-module(divisor).
-export([is_divisor/2]).

is_divisor(N, M) when N rem M =:= 0 -> true;
is_divisor(_, _) -> false.
