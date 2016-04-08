module Heroes.Actions (..) where

import Effects exposing (Effects, Never)
import Heroes.Models exposing (..)


type Action
  = Fetch
  | AddHero (Maybe String)
  | ViewHero (HeroID)
