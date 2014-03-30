-module(power).
-export([power/2]).

power(_, 0) -> 1;
power(N, M) -> N * power(N, M-1).
