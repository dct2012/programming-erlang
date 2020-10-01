-module(math_functions).
-export([even/1, odd/1, test/0]).

test() ->
	true = even(2),
	false = even(3),
	true = odd(7),
	false = odd(12),
	test_worked.

even(X) -> X rem 2 =:= 0.
odd(X) -> X rem 2 =:= 1.
