-module(get_study_words_app).

-behaviour(application).

-export([start/2]).

-export([stop/1]).

start(_Type, _Args) ->
    Dispatch = cowboy_router:compile([{'_',
				       [{"/", hello_handler, []},
					{"/i", cowboy_static,
					 {priv_file, my_app,
					  "static/index.html"}}]}]),
    {ok, _} = cowboy:start_clear(my_http_listener,
				 [{port, 8080}],
				 #{env => #{dispatch => Dispatch}}),
    get_study_words_sup:start_link().

stop(_State) -> ok.
