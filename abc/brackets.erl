-module(brackets).
-export([is_valid_string/1]).

is_valid_string(<<>>, []) -> true;
is_valid_string(<<>>, _) -> false;
is_valid_string(<<"(", StrT/binary>>, Stack) ->
    is_valid_string(StrT, ["("|Stack]);
is_valid_string(<<"[", StrT/binary>>, Stack) ->
    is_valid_string(StrT, ["["|Stack]);
is_valid_string(<<"<", StrT/binary>>, Stack) ->
    is_valid_string(StrT, ["<"|Stack]);
is_valid_string(<<")", StrT/binary>>, ["("|StackT]) ->
    is_valid_string(StrT, StackT);
is_valid_string(<<"]", StrT/binary>>, ["["|StackT]) ->
    is_valid_string(StrT, StackT);
is_valid_string(<<">", StrT/binary>>, ["<"|StackT]) ->
    is_valid_string(StrT, StackT);
is_valid_string(_, _) -> false.

is_valid_string(S) -> is_valid_string(list_to_binary(S), []).
