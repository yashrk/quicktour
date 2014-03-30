-module(erlchat).
-compile(export_all).

server(UserList) ->
    receive
        {User, connect} ->
            server([User|UserList]);
        {User, disconnect} ->
            server(UserList -- [User]);
        {{Pid, Author}, Message} ->
            [User ! {Author, Message} || {User, _Name} <- UserList -- [{Pid, Author}]],
            server(UserList)
    end.

start() ->
    register(chatserver, spawn(fun() -> server([]) end)).

update() ->
    receive
        {Author, Message} ->
            io:format("~s> ~s~n", [Author, Message])
    after 1000 ->
        ok
    end.

send(Node, Name) ->
    {ok, [Message]} = io:fread("Enter the message: ", "~s"),
    {chatserver, Node} ! {{self(), Name}, Message}.

disconnect(Node, Name) ->
    {chatserver, Node} ! {{self(), Name}, disconnect}.

cli(Node, Name) ->
    {ok, [Command]} = io:fread("> ", "~s"),
    case Command of
        "send" -> send(Node, Name), cli(Node, Name);
        "update" -> update(), cli(Node, Name);
        "exit" -> disconnect(Node, Name)
    end.

shell(Node, Name) ->
    {chatserver, Node} ! {{self(), Name}, connect},
    cli(Node, Name).
