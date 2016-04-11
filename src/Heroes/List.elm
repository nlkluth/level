module Heroes.List where


import Html exposing (Html, div, a, text)
import Html.Events exposing (onClick)
import Http
import Task exposing (Task)
import Effects exposing (Effects, Never)
import Json.Decode as Json
import Heroes.Actions exposing (..)
import Heroes.Models exposing (..)


type alias ViewModel =
  { heroes : List Hero }


createDiv address hero =
  div []
    [ a [ onClick address (ViewHero hero.id) ]
      [ div [] [ text hero.name ]
      , div [] [ text hero.title]
      ]
    ]


decodeUrl : Json.Decoder String
decodeUrl = Json.at [] Json.string


view : Signal.Address Action -> ViewModel -> Html
view address model =
  div []
    [ div [] [ text "Heroes" ]
    , div [] (List.map (createDiv address) model.heroes)
    ]
