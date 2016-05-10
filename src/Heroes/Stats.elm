module Heroes.Stats (..) where

import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Heroes.Actions exposing (..)
import Heroes.Models exposing (Hero, HeroID)


type alias ViewModel =
  { hero : Hero }


statsView stat =
  div [] [text stat]


--view : ViewModel -> Html
view model =
  div [class "stats"] [model.stats.map statsView]
