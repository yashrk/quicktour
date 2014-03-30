-module(colors).
-export([complementary/1]).

complementary(red) -> green;
complementary(orange) -> blue;
complementary(yellow) -> violet;
complementary(green) -> red;
complementary(blue) -> orange;
complementary(violet) -> yellow.
