-module(foldmax).
-export([listmax/1]).

listmax([H|T]) -> lists:foldl(fun max/2, H, T).
