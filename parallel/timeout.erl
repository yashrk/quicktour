-module(timeout).
-export([calcserver/0, call/2]).

calcserver() ->
    receive
        {Client, {'+', A, B}} ->
            Client ! {ok, A + B},
            calcserver();
        {Client, {'-', A, B}} ->
            Client ! {ok, A - B},
            calcserver();
        {Client, {'*', A, B}} ->
            Client ! {ok, A * B},
            calcserver();
        {Client, {'/', A, B}} ->
            Client ! {ok, A / B},
            calcserver();
        {Client, _} ->
            Client ! {error, "Malformed message"},
            calcserver();
        {BadMessage} ->
            io:format("Error: Malformed message \"~s\"~n",
                      [BadMessage]),
            calcserver()
    end.

call(Pid, Command) ->
    Pid ! {self(), Command},
    receive
        Answer -> Answer
    after 2000 ->
        io:format("Server error~n")
    end.
