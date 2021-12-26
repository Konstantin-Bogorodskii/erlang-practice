-module(kata_7).
-export([middle/1]).

% ==== 1.-module(solution).
middle(String) ->
  if 
    length(String) rem 2 == 0 -> lists:sublist(String, round(length(String) / 2), 2);
    true -> lists:sublist(String, round(length(String) / 2), 1)
  end.