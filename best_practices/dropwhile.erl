-module(dropwhile).
-export([dropwhile/2]).

dropwhile(F, L) ->
    Test = fun(Elem, []) ->
                  case F(Elem) of
                      true -> [];
                      false -> [Elem]
                  end;
              (Elem, Acc) ->
                      Acc ++ [Elem]
           end,
    lists:foldl(Test, [], L).
