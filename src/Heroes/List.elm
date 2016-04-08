module Heroes.List where


import Html exposing (Html, div, button, text)
import Html.Events exposing (onClick)
import Http
import Task exposing (Task)
import Effects exposing (Effects, Never)
import Json.Decode as Json
import Heroes.Actions exposing (..)
import Heroes.Models exposing (..)


init : (Hero, Effects Action)
init =
  ( { heroes = [] }
  , fetchHeroList
  )


createDiv address hero =
  div []
    [ button [ onClick address (ViewHero hero) ] [ text "View" ] ]


fetchHeroList : Effects Action
fetchHeroList =
  Http.get decodeUrl "https://global.api.pvp.net/api/lol/static-data/na/v1.2/champion?champData=image&api_key=587833f9-98ff-4cb8-92c8-ae1413a925af"
    |> Task.toMaybe
    |> Task.map AddHero
    |> Effects.task


decodeUrl : Json.Decoder String
decodeUrl = Json.at [] Json.string


view : Signal.Address Action -> Hero -> Html
view address model =
  div []
    [ div [] [ text "Heroes" ]
    , div [] (List.map (createDiv address) model.heroes)
    ]
