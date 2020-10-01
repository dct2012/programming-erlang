-module(afile_server).
-export([start/1, loop/1]).

start(Dir) -> spawn(afile_server, loop, [Dir]).

full_path(Dir, File) -> filename:join(Dir, File).

loop(Dir) ->
	receive
		{Client, list_dir} ->
			Client ! {self(), file:list_dir(Dir)};
		{Client, {get_file, File}} ->
			Full = full_path(Dir, File),
			Client ! {self(), file:read_file(Full)};
		{Client, {put_file, File, Message}} ->
			Full = full_path(Dir, File),
			Client ! {self(), file:write_file(Full, Message)}
	end,
	loop(Dir).
