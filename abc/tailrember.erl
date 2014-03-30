-module(tailrember).
-export([rember/2]).

rember([], _M, Acc) -> lists:reverse(Acc);
rember([M|T], M, Acc) -> rember(T, M, Acc);
rember([H|T], M, Acc) -> rember(T, M, [H|Acc]).

rember(L, M) -> rember(L, M, []).
