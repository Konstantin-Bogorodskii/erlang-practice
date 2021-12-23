1. В Erlang есть возможнть преобразовывать один тип к другому
   Делается это при помощи модуля erlang.
   ----- Общий вид: erlang:type_to_type(value). ----

erlang:integer_to_list(54). -> "55"
erlang:list_to_integer("29"). -> 29
erlang:list_to_float("54.2"). -> 20.3
erlang:atom_to_list(true). -> "true"
erlang:bitstring_to_list(<<"hi_there">>). -> "hi_there"

2. В ерланг есть возможность проверить на тип данных. Нужно использовать встроенные функции
   is_atom/1, is_integer/1, is_bitstring/1

is_pid(value) - общий вид
