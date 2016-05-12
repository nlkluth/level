module Heroes.Stats (..) where

import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Heroes.Actions exposing (..)
import Heroes.Models exposing (Hero, HeroStats, HeroID)


type alias ViewModel =
  { heroes : List Hero
  , hero : Hero
  }


statsView : HeroStats -> Html
statsView stats =
  div []
    [ div [] [text ("armor = " ++ toString stats.armor)]
    , div [] [text ("armorperlevel = " ++ toString stats.armorperlevel)]
    , div [] [text ("attack damage = " ++ toString stats.attackdamage)]
    , div [] [text ("attackdamageperlevel = " ++ toString stats.attackdamageperlevel)]
    , div [] [text ("attackrange = " ++ toString stats.attackrange)]
    , div [] [text ("attackspeedoffset = " ++ toString stats.attackspeedoffset)]
    , div [] [text ("attackspeedperlevel = " ++ toString stats.attackspeedperlevel)]
    , div [] [text ("crit = " ++ toString stats.crit)]
    , div [] [text ("critperlevel = " ++ toString stats.critperlevel)]
    , div [] [text ("hp = " ++ toString stats.hp)]
    , div [] [text ("hpperlevel = " ++ toString stats.hpperlevel)]
    , div [] [text ("hpregen = " ++ toString stats.hpregen)]
    , div [] [text ("hpregenperlevel = " ++ toString stats.hpregenperlevel)]
    , div [] [text ("movespeed = " ++ toString stats.movespeed)]
    , div [] [text ("mp = " ++ toString stats.mp)]
    , div [] [text ("mpperlevel = " ++ toString stats.mpperlevel)]
    , div [] [text ("mpregen = " ++ toString stats.mpregen)]
    , div [] [text ("mpregenperlevel = " ++ toString stats.mpregenperlevel)]
    , div [] [text ("spellblock = " ++ toString stats.spellblock)]
    , div [] [text ("spellblockperlevel = " ++ toString stats.spellblockperlevel)]
    ]


view : ViewModel -> Html
view model =
  let
    heroStats =
      case model.hero.stats of
        Nothing ->
          div [] []

        Just stats ->
          statsView stats
  in
    div [class "stats"]
      [ div [] [heroStats] ]
