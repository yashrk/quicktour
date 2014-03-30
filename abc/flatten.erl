-module(flatten).
-export([flatten/1]).

flatten([], []) -> [];
flatten([H|T], []) -> flatten(T, H);
flatten(L, [H|T]) -> flatten([T|L], H);
flatten(L, Value) -> [Value|flatten(L, [])].

flatten(L) -> flatten(L, []).
