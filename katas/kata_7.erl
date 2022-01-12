-module(kata_7).
-export([middle/1, pairs/1, max_product/2, extra_perfect/1]).

% ==== middle ====
middle(String) ->
  if 
    length(String) rem 2 == 0 -> lists:sublist(String, round(length(String) / 2), 2);
    true -> lists:sublist(String, round(length(String) / 2), 1)
  end.

% ==== Simple consecutive pairs ====

pairs(List) -> pairs(List, 0).

pairs([A, B | Tail], Sum) when abs(A - B) == 1 -> pairs(Tail, Sum + 1);
pairs([_, _ | Tail], Sum) -> pairs(Tail, Sum);
pairs(_, Sum) -> Sum.

% ==== Product Of Maximums Of Array (Array Series #2) ====
max_product(A, S) -> lists:foldl(fun(X, Prod) -> X * Prod end, 1,lists:nthtail(length(A) - S ,lists:sort(A))).

% ==== Extra Perfect Numbers ====

extra_perfect(N) ->  extra_perfect(N) -> lists:seq(1, N, 2).
% extra_perfect(8) -> 1, 3, 5, 7