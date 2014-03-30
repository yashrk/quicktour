-module(rdropwhile).
-export([dropwhile/2]).

findpos(_F, [], _Pos) ->
    0;
findpos(F, [H|T], Pos) ->
    case F(H) of
        true -> Pos;
        false -> findpos(F, T, Pos+1)
    end.

findpos(F, L) -> findpos(F, L, 1).

dropwhile(F, L) ->
    Pos = findpos(fun(X) -> not F(X) end, L),
    Trim = fun(_Elem, {[], _Cur, 0}) ->
                   [];
              (Elem, {Acc, First, First}) ->
                   [Elem|Acc];
              (Elem, {Acc, Cur, First}) ->
                   {[Elem|Acc], Cur-1, First};
              (_Elem, Acc) ->
                   Acc
           end,
    lists:foldr(Trim, {[], length(L), Pos}, L).
