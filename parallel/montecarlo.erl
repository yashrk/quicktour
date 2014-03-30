-module(montecarlo).
-export([area_of_circle/0, get_current/1]).

next_step(Inside, Outside) ->
    receive
        {Pid, get_current} -> Pid ! {Inside, Outside};
        _ -> io:format("Malformed message~n")
    after 50 ->
        true
    end,
    % Random numbers from -1.0 to 1.0
    X = (random:uniform() * 2.0) - 1.0,
    Y = (random:uniform() * 2.0) - 1.0,
    if
        (X * X) + (Y * Y) =< 1 -> 
            next_step(Inside+1, Outside);
        true ->
            next_step(Inside, Outside+1)
    end.

area_of_circle() ->
    next_step(0, 0).

get_current(Pid) ->
    Pid ! {self(), get_current},
    receive
        {Inside, Outside} ->
            {ok, (Inside / (Inside + Outside)) * 4};
        Other ->
            {error, Other}
    end.
