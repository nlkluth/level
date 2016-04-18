module Heroes.Update (..) where

import Effects exposing (Effects, Never)
import Heroes.Actions exposing (..)
import Heroes.Models exposing (Hero)
import Hop.Navigate exposing (navigateTo)
import Heroes.Detail


type alias UpdateModel =
  { heroes : List Hero
  , hero : Hero
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

            _ = Debug.log "\n error: \n" errorMessage

            fx = Signal.send model.showErrorAddress errorMessage
              |> Effects.task
              |> Effects.map TaskDone

          in
            ( model, Effects.none )

    FetchHeroDone result ->
      case result of
        Ok hero ->
          ( model, Effects.none )

        Err error ->
          ( model, Effects.none )

    TaskDone () ->
      ( model, Effects.none )

    ViewHero id ->
      let
        path = "/hero/" ++ (toString id)
        (heroDetail, fx) = Heroes.Detail.init id

        fxs =
          [ Effects.map HopAction (navigateTo path)
          , fx
          ]

        batch = Effects.batch fxs
      in
        ( { model | hero = heroDetail.hero }, batch )

    ListHeroes ->
      let path = "/"
      in
        ( model, Effects.map HopAction (navigateTo path) )

    HopAction _ ->
      ( model, Effects.none )
