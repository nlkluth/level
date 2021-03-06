module Heroes.Actions (..) where

import Effects exposing (Effects, Never)
import Http
import Heroes.Models exposing (HeroID, Hero)
import Hop


type Action
  = FetchAllDone (Result Http.Error (List Hero))
  | FetchHeroDone (Result Http.Error Hero)
  | ViewHero HeroID
  | ListHeroes
  | HopAction ()
  | TaskDone ()
