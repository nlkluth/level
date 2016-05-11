module Heroes.Stats (..) where

import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Heroes.Actions exposing (..)
import Heroes.Models exposing (Hero, HeroStats, HeroID)


type alias ViewModel =
  { heroes : List Hero
  , hero : Hero
  }


statsView : HeroStats -> Html
statsView stats =
  div [] [text ("armor = " ++ toString stats.armor)]


view : ViewModel -> Html
view model =
  let
    heroStats =
      case model.hero.stats of
        Nothing ->
          div [] []

        Just stats ->
          statsView stats
  in
    div [class "stats"]
      [ div [] [heroStats] ]
