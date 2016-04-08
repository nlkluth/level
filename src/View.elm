module View (..) where

import Html exposing (..)
import Actions exposing (..)
import Models exposing (..)
import Heroes.List

view : Signal.Address Action -> AppModel -> Html
view address model =
  div []
    [ page address model ]


page : Signal.Address Action -> AppModel -> Html.Html
page address model =
  let
    viewModel =
      { heroes = model.heroes
      }
  in
    Heroes.List.view (Signal.forwardTo address HeroesAction) viewModel
