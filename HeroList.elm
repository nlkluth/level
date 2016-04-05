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


type Action
  = Fetch
  | AddHero (Maybe String)

update : Action -> Model -> Model
update action model =
  case action of
    Fetch ->
      model

    AddHero heroData ->
      { model | heroes = (1) :: model.heroes }


createDiv hero =
  Html.text "test"

fetchHeroList : Effects Action
fetchHeroList =
  Http.get decodeUrl "http://google.com/"
    |> Task.toMaybe
    |> Task.map AddHero
    |> Effects.task

decodeUrl : Json.Decoder String
decodeUrl = Json.at [] Json.string


view : Signal.Address Action -> Model -> Html
view address model =
  let heroes = List.map (createDiv) model.heroes
  in
    div [] (heroes)
