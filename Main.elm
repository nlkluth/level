module Main (..) where

import Html exposing (..)
import Effects exposing (Effects, Never)
import Task
import StartApp
import Actions exposing (..)
import Models exposing (..)
import Update exposing (..)
import View exposing (..)
import Routing
import Heroes.Effects


init : ( AppModel, Effects Action )
init =
  let
    fxs = [ Effects.map HeroesAction Heroes.Effects.fetchAll ]
    fx = Effects.batch fxs
  in
    ( Models.initialModel, fx )


app =
  StartApp.start
    { init = init
    , update = update
    , view = view
    , inputs = [ routerSignal ]
    }


main =
  app.html


routerSignal : Signal Action
routerSignal =
  Signal.map RoutingAction Routing.signal


port tasks : Signal (Task.Task Never ())
port tasks =
  app.tasks


port routeRunTask : Task.Task () ()
port routeRunTask =
  Routing.run
