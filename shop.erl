-module(shop).

-export([total_value/1]).

cost(oranges) -> 5;
cost(newspaper) -> 8;
cost(apples) -> 2;
cost(pears) -> 9;
cost(milk) -> 7.

total_value([{What, N} | Tail]) -> cost(What) * N + total_value(Tail);
total_value([]) -> 0. 