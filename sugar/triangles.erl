-module(triangles).
-import(lists, [seq/2]).
-import(math, [sqrt/1]).
-export([int_triangles/2]).

i_hyp(A, B) ->
    sqrt(A * A + B * B) == trunc(sqrt(A * A + B * B)).

int_triangles(F, T) ->
    [{X, Y} || X <- seq(F, T), Y <- seq(F, T), i_hyp(X, Y)].
