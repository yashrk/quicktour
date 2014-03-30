-module(common2).
-export([common/2]).

common(X, Y) -> [M1 || M1 <- X, M2 <- Y, M1 =:= M2].
