module Actions (..) where

import Heroes.Actions
import Routing


type Action
  = NoOp
  | RoutingAction Routing.Action
  | HeroesAction Heroes.Actions.Action
  | ShowError String
