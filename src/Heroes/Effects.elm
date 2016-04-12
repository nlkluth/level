module Heroes.Effects (..) where

import Effects exposing (Effects)
import Http
import Json.Decode as Decode exposing ((:=))
import Task
import Heroes.Models exposing (HeroID, Hero, HeroImage)
import Heroes.Actions exposing (..)


fetchHeroData : HeroID -> Effects Action
fetchHeroData heroId =
  Http.get memberDecoder (fetchHeroUrl heroId)
    |> Task.toResult
    |> Task.map FetchHeroDone
    |> Effects.task


fetchAll : Effects Action
fetchAll =
  Http.get collectionDecoder fetchAllUrl
    |> Task.toResult
    |> Task.map FetchAllDone
    |> Effects.task


fetchHeroUrl : HeroID -> String
fetchHeroUrl heroId =
  "https://global.api.pvp.net/api/lol/static-data/na/v1.2/champion/" ++ toString heroId ++ "?api_key=587833f9-98ff-4cb8-92c8-ae1413a925af"


fetchAllUrl : String
fetchAllUrl =
  "https://global.api.pvp.net/api/lol/static-data/na/v1.2/champion?champData=image&api_key=587833f9-98ff-4cb8-92c8-ae1413a925af"


collectionDecoder : Decode.Decoder (List Hero)
collectionDecoder =
  Decode.at ["data"] (Decode.keyValuePairs memberDecoder)
    |> Decode.map (List.map snd)


memberDecoder : Decode.Decoder Hero
memberDecoder =
  Decode.object4
    Hero
    ("id" := Decode.int)
    ("name" := Decode.string)
    ("title" := Decode.string)
    ("image" := imageDecoder)


imageDecoder: Decode.Decoder HeroImage
imageDecoder =
  Decode.object1
    HeroImage
    ("full" := Decode.string)
