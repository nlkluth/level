module Heroes.Update (..) where

import Effects exposing (Effects, Never)
import Heroes.Actions exposing (..)
import Heroes.Models exposing (Hero)
import Hop.Navigate exposing (navigateTo)


type alias UpdateModel =
  { heroes : List Hero
  , showErrorAddress : Signal.Address String
  }


update : Action -> UpdateModel -> (UpdateModel, Effects Action)
update action model =
  case action of
    FetchAllDone result ->
      case result of
        Ok heroes ->
          ( { model | heroes = heroes }, Effects.none )

        Err error ->
          let
            errorMessage = toString error

            fx = Signal.send model.showErrorAddress errorMessage
              |> Effects.task
              |> Effects.map TaskDone

          in
            ( model, Effects.none )

    FetchHeroDone result ->
      case result of
        Ok hero ->
          ( model, Effects.none )

        Err errror ->
          ( model, Effects.none )

    TaskDone () ->
      ( model, Effects.none )

    ViewHero id ->
      let path = "/hero/" ++ (toString id)
      in
        ( model, Effects.map HopAction (navigateTo path) )

    ListHeroes ->
      let path = "/"
      in
        ( model, Effects.map HopAction (navigateTo path) )

    HopAction _ ->
      ( model, Effects.none )
