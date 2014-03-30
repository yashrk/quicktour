-module(fibmem).
-export([fib/1]).

memserver(Cache) ->
    receive
        {add, Arg, Res} ->
            NewCache = dict:append(Arg, Res, Cache),
            memserver(NewCache);
        {get, Pid, Arg} ->
            Result = dict:find(Arg, Cache),
            Pid ! Result,
            memserver(Cache)
    end.

add_value(Arg, Res) ->
    memserver ! {add, Arg, Res}.

get_value(Arg) ->
    memserver ! {get, self(), Arg},
    receive
        Res -> Res
    end.

fib(1) ->
    1;
fib(2) ->
    1;
fib(X) ->
    case whereis(memserver) of
        undefined ->
            register(memserver,
                     spawn(fun() ->
                               memserver(dict:new())
                           end)),
            fib(X);
        _Pid ->
            case get_value(X) of
                {ok, [Res]} -> Res;
                error ->
                    Res = fib(X - 2) + fib(X - 1),
                    add_value(X, Res),
                    Res
            end
    end.
