%% This file is part of leptus, and released under the MIT license.
%% See LICENSE for more information.

-module(pt3).
-compile({parse_transform, leptus_pt}).

-export([start/0]).
-export([stop/0]).

%% leptus callbacks
-export([init/3]).
-export([get/3]).
-export([put/3]).
-export([post/3]).
-export([delete/3]).
-export([terminate/3]).

start() ->
    leptus:start_listener(http, [{'_', [{?MODULE, state0}]}]).

stop() ->
    leptus:stop_listener(http).

init(_Route, _Req, State) ->
    State = state0,
    {ok, state1}.

get("/", _, State) ->
    State = state1,
    {<<>>, state2}.

put("/old", _, State) ->
    State = state1,
    {200, <<>>, state3}.

post("/new", _, State) ->
    State = state1,
    {201, <<>>, state4}.

delete("/old", _, State) ->
    State = state1,
    {204, <<>>, State}.

terminate(_Reason, _Req, State) ->
    case State of
        state1 -> ok;
        state2 -> ok;
        state3 -> ok;
        state4 -> ok
    end.
