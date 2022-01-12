1. Каждое объвление функци называется функциональным выражением. Функиональное выражение должно разделяться ; и вместе они формируют обявление функции

**_ Охраннные выражения "orelse / ; | andalso / ," _**

2. validate_age(Age) when Age > 18, Age < 60 -> true; Когда возраст больше 18 И( , - это как && в JS) возраст меньше 60.
   validate_age(Age) when Age > 18; Age < 60 -> true; Когда возраст больше 18 ИЛИ( ; - это как || в JS) возраст меньше 60.

Разница в том, что если в orelse и andalso в первой части выпадет ошибка, то вторая часть будет пропущена. И все cохранное выражение не сработает.

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

**_ Проп-лист / CRUD (Create, Read, Update, Delete) / Словарь Dict _**

PropList = [{key1, 'value1'}, {key2, 'value2'},{key3, 'value3'},{key4, 'value4'}].

1. proplists:get_value(key1, PropList). --> value1
   proplists:get_value(key4, PropList). --> value4
   proplists:get_value(key4123, PropList). --> undefined
   proplists:get_value(key4123, PropList, "default value"). --> default value

2. proplists:get_all_valuee(key1, PropList). --> Вернёт список из всех значений.
3. proplists:lookup(key1, PropList). --> {key1, 'value1'}
4. proplists:lookup_all(key1, PropList). --> Вернёт список из всех кортежей значений.
5. NewPropList = proplists:delete(key1, PropList). --> удалить первый ключ

================= Словарь Dict ==============

1. D3 = dict:new(). - создать новый словарь для хранения данных.
2. dict.store(key1, "value1", D3). - это основная функция, которая и добавляет новые значения и обновляет/модифицирует старые по ключу.
3. dict:to_list(D3). -преобразовать словарь в привычный вид, то есть к листу.
4. dict:from_list(PropList) - принемает проп-лист и возвращает словарь.
5. dict:fetch(key1, D3) - получить наше значение по ключу. Если не находит верент исключение.
6. dict:find(key1, D3) - получить ВЕСЬ наш кортеж по ключу. Если не находит верент error
7. dict:erase(key1, D3) - удалить первый ключ из словаря.
8. dict:append(key1, "value", D3) - Добавит по ключу значение как List/array, в которое потом ещще раз можно добавить другое значение как в массив.
9. dict:append_list(key1, ["value1", "value2", "value3"], D3) - Добавит по ключу значение как List/array, в которое потом ещще раз можно добавить другое значение как в массив.
10. dict:map(fun(Key, Value) -> string:to_upper(Value))
11. dict:filter(fun(Key, Value) -> Value =:= "value2" end, Dict).
12. dict:fold(fun(Key, Value, Acc) -> [Value | Acc] end, [], Dict). 2-й аргумент изначальное значение аккамулятора, 3-й сам словарь.

================= gb_tree / General Balanced Tree ==============

1. Tree = gb_trees:empty(). -> {0,nil} -> Создание дерева
2. Tree2 = gb_trees:insert(key1, "value1", Tree). -> {1,{key1,"value1",nil,nil}} -> Положить новый ключ со значением. В gb_tree НЕЛЬЗЯ класть один и тотже ключ дважды.
3. gb_trees:update(key1, "new-value", Tree) -> Обновить значение ключа. Если такого ключа нету, то мы получим исключение.
4. gb_trees:enter(key1, "more", Tree) -> Модифицирует ключ если он существует или же добавляет новый ключ если такого еще нет.
5. gb_trees:get(key1, Tree) -> Получить значение или если его нет , то исключение.
6. gb_trees:lookup(key1, Tree) -> Получить кортеж по ключу, или none если такого нету.
7. gb_trees:delete(key1, Tree) -> Удалить ключ, или получим исключение если такого нету.
8. gb_trees:delete_any(key1, Tree) -> Удалить ключ, или получим неизмененное дерево.
9. gb_trees:map(fun(Key, Value) -> string:to_upper(Value) end, Tree).
10. Тут нету filter, fold но можно сделать gb_trees:to_list(Tree).
