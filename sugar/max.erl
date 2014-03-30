-module(max).
-export([max/2]).

max(X,  Y) when X > Y -> X;
max(_X, Y) -> Y.
