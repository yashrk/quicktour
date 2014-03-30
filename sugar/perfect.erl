-module(perfect).
-export([is_perfect/1]).

divisors(X) ->
    [Y || Y <- lists:seq(1, X div 2), X rem Y =:= 0 ].
is_perfect(X) -> lists:sum(divisors(X)) =:= X.
