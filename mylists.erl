-module(mylists).
-export([test/0, sum/1, map/2]).

test() ->
	14 = sum([1, 3, 10]),
	[2, 4, 6, 8, 10] = map(fun(X) -> 2 * X end, [1, 2, 3, 4, 5]),
	[1, 4, 9, 16, 25] = map(fun(X) -> X * X end, [1, 2, 3, 4, 5]),
	test_worked.

sum([H | T]) -> H + sum(T);
sum([])      -> 0.

map(_, [])      -> [];
map(F, [H | T]) -> [F(H) | map(F, T)].