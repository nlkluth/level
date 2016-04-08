module Update (..) where

import Effects exposing (Effects)
import Models exposing (..)
import Actions exposing (..)
import Heroes.Update
import Routing


update : Action -> AppModel -> ( AppModel, Effects Action )
update action model =
  case action of
    HeroesAction subAction ->
      ( model, Effects.none )

      --let
      --  updateModel =
      --    { heroes = model.heroes
      --    }

      --  ( updatedHeroes, fx ) =
      --    Heroes.Update.update subAction updateModel
      --in
      --  ( { model | heroes = updatedHeroes }, Effects.map HeroesAction fx )

    NoOp ->
      ( model, Effects.none )

    RoutingAction subAction ->
      let
        ( updatedRouting, fx ) =
          Routing.update subAction model.routing
      in
        ( { model | routing = updatedRouting }, Effects.map RoutingAction fx )
