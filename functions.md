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