module HeroList where

import Html exposing (..)
import Html.Events exposing (onClick)

type alias Model =
  { heroes : List ( ID ) }

type alias ID = Int


init : Model
init = { heroes = [] }


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

view : Signal.Address Action -> Model -> Html
view address model =
  let heroes = List.map (createDiv) model.heroes
  in
    div []
      [ button [ onClick address AddHero ] [ text "test" ]
      , div [] (heroes)
      ]
