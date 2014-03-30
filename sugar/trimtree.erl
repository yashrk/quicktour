-module(trimtree).
-export([trim/2]).

-record(node, {value, left=nil, right=nil}).

trim(_Node, P, Fate) when Fate < P -> nil;
trim(Node, P, _Fate) ->
    #node {
      value = Node#node.value,
      left = trim(Node#node.left, P),
      right = trim(Node#node.right, P)
    }.

trim(nil, _P) -> nil;
trim(Node, P) -> 
    Fate = random:uniform(),
    trim(Node, P, Fate).
