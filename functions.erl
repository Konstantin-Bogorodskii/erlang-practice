-module(functions).

-export([head/1, compare_arguments/2, validate_age/1, is_enough/1, fac/1, get_list_length/1]).

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
 
% ======== Как посчитать факторил ========

fac(N) -> fac(N, 1).
fac(0, Acc) -> Acc;
fac(N, Acc) when N > 0 -> fac(N-1, N*Acc). 

% ======== Как посчитать кол-во элементов в списке ========

get_list_length(List) -> get_list_length(List, 0).
get_list_length([], Acc) -> Acc;
get_list_length([ _ | Rest], Acc) -> get_list_length(Rest, Acc + 1).

% ======== Как сделать замыкание ========
% 1. Mult = fun(Times) -> ( fun(X) -> X * Times end ) end.
% 2. Triple = Mult(3).
% 3. Triple(5). -> 15


% % ======== Как умножить все числа массива на 2 ========
% 1. List = [1,2,3,4,5].  
% 2. DoubleList = lists:map(fun(N) -> N * 2 end, List). -> [2,4,6,8,10] 