-module(geometry).
-export([test/0, area/1, perimeter/1, volume/1]).
-import(math, [pi/0, pow/2]).

test() ->
	4.0 = squared(2),
	8.0 = cubed(2),
	12 = area({rectangle, 3, 4}),
	12 = area({parallelogram, 3, 4}),
	144.0 = area({square, 12}),
	50.26548245743669 = area({circle, 4}),
	15.0 = area({triangle, 5, 6}),
	16 = perimeter({square, 4}),
	18 = perimeter({rectangle, 4, 5}),
	27.0 = volume({cube, 3}),
	33.510321638291124 = volume({sphere, 2}),
	tests_worked.

squared(Num) -> pow(Num, 2).
cubed(Num) -> pow(Num, 3).

area({square, Side})                 -> squared(Side);
area({rectangle, Width, Height})     -> Width * Height;
area({circle, Radius})               -> pi() * squared(Radius);
area({triangle, Width, Height})      -> (Width * Height) / 2;
area({parallelogram, Width, Height}) -> Width * Height.

perimeter({square, Side})             -> Side * 4;
perimeter({rectangle, Width, Height}) -> Width * 2 + Height * 2.

volume({cube, Side})     -> cubed(Side);
volume({sphere, Radius}) -> (4 / 3) * pi() * cubed(Radius).