-module(common_members).
-export([common_members/2]).

common_members(L1, L2) ->
    [X || X <- L1, lists:member(X, L2)].
