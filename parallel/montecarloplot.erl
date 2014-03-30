-module(montecarloplot).
-export([area_of_circle/0, get_current/1]).

next_step(0, 0, OutputFile) ->
    X = (random:uniform() * 2.0) - 1.0,
    Y = (random:uniform() * 2.0) - 1.0,
    if
        (X * X) + (Y * Y) =< 1 -> 
            next_step(1, 0, OutputFile);
        true ->
            next_step(0, 1, OutputFile)
    end;
next_step(Inside, Outside, OutputFile) ->
    receive
        {Pid, get_current} -> Pid ! {Inside, Outside};
        _ -> io:format("Malformed message~n")
    after 50 ->
        true
    end,
    % Random numbers from -1.0 to 1.0
    X = (random:uniform() * 2.0) - 1.0,
    Y = (random:uniform() * 2.0) - 1.0,
    io:fwrite(OutputFile, "~w, ~w, ~w, ~w, ~w~n",
              [X, Y, Inside, Outside, (Inside / (Inside + Outside)) * 4]),
    if
        (X * X) + (Y * Y) =< 1 -> 
            next_step(Inside+1, Outside, OutputFile);
        true ->
            next_step(Inside, Outside+1, OutputFile)
    end.

area_of_circle() ->
    {ok, OutputFile} = file:open("points.csv", [write, binary]),
    next_step(0, 0, OutputFile).

get_current(Pid) ->
    Pid ! {self(), get_current},
    receive
        {Inside, Outside} ->
            {ok, (Inside / (Inside + Outside)) * 4};
        Other ->
            {error, Other}
    end.
