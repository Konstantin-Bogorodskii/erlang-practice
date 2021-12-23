-module(functions).

-export([head/1, compare_arguments/2, validate_age/1, is_enough/1]).

head([Head | _]) -> Head.  

% ======== Сравнить равны ли аргументы или нет! ========
compare_arguments(Num, Num) -> true;
compare_arguments(_, _) -> false.

validate_age(Age) when Age > 18,  Age < 60 -> true;
validate_age(_) -> false.

is_enough(Number) ->
  if 
    Number > 1, Number < 5 -> enough;
    true -> not_enough
  end.
 
