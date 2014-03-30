-module(output).
-export([server/0]).

server() ->
    receive
        X -> io:format("Received: ~s~n", [X])
    end,
    server().
