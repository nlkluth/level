module Models (..) where

import Heroes.Models exposing (Hero)
import Routing


type alias AppModel =
  { heroes: List Hero
  , routing = Routing.initalModel
  }