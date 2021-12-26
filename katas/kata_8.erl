-module(kata_8).
-export([lovefunc/2]).


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

% === 4 Expressions Matter  ===