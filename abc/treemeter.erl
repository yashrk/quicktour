-module(treemeter).
-export([measure/2]).

-record(node, {value, left=nil, right=nil}).

measure(nil,   _N, _Cur) -> 0;
measure(_Node, N,  N)    -> 1;
measure(Node,  N,  Cur)  ->
    measure(Node#node.left, N, Cur+1) + 
        measure(Node#node.right, N, Cur+1).

measure(T, N) -> measure(T, N, 1).
