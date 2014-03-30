-module(trees).
-export([tree2list/1]).

-record(node, {value, left=nil, right=nil}).

tree2list(nil) -> [];
tree2list(Node) ->
    tree2list(Node#node.left) ++
        [Node#node.value] ++
        tree2list(Node#node.right).
