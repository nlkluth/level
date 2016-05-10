module Heroes.Stats (..) where

import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Heroes.Actions exposing (..)
import Heroes.Models exposing (Hero, HeroStats, HeroID)


type alias ViewModel =
  { hero : Hero }


statsView : HeroStats -> Html
statsView stats =
  div [] []


view : Signal.Address Action -> ViewModel -> Html
view adress model =
  div [class "stats"]
    []
