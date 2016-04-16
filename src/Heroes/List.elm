module Heroes.List where


import Html exposing (Html, div, a, text, img)
import Html.Attributes exposing (src, class)
import Html.Events exposing (onClick)
import Http
import Task exposing (Task)
import Effects exposing (Effects, Never)
import Json.Decode as Json
import Heroes.Actions exposing (..)
import Heroes.Models exposing (..)


type alias ViewModel =
  { heroes : List Hero
  , hero : Hero
  }


createDiv address hero =
  div [class "hero"]
    [ a [ onClick address (ViewHero hero.id) ]
      [ div [class "hero-info"]
        [ text (hero.name ++ " | ")
        , text hero.title
        ]
      , img
        [src ("http://ddragon.leagueoflegends.com/cdn/5.2.1/img/champion/" ++ hero.image.full)] []
      ]
    ]


decodeUrl : Json.Decoder String
decodeUrl = Json.at [] Json.string


view : Signal.Address Action -> ViewModel -> Html
view address model =
  div []
    [ div [] [ text "Heroes" ]
    , div [class "content"] (List.map (createDiv address) model.heroes)
    ]
