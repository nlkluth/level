module HeroList where

import Html exposing (..)
import Html.Events exposing (onClick)
import Http exposing (..)
import Task exposing (Task)
import Effects exposing (Effects, Never)
import Json.Decode as Json

type alias Model =
  { heroes : List ( ID ) }

type alias ID = Int


init : (Model, Effects Action)
init =
  ( { heroes = [] }
  , fetchHeroList
  )


type Action = Fetch | AddHero

update : Action -> Model -> Model
update action model =
  case action of
    Fetch ->
      model

    AddHero ->
      { model | heroes = (1) :: model.heroes }


createDiv hero =
  Html.text "test"

fetchHeroList : Effects Action
fetchHeroList =
  Http.get Http.url "http://google.com/"
    |> Task.toMaybe
    |> Effects.task

decodeUrl : Json.Decoder String
decodeUrl = Json.string "{}"


view : Signal.Address Action -> Model -> Html
view address model =
  let heroes = List.map (createDiv) model.heroes
  in
    div []
      [ button [ onClick address AddHero ] [ text "test" ]
      , button [ onClick address Fetch ] [ text "populate" ]
      , div [] (heroes)
      ]
