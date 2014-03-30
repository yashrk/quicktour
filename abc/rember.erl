-module(rember).
-export([rember/2]).

rember([], _) -> [];
rember([X|Tail], X) -> rember(Tail, X);
rember([Head|Tail], X) -> [Head|rember(Tail, X)].
