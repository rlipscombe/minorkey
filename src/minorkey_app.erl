-module(minorkey_app).
-behaviour(application).

-export([start/2]).
-export([stop/1]).

start(_Type, _Args) ->
    Routes = [
              {'_', [
                     {"/", index_handler, []}
                    ]}
             ],
    Dispatch = cowboy_router:compile(Routes),
    {ok, _} = cowboy:start_http(http, 100,
                                [{port, 8021}],
                                [{env, [{dispatch, Dispatch}]}]),
    minorkey_sup:start_link().

stop(_State) ->
    ok.
