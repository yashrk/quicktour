-module(mean).
-export([listmean/1]).

listmean(L) ->
    {Num, Summ} = lists:foldl(
                    fun(Next, {N, S}) -> {N+1, S+Next} end,
                    {0, 0},
                    L
                  ),
    Summ / Num.
