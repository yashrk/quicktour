-module(mylists).
-export([foldr1/2, foldl1/2]).

foldr1(_, [X]) ->
    X;
foldr1(F, [H|T]) ->
    F(H, foldr1(F, T)).

foldl1(_, Acc, []) ->
    Acc;
foldl1(F, Acc, [H|T]) ->
    foldl1(F, F(Acc, H), T).

foldl1(F, [H|T]) ->
    foldl1(F, H, T).
