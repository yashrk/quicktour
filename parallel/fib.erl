-module(fib).
-export([fib/1, fibmem/2]).

fib(1) ->
    1;
fib(2) ->
    1;
fib(X) ->
    fib(X - 2) + fib(X - 1).

fibmem(1, Cache) ->
    {1, Cache};
fibmem(2, Cache) ->
    {1, Cache};
fibmem(N, Cache) ->
    case dict:find(N, Cache) of
        {ok, [Res]} ->
            {Res, Cache};
        error ->
            {X, TmpCache} = fibmem(N - 1, Cache),
            {Y, _} = fibmem(N - 2, TmpCache),
            Res = X + Y,
            NewCache = dict:append(N, Res, TmpCache),
            {Res, NewCache}
    end.
