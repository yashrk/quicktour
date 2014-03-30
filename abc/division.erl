-module(division).
-export([safe_division/2]).

safe_division(_, 0) -> undefined;
safe_division(N, M) -> N / M.

