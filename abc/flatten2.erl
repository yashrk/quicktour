-module(flatten2).
-export([flatten/1]).

flatten([]) -> [];
flatten([H]) -> flatten(H);
flatten([H|T]) -> flatten(H) ++ flatten(T);
flatten(I) -> [I].
