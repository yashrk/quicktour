-module(erlcast).
-compile(export_all).

server(UserList) ->
    receive
        {pid, Pid} ->
            server([Pid|UserList]);
        {message, Message} ->
            [Pid ! Message || Pid <- UserList],
            server(UserList)
    end.

start() ->
    register(castserver, spawn(fun() -> server([]) end)).

register(Node) ->
    {castserver, Node} ! {pid, self()}.

send(Node, Message) ->
    {castserver, Node} ! {message, Message}.

wait() ->
    receive
        X -> io:format("~s~n", [X])
    end.
