-module(lists_main).

-export([get_users/0, get_females/2, split_by_age/1]).
% get_females/2 это арность нашей функий, то сколько аргументов мы переаем в функцию. в get_users - 0, в get_females - 2.


%  ========= Как сделать фильтрацию списка в Erlang =========
% 1. Создать функцию возвращающую список пользователей, где каждый пользователь это отдельный кортеж
get_users() ->
  [
   {user, 1, "Bob", male, 22}, 
   {user, 2, "Kate", female, 11},
   {user, 3, "Igor", male, 18},
   {user, 4, "Dasha", female, 32},
   {user, 5, "Sveta", female, 12}
  ].

% 2. Создать функцию, которая если наш список закончился будет возвращать аккамулятор.
get_females([], Acc) -> lists:reverse(Acc);

% !!! Несмотря на то, что у нас две функции с одним названием проблем это не вызовет, т.к у нас отработает паттерн матчинг и сверит наши аргументы функции а именно первый. Если наш список пусть то отработает get_females([], Acc), если нет то get_females([User | Rest], Acc). !!!
% Если у функции два тела, то после первой надо поставить ; а после второй .

% 3. Создать функцию, которая будет фильтровать список пользователей по полу.
get_females([User | Rest], Acc) -> 
% [User | Rest] - берём первого пользователя и остаток.
  case User of
    % Мы пробегаемся по всем юзерам
    {user, _, _, male} -> get_females(Rest, Acc);
    % Поля с именем и id нам не нужны поэтому мы их отбрасываем. Если наш пол male, то мы рекурсивно вызываем get_females(С остатком, в аккамулятор ничего недобавляем
    {user, _, _, female} -> get_females(Rest, [User | Acc])
    % Если наш пол female, то мы заново рекурсивно вызываем get_females и добавляем к аккамулятору нашего User. get_females(Rest, [User | Acc])
  end.

% 4. c("main.erl").
% 5. Users = main:get_users().
% 6. Females = main:get_females(Users, []).

% ======= Сортировка  по возрасту ==========
split_by_age(Users) -> split_by_age(Users, {[], []}).

split_by_age([], {Acc1, Acc2}) -> {lists:reverse(Acc1), lists:reverse(Acc2)};

split_by_age([User | Rest], {Acc1, Acc2}) -> 
  {user, _, _, _, Age} = User,
  if 
    Age < 18 -> split_by_age(Rest, {[User | Acc1], Acc2});
    % а иначе
    true -> split_by_age(Rest, {Acc1, [User | Acc2]})
  end.

% ======= Фильтрация списка на нечетные ==========

% 1. Even = fun(X) -> X rem 2 =:= 0 end. 
% 2. List = [1,2,3,4,5,6,7,8].
% 3. EvenList = lists:filter(Even, List). -> [2,4,6,8] 
