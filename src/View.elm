module View (..) where

import Html exposing (..)
import Actions exposing (..)
import Models exposing (..)
import Heroes.List
import Heroes.Models exposing (HeroID)
import Routing
import Heroes.List
import Heroes.Detail

view : Signal.Address Action -> AppModel -> Html
view address model =
  let _ = Debug.log "model" model
  in
    div []
      [ page address model ]


page : Signal.Address Action -> AppModel -> Html.Html
page address model =
  case model.routing.route of
    Routing.HeroListRoute ->
      heroesListPage address model

    Routing.HeroDetailRoute heroId ->
      heroesDetailPage address model heroId

    Routing.NotFoundRoute ->
      notFoundView


heroesListPage : Signal.Address Action -> AppModel -> Html.Html
heroesListPage address model =
  let viewModel =
    { heroes = model.herores }
  in
    Heroes.List.view (Signal.forwardTo address HeroesAction) viewModel


heroesDetailPage : Signal.Address Action -> AppModel -> HeroID -> Html.Html
heroesDetailPage address model heroId =
  let viewModel = { hero = "test" }
  in
    Heroes.Detail.view (Signal.forwardTo address HeroesAction) viewModel


notFoundView : Html.Html
notFoundView =
  div [] [ text "Not found" ]
