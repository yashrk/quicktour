-module(foldseq).
-export([foldseq/4]).

foldseq(F, Max, Max, Acc) -> F(Acc, Max);
foldseq(F, Cur, Max, Acc) -> foldseq(F, Cur+1, Max, F(Acc, Cur)).
