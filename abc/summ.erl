-module(summ).
-export([summ/0]).

summ(Summ, 0) -> Summ;
summ(Summ, Value) ->
    NewSumm = Summ + Value,
    {ok, [NewValue]} = io:fread("Enter a number: ", "~d"),
    summ(NewSumm, NewValue).

summ() ->
    {ok, [Value]} = io:fread("Enter a number: ", "~d"),
    summ(0, Value).

    
