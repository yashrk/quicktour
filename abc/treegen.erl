-module(treegen).
-export([generate/1]).

-record(node, {value, left=nil, right=nil}).

generate(0) -> nil;
generate(L) ->
    #node{
        value=random:uniform(10),
        left=generate(L-1),
        right=generate(L-1)
    }.
