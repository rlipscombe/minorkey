-module(index_handler).
-export([init/2]).

init(Req, Opts) ->
    Headers = [{<<"content-type">>, <<"text/html">>}],
    {ok, Body} = index_dtl:render(),
    Req2 = cowboy_req:reply(200, Headers, Body, Req),
    {ok, Req2, Opts}.
