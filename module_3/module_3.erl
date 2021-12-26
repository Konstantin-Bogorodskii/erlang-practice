-module(module_3).
-export([get_users/0, get_females/1, get_females_id_name/1, get_stats/1, clear/0]).

get_users() ->
  [
   {user, 1, "Bob", male, 22}, 
   {user, 2, "Kate", female, 11},
   {user, 3, "Igor", male, 18},
   {user, 4, "Dasha", female, 32},
   {user, 5, "Sveta", female, 12}
  ].

get_females(Users) ->
  F = fun({user, _, _, Gender, _}) -> Gender =:= female end,
  lists:filter(F, Users).

get_females_id_name(Users) ->
  lists:filtermap( fun({user, _, _, male, _}) -> false; ({user, Id, Name, female, _}) -> {true, {Id, Name}} end, Users ).

get_stats(Users) -> 
  lists:foldl(fun
          ({user, _, _, female, Age}, {NumFemale, NumMale, TotalUsers, TotalAge}) -> {NumFemale + 1, NumMale, TotalUsers + 1, TotalAge + Age};
          ({user, _, _, male, Age}, {NumFemale, NumMale, TotalUsers, TotalAge}) -> {NumFemale, NumMale + 1, TotalUsers + 1, TotalAge + Age} end, {0,0,0,0}, Users).

clear() ->
  io:format(os:cmd(clear)).
