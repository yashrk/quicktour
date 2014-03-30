-module(trees).
-export([print_tree/1]).

-record(node, {value, left=nil, right=nil}).

print_tree(nil) -> io:format("~n");
print_tree(Node) ->
    print_tree(Node#node.left),
    io:format("~w", [Node#node.value]),
    print_tree(Node#node.right).
