-module(module_4).
-export([fac/1, sum/1]).

fac(1) -> 1;
fac(N) -> N * fac(N-1).

sum(List) -> sum(List, 0).
sum([], Acc) -> Acc;
sum([Num | Rest], Acc) -> sum(Rest, Acc + Num).