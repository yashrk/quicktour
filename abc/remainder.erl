-module(remainder).
-export([remainder/2]).

remainder(N, M) when N >= M -> remainder(N - M, M);
remainder(N, _) -> N.
