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
  | ViewHero (ID)

update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    Fetch ->
      ( model, Effects.none )

    AddHero heroData ->
      ( { model | heroes = (1) :: model.heroes }
        , Effects.none
      )

    ViewHero id ->
      ( model, Effects.none )


createDiv hero =
  button [ onClick address (ViewHero hero.id) ] [ text "View" ]

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
