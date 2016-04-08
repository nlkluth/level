module Heroes.Update (..) where

import Effects exposing (Effects, Never)
import Heroes.Actions exposing (..)
import Heroes.Models exposing (..)


update : Action -> Hero -> (Hero, Effects Action)
update action model =
  case action of
    Fetch ->
      ( model, Effects.none )

    AddHero heroData ->
      ( { model | heroes = (1) :: model.heroes }
        , Effects.none
      )

    ViewHero hero ->
      ( model, Effects.none )
