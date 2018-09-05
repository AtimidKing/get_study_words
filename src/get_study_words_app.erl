-module(get_study_words_app).
-behaviour(application).

-export([start/2]).
-export([stop/1]).

start(_Type, _Args) ->
	get_study_words_sup:start_link().

stop(_State) ->
	ok.
