-module(listsumm).
-export([summ/1]).

summ([]) ->
    0;
summ([Head|Tail]) ->
    Head + summ(Tail).
