module Routing (..) where

import Task exposing (Task)
import Effects exposing (Effects, Never)
import Hop
import Hop.Types exposing (Location, PathMatcher, Router, newLocation)
import Hop.Navigate exposing (navigateTo)
import Hop.Matchers exposing (match1, match2, match3, int)
import Heroes.Models exposing (HeroID)


type Route
  = HeroListRoute
  | HeroDetailRoute HeroID
  | NotFoundRoute


type Action
  = HopAction ()
  | ApplyRoute ( Route, Location )
  | NavigateTo String


type alias Model =
  { location : Location
  , route : Route
  }


initialModel : Model
initialModel =
  { location = newLocation
  , route = HeroListRoute
  }


update : Action -> Model -> ( Model, Effects Action )
update action model =
  case action of
    NavigateTo path ->
      ( model, Effects.map HopAction (navigateTo path) )

    ApplyRoute ( route, location ) ->
      ( { model | route = route, location = location }, Effects.none )

    HopAction () ->
      ( model, Effects.none )


indexMatcher : PathMatcher Route
indexMatcher =
  match1 HeroListRoute "/"


heroDetailMatch : PathMatcher Route
heroDetailMatch =
  match2 HeroDetailRoute "/hero/" int


matchers : List (PathMatcher Route)
matchers =
  [ indexMatcher
  , heroDetailMatch
  ]


router : Router Route
router =
  Hop.new
    { matchers = matchers
    , notFound = NotFoundRoute
    }


run : Task () ()
run =
  router.run


signal : Signal Action
signal =
  Signal.map ApplyRoute router.signal
