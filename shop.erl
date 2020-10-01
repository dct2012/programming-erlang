-module(shop).
-export([test/0, cost/1, total/1]).
-import(lists, [sum/1]).

test() ->
	0 = total([]),
	21 = total([{milk, 3}]),
	75 = total([{pears, 6}, {milk, 3}]),
	123 = total([{oranges, 4}, {newspaper, 1}, {apples, 10}, {pears, 6}, {milk, 3}]),
	test_worked.

cost(oranges)   -> 5;
cost(newspaper) -> 8;
cost(apples)    -> 2;
cost(pears)     -> 9;
cost(milk)      -> 7.

total(List) -> sum([cost(Item) * Count || {Item, Count} <- List]).
