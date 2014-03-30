-module(maptree).
-export([maptree/2]).

-record(node, {value, left=nil, right=nil}).

maptree(nil, _) -> nil;
maptree(Node, F) ->
    #node {
         value = F(Node#node.value),
         left = maptree(Node#node.left, F),
         right = maptree(Node#node.right, F)
    }.
