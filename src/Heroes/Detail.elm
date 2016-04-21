module Heroes.Detail where

import Effects exposing (Effects)
import Heroes.Effects
import Html exposing (Html, div, button, img)
import Heroes.Actions exposing (..)
import Heroes.Models exposing (Hero, HeroID)
import Html.Events exposing (onClick)
import Html.Attributes exposing (src)
import Heroes.Stats


type alias ViewModel =
  { heroes : List Hero
  , hero : Hero
  }


init : HeroID -> ( ViewModel, Effects Action )
init heroId =
  ( { heroes = []
    , hero = Heroes.Models.emptyHero
    }
  , Heroes.Effects.fetchHeroData heroId
  )


view : Signal.Address Action -> ViewModel -> Html
view address model =
  div []
    [ button [onClick address ListHeroes] [Html.text "Back"]
    , div [] [Html.text model.hero.name]
    , img
        [src ("http://ddragon.leagueoflegends.com/cdn/5.2.1/img/champion/" ++ model.hero.image.full)] []
    , Heroes.Stats.view (Signal.forwardTo address HeroesAction) model
    ]
