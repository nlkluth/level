module Heroes.Effects (..) where

import Effects exposing (Effects)
import Http
import Json.Decode as Decode exposing ((:=))
import Task
import Heroes.Models exposing (HeroID, Hero, HeroImage, HeroStats)
import Heroes.Actions exposing (..)
import Json.Decode.Extra exposing (apply)


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
  Decode.at ["data"] (Decode.keyValuePairs memberDecoder)
    |> Decode.map (List.map snd)


detailDecoder : Decode.Decoder Hero
detailDecoder =
  Decode.object4
    Hero
    ("id" := Decode.int)
    ("name" := Decode.string)
    ("title" := Decode.string)
    ("image" := imageDecoder)
    --("stats" := statsDecoder)
    --("spells" := spellsDecoder)


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


--metaDecoder f = f
--  `apply` ("critperlevel" := Decode.float)
--  `apply` ("hp" := Decode.float)
--  `apply` ("hpperlevel" := Decode.float)
--  `apply` ("hpregen" := Decode.float)
--  `apply` ("hpregenperlevel" := Decode.float)
--  `apply` ("movespeed" := Decode.float)
--  `apply` ("mp" := Decode.float)
--  `apply` ("mpperlevel" := Decode.float)
--  `apply` ("mpregen" := Decode.float)
--  `apply` ("mpregenperlevel" := Decode.float)
--  `apply` ("spellblock" := Decode.float)
--  `apply` ("spellblockperlevel" := Decode.float)


--statsDecoder : Decode.Decoder HeroStats
--statsDecoder =
--  metaDecoder HeroStats
--    `apply` ("armor" := Decode.float)
--    `apply` ("armorperlevel" := Decode.float)
--    `apply` ("attackdamage" := Decode.float)
--    `apply` ("attackdamageperlevel" := Decode.float)
--    `apply` ("attackrange" := Decode.float)
--    `apply` ("attackspeedoffset" := Decode.float)
--    `apply` ("attackspeedperlevel" := Decode.float)
--    `apply` ("crit" := Decode.float)

