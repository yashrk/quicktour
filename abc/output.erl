-module(output).
-export([print_list/1]).

print_list([]) ->
    io:format("~n");
print_list([Head|Tail]) ->
    io:format("~w ", [Head]),
    print_list(Tail).

