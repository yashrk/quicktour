-module(trees).
-compile(export_all).

-record(node, {value, left=nil, right=nil}).

generate(0) -> nil;
generate(L) ->
    #node{
        value=random:uniform(10),
        left=generate(L-1),
        right=generate(L-1)
    }.

tree2list(nil) -> [];
tree2list(Node) ->
    tree2list(Node#node.left) ++
        [Node#node.value] ++
        tree2list(Node#node.right).
