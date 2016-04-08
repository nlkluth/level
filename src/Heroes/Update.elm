module Heroes.Update (..) where

import Effects exposing (Effects, Never)
import Heroes.Actions exposing (..)
import Heroes.Models exposing (..)


type alias UpdateModel =
  { heroes : List Hero }


update : Action -> UpdateModel -> (UpdateModel, Effects Action)
update action model =
  case action of
    Fetch ->
      ( model, Effects.none )

    AddHero heroData ->
      ( { model |
            heroes = ({id = 1, name = "test", title = ""}) :: model.heroes }
        , Effects.none
      )

    ViewHero hero ->
      ( model, Effects.none )
