-module(trimtree).
-export([trim/2]).

-record(node, {value, left=nil, right=nil}).

trim(nil, _P) -> nil;
trim(Node, P) -> 
    Fate = random:uniform(),
    if
        Fate < P ->
            nil;
        true ->
            #node {
                value = Node#node.value,
                left = trim(Node#node.left, P),
                right = trim(Node#node.right, P)
            }
    end.        
