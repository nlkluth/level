module Heroes.Effects (..) where

import Effects exposing (Effects)
import Http
import Json.Decode as Decode exposing ((:=))
import Task
import Heroes.Models exposing (HeroID, Hero)
import Heroes.Actions exposing (..)


fetchAll : Effects Action
fetchAll =
  Http.get collectionDecoder fetchAllUrl
    |> Task.toResult
    |> Task.map FetchAllDone
    |> Effects.task


fetchAllUrl : String
fetchAllUrl =
  "https://global.api.pvp.net/api/lol/static-data/na/v1.2/champion?champData=image&api_key=587833f9-98ff-4cb8-92c8-ae1413a925af"


collectionDecoder : Decode.Decoder (List Hero)
collectionDecoder =
  Decode.at ["data"] (Decode.keyValuePairs memberDecoder)
    |> Decode.map (List.map snd)


memberDecoder : Decode.Decoder Hero
memberDecoder =
  Decode.object3
    Hero
    ("id" := Decode.int)
    ("name" := Decode.string)
    ("title" := Decode.string)
