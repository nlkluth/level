module Heroes.Stats (..) where

import Html exposing (Html, div)
import Html.Attributes exposing (class)
import Heroes.Actions exposing (..)
import Heroes.Models exposing (Hero, HeroID)


type alias ViewModel =
  { heroes : List Hero
  , hero : Hero
  }


view : ViewModel -> Html
view model =
  div [class "stats"] []
