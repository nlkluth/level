module Heroes.Stats (..) where

import Html exposing (Html, div)
import Heroes.Actions exposing (..)
import Heroes.Models exposing (Hero, HeroID)


type alias ViewModel =
  { heroes : List Hero
  , hero : Hero
  }


view : Signal.Address Action -> ViewModel -> Html
view address model =
  div [] []
