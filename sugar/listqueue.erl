-module(listqueue).
-export([enqueue/2, dequeue/1]).

-record(queue, {in=[], out=[]}).

enqueue(Q, New) ->
    #queue{in=[New|Q#queue.in], out=Q#queue.out}.

dequeue(Q) when (Q#queue.out =:= []) and (Q#queue.in =/= []) ->
    [Value|Rest] = lists:reverse(Q#queue.in),
    {
      ok,
      Value,
      #queue{out=Rest, in=[]}
    };
dequeue(Q) when Q#queue.out =:= [] ->
    {
      error,
      "Queue is empty"
    };
dequeue(Q) ->
    [Value|Rest] = Q#queue.out,
    {
      ok,
      Value,
      #queue{out=Rest, in=Q#queue.in}
    }.
