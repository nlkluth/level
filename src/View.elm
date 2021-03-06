module View (..) where

import Html exposing (..)
import Actions exposing (..)
import Models exposing (..)
import Heroes.List
import Heroes.Models exposing (HeroID)
import Routing
import String
import Heroes.List
import Heroes.Detail


view : Signal.Address Action -> AppModel -> Html
view address model =
  let _ = Debug.log "model" model
  in
    div []
      [ div [] [ navigation address model ]
      , div []
        [ flash address model
        , page address model
        ]
      ]


navigation : Signal.Address Action -> AppModel -> Html
navigation address model =
  div [] []


flash : Signal.Address Action -> AppModel -> Html
flash address model =
  if String.isEmpty model.errorMessage then
    span [] []
  else
    div [] [text model.errorMessage]


page : Signal.Address Action -> AppModel -> Html
page address model =
  case model.routing.route of
    Routing.HeroListRoute ->
      heroesListPage address model

    Routing.HeroDetailRoute heroId ->
      heroesDetailPage address model heroId

    Routing.NotFoundRoute ->
      notFoundView


heroesListPage : Signal.Address Action -> AppModel -> Html
heroesListPage address model =
  let viewModel =
    { heroes = model.heroes
    , hero = model.hero
    }

  in
    Heroes.List.view (Signal.forwardTo address HeroesAction) viewModel


heroesDetailPage : Signal.Address Action -> AppModel -> HeroID -> Html
heroesDetailPage address model heroId =
  let maybeHero (model, heroId) =
    if model.hero.id == heroId
    then Just model.hero
    else model.heroes
      |> List.filter (\hero -> hero.id == heroId)
      |> List.head

  in
    case maybeHero (model, heroId) of
      Just hero ->
        let viewModel =
          { hero = hero
          , heroes = model.heroes
          }

        in
          Heroes.Detail.view (Signal.forwardTo address HeroesAction) viewModel

      Nothing ->
        notFoundView


notFoundView : Html.Html
notFoundView =
  div [] [ text "Not found" ]
