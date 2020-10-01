-module(lib_misc).
-export([odds_and_evens2/1, odds_and_evens1/1, perms/1, pythag/1, qsort/1, test/0, for/3]).
-import(lists, [seq/2]).

test() ->
	[1, 4, 9, 16, 25, 36, 49, 64, 81, 100] = for(1, 10, fun(I) -> I * I end),
	[2, 6, 9, 14, 23, 27, 45, 61, 78, 82, 400] = qsort([23, 6, 2, 9, 27, 400, 78, 45, 61, 82, 14]),
	[{3, 4, 5}, {4, 3, 5}] = pythag(16),
	[{3, 4, 5}, {4, 3, 5}, {5, 12, 13}, {6, 8, 10}, {8, 6, 10}, {12, 5, 13}] = pythag(30),
	["123", "132", "213", "231", "312", "321"] = perms("123"),
	["cats", "cast", "ctas", "ctsa", "csat", "csta", "acts", "acst", "atcs", "atsc", "asct", "astc", "tcas", "tcsa", "tacs", "tasc", "tsca", "tsac", "scat", "scta", "sact", "satc", "stca", "stac"] = perms("cats"),
	{[1, 3, 5], [2, 4, 6]} = odds_and_evens1([1, 2, 3, 4, 5, 6]),
	{[5, 3, 1], [6, 4, 2]} = odds_and_evens2([1, 2, 3, 4, 5, 6]),
	test_worked.

for(Max, Max, F) -> [F(Max)];
for(I, Max, F)   -> [F(I) | for(I + 1, Max, F)].

qsort([]) -> [];
qsort([Pivot | T]) ->
	qsort([X || X <- T, X < Pivot])
	++ [Pivot] ++
	   qsort([X || X <- T, X >= Pivot]).

pythag(N) ->
	[{A, B, C} ||
		A <- seq(1, N),
		B <- seq(1, N),
		C <- seq(1, N),
   A + B + C =< N,
   A * A + B * B =:= C * C
	].

perms([])   -> [[]];
perms(List) -> [[Head | Tail] || Head <- List, Tail <- perms(List--[Head])].

odds_and_evens1(List) ->
	Odds = [X || X <- List, (X rem 2) =:= 1],
	Evens = [X || X <- List, (X rem 2) =:= 0],
	{Odds, Evens}.

odds_and_evens2(List) ->
	odds_and_evens_acc(List, [], []).
odds_and_evens_acc([Head | Tail], Odds, Evens) ->
	case (Head rem 2) of
		1 -> odds_and_evens_acc(Tail, [Head | Odds], Evens);
		0 -> odds_and_evens_acc(Tail, Odds, [Head | Evens])
	end;
odds_and_evens_acc([], Odds, Evens) ->
	{Odds, Evens}.
