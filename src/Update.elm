module Update (..) where

import Effects exposing (Effects)
import Models exposing (AppModel)
import Mailboxes exposing (..)
import Actions exposing (..)
import Heroes.Update
import Routing


update : Action -> AppModel -> ( AppModel, Effects Action )
update action model =
  case action of
    HeroesAction subAction ->
      let
        updateModel =
          { heroes = model.heroes
          , hero = model.hero
          , showErrorAddress = Signal.forwardTo actionsMailbox.address ShowError
          }

        ( updatedHeroes, fx ) =
          Heroes.Update.update subAction updateModel
      in
        ( { model |
            heroes = updatedHeroes.heroes
          , hero = updatedHeroes.hero
          }
          , Effects.map HeroesAction fx
        )

    NoOp ->
      ( model, Effects.none )

    ShowError message ->
      ( { model | errorMessage = message }, Effects.none )

    RoutingAction subAction ->
      let
        ( updatedRouting, fx ) =
          Routing.update subAction model.routing
      in
        ( { model | routing = updatedRouting }, Effects.map RoutingAction fx )
