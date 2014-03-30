-module(rpg).
-export([forLevelN/1, availableWeapons/2]).

-include("weapon.hrl").

forLevelN(N) -> fun(X) -> X#weapon.level =< N end.

availableWeapons(Level, Weapons) ->
    lists:filter(fun(X) -> X#weapon.level =< Level end,
                 Weapons).
