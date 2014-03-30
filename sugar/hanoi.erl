-module(hanoi).
-export([solve/1]).

solve(0, _From, _To, _Aux) -> [];
solve(N, From, To, Aux) ->
    solve(N-1, From, Aux, To) ++
        [{From, To}] ++
        solve(N-1, Aux, To, From).

solve(N) -> solve(N, 1, 3, 2).
