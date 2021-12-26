1. Каждое объвление функци называется функциональным выражением. Функиональное выражение должно разделяться ; и вместе они формируют обявление функции

**_ Охраннные выражения "orelse / ; | andalso / ," _**

2. validate_age(Age) when Age > 18, Age < 60 -> true; Когда возраст больше 18 И( , - это как && в JS) возраст меньше 60.
   validate_age(Age) when Age > 18; Age < 60 -> true; Когда возраст больше 18 ИЛИ( ; - это как || в JS) возраст меньше 60.

Разница в том, что если в orelse и andalso в первой части выпадет ошибка, то вторая часть будет пропущена. И все охранное выражение не сработает.

**_ if / true _**

**_ Анонимные функции(Funs) _**
funs ("фаны") это “анонимные” функции. Они называются так, потому что у них нет имени.

1. Double = fun(Num) -> Num \* 2 end. !!! Заканчивать на end. или будет ошибка !!!
   #Fun<erl_eval.44.65746770>
2. Double(4). -> 8

!!! Анонимная функция может принимать любое количество аргументов. !!!

**_ Guard / Гард _**

check*user({user, *, Gender, Age}) when Gender =:= female, Age > 18 -> woman;
check*user({user, *, Gender, Age}) when Gender =:= male, Age > 18 -> man;
check*user({user, *, Gender, Age}) when Gender =:= female, Age < 14, Age > 5 -> girl;

check*user({user, *, Gender, Age})
when Gender =:= female, Age > 18;
when Gender =:= male, Age > 18
-> student;

**_ Cluase / Клоз _**
sum(List) -> sum(List, 0).

sum([], Acc) -> Acc; - это клоз
sum([Num | Rest], Acc) -> sum(Rest, Acc + Num).

**_ Проп-лист _**

PropList = [{key1, 'value1'}, {key2, 'value2'},{key3, 'value3'},{key4, 'value4'}].

1. proplists:get_value(key1, PropList). --> value1
   proplists:get_value(key4, PropList). --> value4
   proplists:get_value(key4123, PropList). --> undefined
   proplists:get_value(key4123, PropList, "default value"). --> default value

2. proplists:get_all_valuee(key1, PropList). --> Вернёт список из всех значений.
3. proplists:lookup(key1, PropList). --> {key1, 'value1'}
4. proplists:lookup_all(key1, PropList). --> Вернёт список из всех кортежей значений.
