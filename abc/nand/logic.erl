-module(logic).
-export([nand/2]).

nand(true, true) -> false;
nand(false, true) -> true;
nand(true, false) -> true;
nand(false, false) -> true.
