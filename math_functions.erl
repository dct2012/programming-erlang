-module(math_functions).
-export([even/1, odd/1, filter/2, split/1, test/0, square_root/1]).
-import(math, [sqrt/1]).

test() ->
	true = even(2),
	false = even(3),
	true = odd(7),
	false = odd(12),
	[2, 4, 6] = filter(fun even/1, [1, 2, 3, 4, 5, 6]),
	[1, 3, 5] = filter(fun odd/1, [1, 2, 3, 4, 5, 6]),
	{[1, 3, 5], [2, 4, 6]} = split([1, 2, 3, 4, 5, 6]),
	test_worked.

even(X) -> X rem 2 =:= 0.
odd(X) -> X rem 2 =:= 1.

filter(F, L) -> [X || X <- L, F(X)].

split(L) -> {filter(fun odd/1, L), filter(fun even/1, L)}.

square_root(X) when X < 0 -> error({squareRootNegativeNumber, X});
square_root(X)            -> sqrt(X).