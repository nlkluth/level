module Heroes.Detail where

import Html exposing (Html, div)
import Heroes.Actions exposing (..)
import Heroes.Models exposing (..)


type alias ViewModel =
  { hero : Hero }


--type Action = Fetch

--update : Action -> Model -> Model
--update action model =
--  case action of
--    Fetch ->
--      ( if model then model else loadHero )


--loadHero : Effects Action
--loadHero =
--  Http.get decodeUrl "http://google.com"
--    |> Task.toMaybe
--    |> Effects.task


--decodeUrl : Json.Decoder String
--decodeUrl = Json.at [] Json.string


view : Signal.Address Action -> ViewModel -> Html
view address model =
  div [] [Html.text model.hero.name]
