-module(permutations).
-export([first_n/1]).

permutations(_, [], Accum) -> Accum;
permutations(L, [RH|RT], Accum) ->
    CurPerm = [[RH|X] || X <- permutations(L ++ RT)],
    permutations([RH|L], RT, CurPerm ++ Accum).

permutations([H|[]]) -> [[H]];
permutations(L) -> permutations([], L, []).

first_n(To) -> permutations(lists:seq(1, To)).
