module HeroList where

import Html exposing (..)


type alias Model =
  { heroes : List ( ID )
  }

type alias ID = Int


init : Model
init =
  { heroes = []
  }


type Action
  = Fetch

update : Action -> Model -> Model
update action model =
  case action of
    Fetch ->
      model


view : Signal.Address Action -> Model -> Html
view address model =
  div []
    [Html.text "Hello world"]
