module Models (..) where

import Heroes.Models exposing (Hero)
import Routing


emptyHero =
  { id = 0
  , name = ""
  , title = ""
  , image = { full = "" }
  }


type alias AppModel =
  { heroes: List Hero
  , hero: Hero
  , routing: Routing.Model
  , errorMessage: String
  }


initialModel : AppModel
initialModel =
  { heroes = []
  , hero = emptyHero
  , routing = Routing.initialModel
  , errorMessage = ""
  }
