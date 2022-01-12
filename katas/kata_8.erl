-module(kata_8).
-export([lovefunc/2, check_for_factor/2, century/1, expression_matter/3]).


% === 1 задача ===
lovefunc(Flower1, Flower2) -> Flower1 rem 2 /= Flower2 rem 2.

% === 2 Century From Year  ===

century(Year) ->
  Century = round(math:floor(Year / 100)),
  NewYear = Year / 100,
  if 
     Century == NewYear -> Century;
     Century >= 1 -> Century + 1;
     true -> 1
  end.

  % !!! Лучшее решенее !!! century(Year) ->  ceil(Year / 100).

% === 3 Expressions Matter  ===

expression_matter(A, B, C) ->
  lists:max([
    A + B + C,
    A + B * C,
    A * B + C,
    A * B * C,
    A * (B + C),
    (A + B) * C
  ]).

% === 4 Grasshopper - Check for factor  ===

check_for_factor(Base, Factor) -> 
  if 
    Base rem Factor =:= 0 -> true;
    true -> false
  end.

% === Grasshopper - Summation ===
  
summation(N) -> summation(N, 0).
summation(N, Acc) when N =:= 0 -> Acc;
summation(N, Acc) -> summation(N - 1, Acc + N).

% !!!  summation(N) -> lists:sum(lists:seq(0, N)). !!!

 