module Models (..) where

import Heroes.Models exposing (Hero)
import Routing


type alias AppModel =
  { heroes: List Hero
  , hero: Hero
  , routing: Routing.Model
  , errorMessage: String
  }


initialModel : AppModel
initialModel =
  { heroes = []
  , hero = Heroes.Models.emptyHero
  , routing = Routing.initialModel
  , errorMessage = ""
  }
