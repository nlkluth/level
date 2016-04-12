module Heroes.Detail where

import Effects exposing (Effects)
import Heroes.Effects
import Html exposing (Html, div, button)
import Heroes.Actions exposing (..)
import Heroes.Models exposing (..)
import Html.Events exposing (onClick)


type alias ViewModel =
  { hero : Hero }


init :  HeroID -> ( Hero -> ViewModel, Effects Action )
init heroId =
  ( ViewModel, (Heroes.Effects.fetchHeroData heroId) )


view : Signal.Address Action -> ViewModel -> Html
view address model =
  div []
    [ button [onClick address ListHeroes] [Html.text "Back"]
    , div [] [Html.text model.hero.name]
    ]
