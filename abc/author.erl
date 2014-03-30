-module(author).
-export([hello/0]).

hello() ->
    {ok, [Username]} = io:fread("Enter your name: ", "~s"),
    case Username of
        "Yuriy" -> io:format("Hello, author!~n");
        _ -> io:format("Hello, ~s!~n", [Username])
    end.

         
