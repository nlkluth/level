module Heroes.Effects (..) where

import Effects exposing (Effects)
import Http
import Json.Decode as Decode exposing (succeed, maybe, (:=))
import Task
import Heroes.Models exposing (HeroID, Hero, HeroImage, HeroStats)
import Heroes.Actions exposing (..)
import Json.Decode.Extra exposing ((|:))


fetchHeroData : HeroID -> Effects Action
fetchHeroData heroId =
  Http.get detailDecoder (fetchHeroUrl heroId)
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
  "https://global.api.pvp.net/api/lol/static-data/na/v1.2/champion/" ++ toString heroId ++ "?champData=image,spells,stats&api_key=587833f9-98ff-4cb8-92c8-ae1413a925af"


fetchAllUrl : String
fetchAllUrl =
  "https://global.api.pvp.net/api/lol/static-data/na/v1.2/champion?champData=image&api_key=587833f9-98ff-4cb8-92c8-ae1413a925af"


collectionDecoder : Decode.Decoder (List Hero)
collectionDecoder =
  Decode.at ["data"] (Decode.keyValuePairs detailDecoder)
    |> Decode.map (List.map snd)


detailDecoder : Decode.Decoder Hero
detailDecoder =
  succeed Hero
    |: ("id" := Decode.int)
    |: ("name" := Decode.string)
    |: ("title" := Decode.string)
    |: ("image" := imageDecoder)
    |: (maybe ("stats" := statsDecoder))
    --|: ("spells" := spellsDecoder)


imageDecoder: Decode.Decoder HeroImage
imageDecoder =
  Decode.object1
    HeroImage
    ("full" := Decode.string)


statsDecoder : Decode.Decoder HeroStats
statsDecoder =
  succeed HeroStats
    |: ("armor" := Decode.float)
    |: ("armorperlevel" := Decode.float)
    |: ("attackdamage" := Decode.float)
    |: ("attackdamageperlevel" := Decode.float)
    |: ("attackrange" := Decode.float)
    |: ("attackspeedoffset" := Decode.float)
    |: ("attackspeedperlevel" := Decode.float)
    |: ("crit" := Decode.float)
    |: ("critperlevel" := Decode.float)
    |: ("hp" := Decode.float)
    |: ("hpperlevel" := Decode.float)
    |: ("hpregen" := Decode.float)
    |: ("hpregenperlevel" := Decode.float)
    |: ("movespeed" := Decode.float)
    |: ("mp" := Decode.float)
    |: ("mpperlevel" := Decode.float)
    |: ("mpregen" := Decode.float)
    |: ("mpregenperlevel" := Decode.float)
    |: ("spellblock" := Decode.float)
    |: ("spellblockperlevel" := Decode.float)

