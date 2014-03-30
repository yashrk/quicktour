-module(myseq).
-export([foldseq/3]).

foldseq(F, Acc, Finish, Finish) ->
    F(Acc, Finish);
foldseq(F, Acc, Cur, Finish) ->
    foldseq(F, F(Acc, Cur), Cur+1, Finish).

foldseq(F, Start, Finish) ->
    foldseq(F, Start, Start+1, Finish).
