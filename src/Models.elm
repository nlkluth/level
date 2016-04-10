module Models (..) where

import Heroes.Models exposing (Hero)
import Routing


type alias AppModel =
  { heroes: List Hero
  , routing: Routing.Model
  , errorMessage: String
  }


initialModel : AppModel
initialModel =
  { heroes = []
  , routing = Routing.initialModel
  , errorMessage = ""
  }
