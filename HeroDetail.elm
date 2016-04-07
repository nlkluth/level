module HeroDetail where

import Html exposing (div)

type alias Model = { ID: ID }
type alias ID = Int


init : Model
init = fetchHero


type Action = Fetch

update : Action -> Model -> Model
update action model =
  case action of
    Fetch ->
      ( if model then model else loadHero )


loadHero : Effects Action
loadHero =
  Http.get decodeUrl "http://google.com"
    |> Task.toMaybe
    |> Effects.task


decodeUrl : Json.Decoder String
decodeUrl = Json.at [] Json.string


view : Signal.Address Action -> Model -> Html
view address model =
  div [] (model)
