module Heroes.Stats (..) where

import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Heroes.Actions exposing (..)
import Heroes.Models exposing (Hero, HeroStats, HeroID)


type alias ViewModel =
  { heroes : List Hero
  , hero : Hero
  }


statsView : ViewModel -> Html
statsView model =
  let getHeroStats (stats) =
    case stats of
      Nothing ->
        div [] []

      Just {stats} ->
        div [] [text (toString stats.armor)]
  in
    div [] [getHeroStats model.stats]


view : ViewModel -> Html
view model =
  div [class "stats"]
    [ div [] [statsView model] ]
