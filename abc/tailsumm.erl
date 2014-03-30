-module(tailsumm).
-export([summ/1]).

summ([], Summ) -> Summ;
summ([H|T], Summ) -> summ(T, H+Summ).

summ(L) -> summ(L, 0).
