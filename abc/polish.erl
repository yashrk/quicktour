-module(polish).
-export([calculate/1]).

calculate([], [Top]) -> Top;
calculate(["+"|Rest], [Op1|[Op2|Stack]]) ->
    calculate(Rest, [Op1 + Op2|Stack]);
calculate(["-"|Rest], [Op1|[Op2|Stack]]) ->
    calculate(Rest, [Op2 - Op1|Stack]);
calculate(["*"|Rest], [Op1|[Op2|Stack]]) ->
    calculate(Rest, [Op1 * Op2|Stack]);
calculate(["/"|Rest], [Op2|[Op1|Stack]]) ->
    calculate(Rest, [Op1 / Op2|Stack]);
calculate([Number|Rest], Stack) ->
    calculate(Rest, [Number|Stack]).

calculate(L) -> calculate(L, []).
