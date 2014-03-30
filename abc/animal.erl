%% -*- coding: utf-8 -*-
-module(animal).
-export([shell/0]).

shell() ->
    io:format("~s", ["Введите что-нибудь: "]),
    {ok, [A]} = io:fread("", "~ts"),
    io:format("~ts~n", [A]).

