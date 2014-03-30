-module(logic).
-export([nand/2, my_not/1, my_and/2, my_or/2]).

nand(true, true) -> false;
nand(false, true) -> true;
nand(true, false) -> true;
nand(false, false) -> true.

my_not(X) -> nand(X, X).

my_and(X, Y) -> my_not(nand(X, Y)).

my_or(X, Y) -> nand(my_not(X), my_not(Y)).
